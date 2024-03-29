//
//  MainViewModel.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 12/01/23.
//

import SwiftUI

@MainActor
final class MainViewModel: ObservableObject {
    @Published var weather: Weather!
    
    init() {
        fetch()
    }
    
    func fetch() {
        Task {
            do {
//#if DEBUG
                let service = APIService()
                
                weather = try await service.loadData()
//#endif
            } catch {
                //TODO: ☑️ FAZER DEPOIS
            }
        }
        
    }

    func getDayOfWeek() -> String {
        
        let dateEpoch: Date = getDateFromDatetimeEpoch(weather?.days[0].datetimeEpoch ?? 1673487952.0)
        
        let f = DateFormatter()

        return f.weekdaySymbols[dateEpoch.get(.weekday) - 1]
    }
    
    func getMonth() -> String {
        
        let dateEpoch: Date = getDateFromDatetimeEpoch(weather?.days[0].datetimeEpoch ?? 1673487952.0)
        
        let f = DateFormatter()

        return f.monthSymbols[dateEpoch.get(.month) - 1]
    }
    
    func getYear() -> String {
        
        let dateEpoch: Date = getDateFromDatetimeEpoch(weather?.days[0].datetimeEpoch ?? 1673487952.0)

        return "\(dateEpoch.get(.year))"
    }
    
    func getDateFromDatetimeEpoch(_ epoch: Double) -> Date {
        NSDate(timeIntervalSince1970: TimeInterval(epoch)) as Date
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
    
    func getDateFromDatetimeEpoch(_ epoch: Int) -> Date {
        NSDate(timeIntervalSince1970: TimeInterval(epoch)) as Date
    }
    
    func getDateFromDatetimeEpoch(_ epoch: Double) -> Date {
        NSDate(timeIntervalSince1970: TimeInterval(epoch)) as Date
    }
}
