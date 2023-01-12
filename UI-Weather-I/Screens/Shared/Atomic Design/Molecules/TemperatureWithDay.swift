//
//  TemperatureWithDay.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

struct TemperatureWithDay: View {
    let dayOfWeek: LocalizedStringKey
    let day: LocalizedStringKey
    
    var body: some View {
        
        VStack {
            ComponentTextView(type: .body, text: "Today", color: .secondary)
            
            HStack {
                IndicatorView(isRight: false, action: { })
                
                Spacer()
                
                VStack {
                    
                    ComponentTextView(type: .secondaryTitle, text: dayOfWeek, color: .secondaryText)
                    
                    ComponentTextView(type: .mainTitle, text: day)
                }
                
                Spacer()
                
                IndicatorView(isRight: true, action: { })
                
            }
        }
    }
}

struct TemperatureWithDay_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureWithDay(dayOfWeek: "Tuesday", day: "25")
    }
}
