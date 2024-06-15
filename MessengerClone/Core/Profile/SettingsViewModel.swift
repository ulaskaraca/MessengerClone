//
//  SettingsViewModel.swift
//  MessengerClone
//
//  Created by Ulaş Ardıl KARACA on 11.06.2024.
//

import Foundation
import SwiftUI

enum SettingsViewModel: Int, CaseIterable, Identifiable{
    case darkMode
    case activeStatus
    case accessibility
    case privacy
    case notifications
    
    var id: Int { return self.rawValue}
    
    var title: String{
        switch self{
            
        case .darkMode: return "Dark Mode"
        case .activeStatus: return "Active Status"
        case .accessibility: return "Accessibility"
        case .privacy: return "Privacy and Safety"
        case .notifications: return "Notifications"
        }
    }
    
    var imageName: String{
        switch self{
        case .darkMode: return "moon.circle.fill"
        case .activeStatus: return "message.badge.circle.fill"
        case .accessibility: return "person.circle.fill"
        case .privacy: return "lock.circle.fill"
        case .notifications: return "bell.circle.fill"
        }
    }
    
    var color: Color{
        switch self{
        case .darkMode: return Color(.black)
        case .activeStatus: return Color(.green)
        case .accessibility: return Color(.black)
        case .privacy: return Color(.blue)
        case .notifications: return Color(.purple)
        }
    }
    
}
