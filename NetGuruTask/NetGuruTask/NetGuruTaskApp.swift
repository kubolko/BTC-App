//
//  NetGuruTaskApp.swift
//  NetGuruTask
//
//  Created by Jakub Sumionka on 18/01/2021.
//

import SwiftUI
import Starscream


@main
struct NetGuruTaskApp: App {
    
    @ObservedObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: model.writeText)
        }
    }
}
