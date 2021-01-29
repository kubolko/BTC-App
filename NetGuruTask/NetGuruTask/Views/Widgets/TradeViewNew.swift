//
//  TradeViewNew.swift
//  NetGuruTask
//
//  Created by Jakub Sumionka on 21/01/2021.
//

import SwiftUI

struct TradeViewNew: View {
    
    let trade : Trade
    @State private var showShareSheet = false
    
    var body: some View {
        ZStack(){
            Image("TradeBG")
                .resizable()
                .frame(width: 300, height: 500)
            VStack(){
                VStack(){
                    Text("New Trade")
                    Text(trade.data?.amountStr ?? "Error")
                        .bold()
                        .foregroundColor(Color.orange)
                    if trade.data?.type == 0 {
                        Text("Sell")
                    }else if trade.data?.type == 1{
                        Text("Buy")
                        
                        
                    }
                }    .frame(width: 300, height: 100)
                Spacer()
                    .frame(height: 25)
                VStack(alignment: .leading, spacing: 10){
                    HStack(){
                    Text("Amount")
                        .foregroundColor(.secondary)
                        Spacer()
                    }.padding(.horizontal)
                    Text("\(trade.data?.amount ?? 0) BTC")
                        .fontWeight(.bold)
                        .font(.title2)
                        .padding(.horizontal)
                    Text("Price")
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                    Text("\(trade.data?.price ?? 0) $")
                        .fontWeight(.bold)
                        .font(.title2)
                        .padding(.horizontal)
                    Text("Time")
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                    Text("\(trade.data?.timestamp ?? "")")
                        .fontWeight(.bold)
                        .font(.title2)
                        .padding(.horizontal)
                    Text("Sellers and buyers id")
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                    Text("\(trade.data?.sellOrderid ?? 0) and \(trade.data?.buyOrderid ?? 0)")
                        .fontWeight(.bold)
                        .font(.title2)
                        .padding(.horizontal)
                }    .frame(width: 300)
                Spacer()
                Button(action: {
                                self.showShareSheet = true
                            }) {
                    ZStack(){Rectangle()
                        .fill(Color.orange)
                        .frame(width: 200,height: 46)
                        .cornerRadius(23, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                Text("Share").bold()
                                    .foregroundColor(Color.white)
                    }
                            }
                Spacer()
                        }
            .sheet(isPresented: $showShareSheet) {
                ShareSheet(activityItems: ["Hello World"])
                        }
            }    .frame(width: 300, height: 500)
        .clipped()
        }
    }


struct TradeViewNew_Previews: PreviewProvider {
    static var previews: some View {
        TradeViewNew(trade: Trade(data: DataClass(buyOrderid: 420, amountStr: "Example", timestamp: "Example", microtimestamp: "Example", id: 420, amount: 420, sellOrderid: 420, priceStr: "Example", type: 420, price: 420), event: "Example", channel: "Example"))
    }
}
struct ShareSheet: UIViewControllerRepresentable {
    typealias Callback = (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) -> Void
    
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    let excludedActivityTypes: [UIActivity.ActivityType]? = nil
    let callback: Callback? = nil
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: applicationActivities)
        controller.excludedActivityTypes = excludedActivityTypes
        controller.completionWithItemsHandler = callback
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // nothing to do here
    }
}
