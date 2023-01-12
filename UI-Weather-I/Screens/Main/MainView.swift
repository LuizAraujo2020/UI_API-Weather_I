//
//  MainView.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

struct MainView: View {
    let weather: Weather.Wrapper
    
    var body: some View {
        VStack {
            HeaderView(title: LocalizedStringKey(weather.conditions), subtitle: "\(weather.datetime) - \(weather.address)")
            
            ImageWithTemperatureView(temperature: weather.temperature)
            
            
//            TemperatureWithDay(dayOfWeek: "Tuesday", day: "25")
            TemperatureWithDay(dayOfWeek: LocalizedStringKey(getDayOfWeek()),
                               day: LocalizedStringKey(weather.date.get(.day)))
                .padding(.horizontal)
            
            Divider()
            
            FooterView(text: "\(getMonth())/\(getYear())")
        }
        .background(
                BackgroundView()
                    .offset(y: .screenWidth * -0.36)
                    .opacity(0.2)
                    .shadow(radius: .shadowRadius1)
        )
    }
    
    func getDayOfWeek() -> String {
        
        let f = DateFormatter()

        return f.weekdaySymbols[weather.date.get(.weekday) - 1]
    }
    
    func getMonth() -> String {
        
        let f = DateFormatter()

        return f.monthSymbols[weather.date.get(.month) - 1]
    }
    
    func getYear() -> String {
        let f = DateFormatter()

        return "\(weather.date.get(.year))"
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(weather: Weather.Wrapper())
    }
}

/*
 CEILANDIA CENTRO:
 -15.819171
 -48.100414
 e8dad36753d194d5100b20995ff8b5cf

 https://api.openweathermap.org/data/3.0/onecall?lat=39.31&lon=-74.5&appid=807fa9908ccde623f5f4a513268c01df

 http://api.openweathermap.org/data/3.0/onecall/timemachine?lat=39.099724&lon=-94.578331&dt=1643803200&appid=807fa9908ccde623f5f4a513268c01df
 */
