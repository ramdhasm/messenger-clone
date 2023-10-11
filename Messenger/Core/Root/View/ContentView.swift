//
//  ContentView.swift
//  Messenger
//
//  Created by Ramdhas on 2023-09-27.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentVM = ContentViewModel()
    
    var body: some View {
        Group {
            if contentVM.userSession != nil {
                InboxView()
            } else {
                LoginView()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
