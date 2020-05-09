//
//  SliderColorView.swift
//  SwiftUI-ColorPicker
//
//  Created by Robert Sandru on 5/9/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct SliderColorView: View {
    
    @State private var red: Double = 23
    @State private var green: Double = 23
    @State private var blue: Double = 23
    
    private var builtColor: Color {
        get {
            return Color(red: red/255, green: green/255, blue: blue/255)
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle().fill(builtColor).edgesIgnoringSafeArea(.top)
                Text("da")
            }
            ZStack {
                VStack(spacing: -30) {
                    HStack {
                        Rectangle().fill(Color.white).frame(height: 50).cornerRadius(15)
                    }
                    VStack(alignment: .leading) {
                        SliderView(label: "Red", value: $red)
                        SliderView(label: "Green", value: $green)
                        SliderView(label: "Blue", value: $blue)
                    }
                    .padding()
                    .background(Color.white)
                }
            }
            
            
        }
        .background(builtColor)
    }
}

struct SliderColorView_Previews: PreviewProvider {
    static var previews: some View {
        SliderColorView()
    }
}
