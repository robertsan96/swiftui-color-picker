//
//  ContentView.swift
//  SwiftUI-ColorPicker
//
//  Created by Robert Sandru on 5/9/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            SliderColorView().tabItem {
                Text("da")
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
