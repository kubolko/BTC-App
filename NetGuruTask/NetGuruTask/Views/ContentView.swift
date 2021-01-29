//
//  ContentView.swift
//  NetGuruTask
//
//  Created by Jakub Sumionka on 18/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = Model()
    @State var scale: CGFloat = 1
    
    var body: some View {
        NavigationView{
            ZStack(){
                BackgroundSender()
                VStack(){
                    Spacer()
                        .frame(height: 50)
                    UpperView(count: model.trades.count, prediction: model.predictedPrice, model: model)
                    ConnectButton(model: model)
                    ScrollView{
 
                        ForEach(model.trades.reversed(), id: \.self){trade in
                            TradeViewNew(trade: trade)
                                .animation(.default)
                                
                        }
                
                    }.frame(height: 500)
                }.animation(nil)
            }.edgesIgnoringSafeArea(.all)
            
            
        }
    }
}

