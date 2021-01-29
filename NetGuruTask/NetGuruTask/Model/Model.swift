//
//  Model.swift
//  NetGuruTask
//
//  Created by Jakub Sumionka on 18/01/2021.
//

import Foundation
import Starscream
import CoreML

class Model: WebSocketDelegate, ObservableObject {
   
    @Published var trades = [Trade]()
    @Published var predictedPrice : Double
    @Published var isConnected = false
    
    var socket: WebSocket!

    let server = WebSocketServer()
//    let mlmodel : BitcoinSentiment = {
//        do{
//            let config = MLModelConfiguration()
//            return try BitcoinSentiment(configuration: config)
//        }catch{
//            print(error)
//            fatalError("Bummer! ML won't work.")
//        }
//    }()
    init() {
        predictedPrice = 0
        var request = URLRequest(url: URL(string: "wss://ws.bitstamp.net")!) //https://localhost:8080
        request.timeoutInterval = 5
        socket = WebSocket(request: request)
        socket.delegate = self
        socket.connect()
       
        
    }
    
    // MARK: - WebSocketDelegate
    func didReceive(event: WebSocketEvent, client: WebSocket) {
        switch event {
        case .connected(let headers):
            isConnected = true
            print("websocket is connected: \(headers)")
        case .disconnected(let reason, let code):
            isConnected = false
            print("websocket is disconnected: \(reason) with code: \(code)")
        case .text(let string):
            print(string)
            let data = "\(string)".data(using: .utf8)!
    
            do{
                let trade = try JSONDecoder().decode(Trade.self, from: data)

                print(trade as Any)
                print(trade.data?.amountStr as Any)
                predictprice(predictedPrice: (trade.data?.amount) ?? 1)
                trades.append(trade)
                
            }catch DecodingError.dataCorrupted(let context) {
                print(context)
            } catch DecodingError.keyNotFound(let key, let context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch DecodingError.valueNotFound(let value, let context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch DecodingError.typeMismatch(let type, let context) {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
            
        case .binary(let data):
            print("Received data: \(data.count)")
        case .ping(_):
            break
        case .pong(_):
            break
        case .viabilityChanged(_):
            break
        case .reconnectSuggested(_):
            break
        case .cancelled:
            isConnected = false
        case .error(let error):
            isConnected = false
            handleError(error)
        }
    }
    
    func handleError(_ error: Error?) {
        if let e = error as? WSError {
            print("websocket encountered an error: \(e.message)")
        } else if let e = error {
            print("websocket encountered an error: \(e.localizedDescription)")
        } else {
            print("websocket encountered an error")
        }
    }
    
    // MARK: Write Text Action
    
    func writeText() {
        socket.write(string: "{\"event\":\"bts:subscribe\",\"data\":{\"channel\":\"live_trades_btcusd\"}}")
    }
    
    // MARK: Disconnect Action
    
    func disconnect() {
        if isConnected {
            socket.disconnect()
        }
    }
    
    // MARK: Connect/Disconnect
    
    func connectdisconnect(){
    if isConnected{
    socket.disconnect()
    }
    else if !isConnected {
        socket.connect()
    }
    }
    
    // MARK: Predict Price
    
    func predictprice(predictedPrice: Double){
        let mlmodel : BitcoinSentiment = {
            do{
                let config = MLModelConfiguration()
                return try BitcoinSentiment(configuration: config)
            }catch{
                print(error)
                fatalError("Bummer! ML won't work.")
            }
        }()
        guard let modeloutput = try? mlmodel.prediction(Price: predictedPrice) else {
            print("Could not machine learn")
            fatalError()
        }
        self.predictedPrice = modeloutput.Sentiment
    }

}

