//
//  Model.swift
//  Settings
//
//  Created by Пётр  on 06.04.2023.
//

import UIKit

enum Blocks {
    case cellularAndNetwork
    case notification
    case general
    case appStoreAndWallet
}

struct Cell: Hashable{
    var name: String
    var icon: String
    var isSystem: Bool
    var color: UIColor
    var block: Blocks
    var toggle: Bool?
    var text: String?
}

extension Cell {
    
    static var cells: [[Cell]] = [
        
        // Cellular And Network
        [Cell(name: "Авиарежим", icon: "airplane", isSystem: true, color: .orange, block: .cellularAndNetwork, toggle: true, text: nil),
         Cell(name: "Wi-Fi", icon: "wifi", isSystem: true, color: .blue, block: .cellularAndNetwork, toggle: nil, text: "Не подключено"),
         Cell(name: "Bluetooth", icon: "bluetooth", isSystem: false, color: .blue, block: .cellularAndNetwork, toggle: nil, text: "Вкл."),
         Cell(name: "Сотовая связь", icon: "antenna.radiowaves.left.and.right", isSystem: true, color: .green, block: .cellularAndNetwork, toggle: nil, text: nil),
         Cell(name: "Режим модема", icon: "personalhotspot", isSystem: true, color: .green, block: .cellularAndNetwork, toggle: nil, text: "Выкл."),
         Cell(name: "VPN", icon: "vpn", isSystem: false, color: .blue, block: .cellularAndNetwork, toggle: true, text: nil)],
        
        // Notification
        [Cell(name: "Уведомления", icon: "bell.badge", isSystem: true, color: .red, block: .notification, toggle: nil, text: nil),
         Cell(name: "Звуки, тактильные сигналы", icon: "speaker.wave.3.fill", isSystem: true, color: .red, block: .notification, toggle: nil, text: nil),
         Cell(name: "Фокусирование", icon: "moon.fill", isSystem: true, color: .blue, block: .notification, toggle: nil, text: nil),
         Cell(name: "Экранное время", icon: "hourglass", isSystem: true, color: .blue, block: .notification, toggle: nil, text: nil)],
        
        // General
        [Cell(name: "Основное", icon: "gear", isSystem: true, color: .systemGray, block: .general, toggle: nil, text: nil),
         Cell(name: "Пункт управления", icon: "faceid", isSystem: true, color: .systemGray, block: .general, toggle: nil, text: nil),
         Cell(name: "Экран и яркость", icon: "textformat.size", isSystem: true, color: .blue, block: .general, toggle: nil, text: nil),
         Cell(name: "Обои", icon: "wallpapper", isSystem: false, color: .blue, block: .general, toggle: nil, text: nil),
         Cell(name: "Экстренный вызов - SOS", icon: "sos", isSystem: false, color: .red, block: .general, toggle: nil, text: nil),
         Cell(name: "Аккумулятор", icon: "battery.100", isSystem: true, color: .green, block: .general, toggle: nil, text: nil)],
        
        // AppStoreAndWallet
        [Cell(name: "App Store", icon: "App_Store", isSystem: false, color: .blue, block: .appStoreAndWallet, toggle: nil, text: nil),
         Cell(name: "Wallet & Apple Pay", icon: "wallet", isSystem: false, color: .blue, block: .appStoreAndWallet, toggle: nil, text: nil)]
    ]
}
