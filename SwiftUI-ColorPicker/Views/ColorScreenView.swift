//
//  ColorScreenView.swift
//  SwiftUI-ColorPicker
//
//  Created by Robert Sandru on 5/9/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct ColorScreenView: View {
    
    var color: UIColor {
        didSet {
            red = "da"
        }
    }
    
    @State private var red: String = "255"
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle().fill(Color(color)).edgesIgnoringSafeArea(.all)
            }
            .navigationBarTitle("Color Details", displayMode: .automatic)
        }
    }
}

struct ColorScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ColorScreenView(color: .red)
    }
}
