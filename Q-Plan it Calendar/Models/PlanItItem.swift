//
//  PlanItItem.swift
//  Q-Plan it Calendar
//
//  Created by Izzy Bravo on 7/30/23.
//

import Foundation
import CoreTransferable

struct PlanItItem: Codable, Identifiable {
    let id: String
    let title: String
    let eventDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
