//
//  ViewModel.swift
//  iPhoneSettings
//
//  Created by MacBook Pro on 12/2/21.
//

import Foundation

protocol ViewModelDelegate: class {
    func reloadTableView()
}

class ViewModel {
    
    private weak var delegate: ViewModelDelegate?
    
    var datalist: [SettingsItem] = []
    
    init(delegate: ViewModelDelegate) {
        self.delegate = delegate
    }
    
    func loadData() {
        datalist.append(
            SettingsItem(
                type: Type.Profile,
                color: .random(),
                title: "Sign in to your iPhone",
                subtitle:"Set up iCloud, the App Store, and more."
            )
        )
        datalist.append(SettingsItem(type: Type.Space, color: nil, title: nil, subtitle: nil))
        datalist.append(SettingsItem(type: Type.Settings, title: "General", subtitle: nil))
        datalist.append(SettingsItem(type: Type.Settings, title: "Accessibility", subtitle: nil))
        datalist.append(SettingsItem(type: Type.Settings, title: "Privacy", subtitle: nil))
        datalist.append(SettingsItem(type: Type.Space, color: nil, title: nil, subtitle: nil))
        datalist.append(SettingsItem(type: Type.Settings, title: "Passwords", subtitle: nil))
        datalist.append(SettingsItem(type: Type.Space, color: nil, title: nil, subtitle: nil))
        datalist.append(SettingsItem(type: Type.Settings, title: "Safari", subtitle: nil))
        datalist.append(SettingsItem(type: Type.Settings, title: "News", subtitle: nil))
        datalist.append(SettingsItem(type: Type.Settings, title: "Maps", subtitle: nil))
        datalist.append(SettingsItem(type: Type.Settings, title: "Shortcuts", subtitle: nil))
        datalist.append(SettingsItem(type: Type.Settings, title: "Health", subtitle: nil))
        datalist.append(SettingsItem(type: Type.Settings, title: "Siri & Search", subtitle: nil))
        datalist.append(SettingsItem(type: Type.Settings, title: "Photos", subtitle: nil))
        datalist.append(SettingsItem(type: Type.Settings, title: "Game Center", subtitle: nil))
        datalist.append(SettingsItem(type: Type.Space, color: nil, title: nil, subtitle: nil))
        datalist.append(SettingsItem(type: Type.Space, color: nil, title: nil, subtitle: nil))
        datalist.append(SettingsItem(type: Type.Settings, title: "Developer", subtitle: nil))
        datalist.append(SettingsItem(type: Type.Space, color: nil, title: nil, subtitle: nil))
        datalist.append(SettingsItem(type: Type.Space, color: nil, title: nil, subtitle: nil))
    }
}
