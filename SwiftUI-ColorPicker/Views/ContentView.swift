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
            SliderColorScreen()
                .tabItem {
                    Image(systemName: "slider.horizontal.below.rectangle")
                    Text("Sliders")
            }
            Text("Ok so camera here").tabItem {
                Image(systemName: "camera")
                Text("Camera Pick")
            }
            Text("Load image and eyedrop loredan tada da a").tabItem {
                Image(systemName: "photo")
                Text("Photo Eyedropper")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
