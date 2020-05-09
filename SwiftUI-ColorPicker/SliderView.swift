//
//  SliderView.swift
//  SwiftUI-ColorPicker
//
//  Created by Robert Sandru on 5/9/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct SliderView: View {
    
    var label: String
    @Binding var value: Double
    
    private var formattedValue: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        let formatted = numberFormatter.string(for: value) ?? ""
        return formatted
    }
    
    var body: some View {
        VStack {
            Slider(value: $value, in: 0...255)
            Text("\(label): \(formattedValue)")
        }
    }
}
