//
//  ContentView.swift
//  test
//
//  Created by Yaroslav Admin on 2020-11-25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, \(FooGetVal(42))!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
