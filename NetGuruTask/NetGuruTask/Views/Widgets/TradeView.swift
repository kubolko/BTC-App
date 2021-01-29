//
//  TradeView.swift
//  NetGuruTask
//
//  Created by Jakub Sumionka on 20/01/2021.
//

import SwiftUI

struct TradeView: View {
    
    let trade : Trade
    
    var body: some View {
        
        ZStack(){
            Rectangle()
                .fill(Color.red)
                .frame(width: 250, height: 50)
            Text("\(trade.data?.amount ?? 0)")
                .frame(width: 250, height: 50)
        }
    }
}

struct TradeView_Previews: PreviewProvider {
    static var previews: some View {
        TradeView(trade: Trade(data: DataClass(buyOrderid: 1, amountStr: "Example", timestamp: "Example", microtimestamp: "Example", id: 420, amount: 2137, sellOrderid: 420, priceStr: "Example", type: 2137, price: 420), event: "Example", channel: "Example"))
    }
}
