//
//  ContentView.swift
//  Daily Work Load
//
//  Created by Christopher Huffaker on 4/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("Pi")
                .padding()
            Button("Run & Reset Report") {
                reportX(tracker: tracker)
            }
            .frame(width: 200, height: 50)
            .buttonStyle(.borderless)
            .background(Color.gray)
            .padding(10)
            
            
            
            Button("Run Report") {
                reportD(tracker: tracker)
            }
            .frame(width: 200, height: 150)
            .buttonStyle(.bordered)
            .background(Color.blue)
            .controlSize(.large)
            
            
            
        }
        .frame(width: 500, height: 500)
        .padding()
    }
}

#Preview {
    ContentView()
}
