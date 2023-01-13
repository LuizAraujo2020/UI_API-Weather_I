//
//  ImageWithTemperatureView.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

struct HeadMainView: View {
    let temperature: Double
    
    var body: some View {
        ImageMainView(condition: .rainning)
            .overlay(alignment: .topLeading) {
                DegreeView(degree: temperature)
                    .padding()
            }
    }
}

struct ImageWithTemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        HeadMainView(temperature: 2.0)
    }
}