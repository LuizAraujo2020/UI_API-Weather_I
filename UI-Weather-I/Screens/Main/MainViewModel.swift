//
//  MainViewModel.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 12/01/23.
//

import SwiftUI

@MainActor
final class MainViewModel: ObservableObject {
    @Published var weather = Weather.Wrapper()
    
    init() {
        fetch()
    }
    
    func fetch() {
        Task {
            do {
#if DEBUG
                let service = APIService()
                var weatherTemp: Weather = try await service.loadData()
                
                weatherTemp.reloadWrapper()
                
                weather = weatherTemp.wrapper
#endif
            } catch {
                //TODO: ☑️ FAZER DEPOIS
            }
        }
        
    }

    func getDayOfWeek() -> String {
        
        let f = DateFormatter()

        return f.weekdaySymbols[weather.date.get(.weekday)]
    }
}
extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }
    
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
    
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> String {
        return String(calendar.component(component, from: self))
    }
}
