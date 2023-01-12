//
//  HeaderView.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

struct HeaderView: View {
    let title: LocalizedStringKey
    let subtitle: LocalizedStringKey
    
    var body: some View {
        HStack {
            VStack {
                ComponentTextView(type: .secondaryTitle, text: title, color: .secondaryText)
                ComponentTextView(type: .body, text: subtitle, color: .secondaryText)
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Raining", subtitle: "04:24 PM - Bangalore")
    }
}
