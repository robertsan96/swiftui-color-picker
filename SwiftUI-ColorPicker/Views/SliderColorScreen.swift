//
//  SliderColorScreen.swift
//  SwiftUI-ColorPicker
//
//  Created by Robert Sandru on 5/9/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct SliderColorScreen: View {
    
    @State private var red: Double = 23
    @State private var green: Double = 23
    @State private var blue: Double = 23
    
    @State private var storedPalette: [Color] = []
    
    private var builtColor: Color {
        get {
            return Color(red: red/255, green: green/255, blue: blue/255)
        }
    }
    
    fileprivate func ColorPaletteView() -> some View {
        return VStack {
            Button(action: {
                self.storedPalette.append(self.builtColor)
            }) {
                ZStack {
                    Rectangle()
                        .fill(Color(.secondarySystemGroupedBackground))
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                        .shadow(radius: 5)
                    Image(systemName: "plus").resizable().frame(width: 20, height: 20, alignment: .center)
                }
            }
            ForEach(storedPalette.reversed().prefix(5), id: \.self) { color in
                Rectangle()
                    .fill(color)
                    .frame(width: 50, height: 50)
                    .cornerRadius(25)
                    .shadow(radius: 5)
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle().fill(builtColor).edgesIgnoringSafeArea(.top)
                VStack {
                    HStack {
                        VStack {
                            Text("Left")
                        }
                        Spacer()
                        ColorPaletteView().padding()
                    }
                    Spacer()
                }
            }
            ZStack {
                VStack(spacing: -30) {
                    HStack {
                        Rectangle()
                            .fill(Color(.secondarySystemGroupedBackground))
                            .frame(height: 50)
                            .cornerRadius(15)
                    }.shadow(radius: 10)
                    VStack(alignment: .leading) {
                        SliderView(label: "Red", value: $red)
                        SliderView(label: "Green", value: $green)
                        SliderView(label: "Blue", value: $blue)
                    }
                    .padding()
                    .background(Color(.secondarySystemGroupedBackground))
                }
            }
            
            
        }
        .background(builtColor)
    }
}

struct SliderColorView_Previews: PreviewProvider {
    static var previews: some View {
        SliderColorScreen()
    }
}
