//
//  ConnectButton.swift
//  NetGuruTask
//
//  Created by Jakub Sumionka on 22/01/2021.
//

import SwiftUI

struct ConnectButton: View {
    
    let model : Model
    
    var body: some View {
        ZStack(){
            Rectangle()
                .fill(Color.orange)
                .frame(width: 300, height: 50, alignment: .center)
                .cornerRadius(23)
            Button(action: model.writeText, label:{ Text("Send request")
                .foregroundColor(Color.white)
                .font(.callout)
            }
            )
        }.clipped()
        .shadow(radius: 10)
    }
}

struct ConnectButton_Previews: PreviewProvider {
    static var previews: some View {
        ConnectButton(model: Model())
    }
}
