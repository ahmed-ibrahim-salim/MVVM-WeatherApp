//
//  WeatherButton.swift
//  MVVM-WeatherApp
//
//  Created by ahmadmedo on 7/24/21.
//

import SwiftUI

struct TextButtonTemplate: View {
    let title: String
    let textColor: Color
    let backgroundColor: Color
    var body: some View {
        Text(title).frame(width: 250, height: 50).background(backgroundColor).foregroundColor(textColor).font(.system(size: 20, weight: .bold, design: .default)).cornerRadius(10)
    }
}

