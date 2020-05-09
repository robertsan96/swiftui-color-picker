//
//  SliderColorScreen.swift
//  SwiftUI-ColorPicker
//
//  Created by Robert Sandru on 5/9/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct SliderColorScreen: View {
    
    @State private var red: Double = 84
    @State private var green: Double = 200
    @State private var blue: Double = 255
    
    @State private var storedPalette: [UIColor] = []
    
    @State private var sheetData: (shown: Bool, data: UIColor) = (shown: false, data: .red)
    
    private var builtColor: UIColor {
        get {
            return UIColor(red: CGFloat(red)/255,
                           green: CGFloat(green)/255,
                           blue: CGFloat(blue)/255,
                           alpha: 1)
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
            ForEach(storedPalette.reversed().prefix(5), id: \.self) { (color: UIColor) in
                Button(action: {
                    var red: CGFloat = 0
                    var green: CGFloat = 0
                    var blue: CGFloat = 0
                    var alpha: CGFloat = 0
                    color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
                    self.red = Double(red*255)
                    self.green = Double(green*255)
                    self.blue = Double(blue*255)
                    
                    self.sheetData.shown = true
                    self.sheetData.data = color
                }) {
                    Rectangle()
                        .fill(Color(color))
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                        .shadow(radius: 3)
                }
            }
        }
    }
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .fill(Color(builtColor))
                        .edgesIgnoringSafeArea(.top)
                        
                    VStack {
                        HStack {
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
            .background(Color(builtColor))
            .navigationBarTitle("Color Sliders")
            .navigationBarItems(trailing: Button(action: {
                self.storedPalette.removeAll()
            }, label: {
                Text("Clear Palette").foregroundColor(.red)
            }))
        }.sheet(isPresented: $sheetData.shown) {
            ColorScreenView(color: self.sheetData.data)
        }
    }
}

struct SliderColorView_Previews: PreviewProvider {
    static var previews: some View {
        SliderColorScreen()
    }
}
