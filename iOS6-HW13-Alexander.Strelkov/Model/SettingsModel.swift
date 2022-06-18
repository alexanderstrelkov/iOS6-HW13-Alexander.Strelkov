//
//  SettingsModel.swift
//  iOS6-HW13-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 17.06.2022.
//

import Foundation
import UIKit

final class SettingsModel {
    var models = [Section]()
    
    func configCell() -> [Section] {
        let firstSection = [
            Section(options: [
                .switchCell(model: SettingsSwitchOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconColor: .systemOrange, handler: {
                }, isToggled: false)),
                .staticCell(model: SettingsOptions(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconColor: .systemBlue, detail: "Не подключено", notification: nil) {
                }),
                .staticCell(model: SettingsOptions(title: "Bluetooth", icon: UIImage(named: "bluetooth"), iconColor: .systemBlue, detail: "Вкл.", notification: nil) {
                }),
                .staticCell(model: SettingsOptions(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconColor: .systemGreen, detail: nil, notification: nil) {
                }),
                .staticCell(model: SettingsOptions(title: "Режим модема", icon: UIImage(systemName: "personalhotspot"), iconColor: .systemGreen, detail: nil, notification: nil) {
                }),
            ]),
        ]
        let secondSection = [
            Section(options: [
                .switchCell(model: SettingsSwitchOption(title: "VPN", icon: UIImage(systemName: "wifi.square.fill"), iconColor: .systemBlue, handler: {
                }, isToggled: false)),
                .staticCell(model: SettingsOptions(title: "Уведомления", icon: UIImage(systemName: "bell.badge.fill"), iconColor: .systemRed, detail: nil, notification: nil) {
                }),
                .staticCell(model: SettingsOptions(title: "Звуки, тактильные сигналы", icon: UIImage(systemName: "speaker.wave.3.fill"), iconColor: .systemRed, detail: nil, notification: nil) {
                }),
                .staticCell(model: SettingsOptions(title: "Не беспокоить", icon: UIImage(systemName: "moon.fill"), iconColor: .systemIndigo, detail: nil, notification: nil) {
                }),
                .staticCell(model: SettingsOptions(title: "Экранное время", icon: UIImage(systemName: "hourglass"), iconColor: .systemIndigo, detail: nil, notification: nil) {
                })
            ])
        ]
        let thirdSection = [
            Section(options: [
                .staticCell(model: SettingsOptions(title: "Основные", icon: UIImage(systemName: "gear"), iconColor: .systemGray, detail: nil, notification: UIImage(systemName: "1.circle.fill")) {
                }),
                .staticCell(model: SettingsOptions(title: "Пункт управления", icon: UIImage(systemName: "switch.2"), iconColor: .systemGray, detail: nil, notification: nil) {
                }),
                .staticCell(model: SettingsOptions(title: "Экран и яркость", icon: UIImage(systemName: "textformat.size"), iconColor: .systemBlue, detail: nil, notification: nil) {
                }),
                .staticCell(model: SettingsOptions(title: "Экран \"Домой\"", icon: UIImage(systemName: "apps.iphone"), iconColor: .systemGreen, detail: nil, notification: nil) {
                }),
                .staticCell(model: SettingsOptions(title: "Универсальный доступ", icon: UIImage(systemName: "figure.wave.circle"), iconColor: .systemGreen, detail: nil, notification: nil) {
                })
            ])
        ]
        models.append(contentsOf: firstSection)
        models.append(contentsOf: secondSection)
        models.append(contentsOf: thirdSection)
        return models
    }
}
