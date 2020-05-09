//
//  ContentView.swift
//  SwiftUI-ColorPicker
//
//  Created by Robert Sandru on 5/9/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var red: Double = 23
    @State private var green: Double = 23
    @State private var blue: Double = 23
    
    private var builtColor: Color {
        get {
            return Color(red: red/255, green: green/255, blue: blue/255)
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle().fill(builtColor).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                SliderView(label: "Red", value: $red)
                SliderView(label: "Green", value: $green)
                SliderView(label: "Blue", value: $blue)
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
