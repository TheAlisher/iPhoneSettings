//
//  SettingsItem.swift
//  iPhoneSettings
//
//  Created by MacBook Pro on 12/2/21.
//

import Foundation
import UIKit

struct SettingsItem {
    let type: Type
    
    var color: UIColor? = .random()
    let title: String?
    let subtitle: String?
}

enum Type {
    case Profile
    case Space
    case Settings
}
