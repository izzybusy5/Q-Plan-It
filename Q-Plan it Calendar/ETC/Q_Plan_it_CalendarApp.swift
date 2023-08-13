//
//  Q_Plan_it_CalendarApp.swift
//  Q-Plan it Calendar
//
//  Created by Izzy Bravo on 7/30/23.
//

import SwiftUI
import FirebaseCore

@main
struct Q_Plan_it_CalendarApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainPageView()
        }
    }
}
