//
//  ViewController.swift
//  iOS6-HW13-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 31.05.2022.
//

import UIKit


struct Section {
//    let title: String
    let options: [SettingsOptionsType]
}

enum SettingsOptionsType {
    case staticCell(model: SettingsOptions)
    case switchCell(model: SettingsSwitchOption)
}
struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconColor: UIColor
    let handler: (() -> Void)
    let isToggled: Bool
}

struct SettingsOptions {
    let title: String
    let icon: UIImage?
    let iconColor: UIColor
    let handler: (() -> Void)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: -TableView
    
    private var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)

        return table
    }()
    
    var models = [Section]()
    
    //MARK: -viewLoads:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCells()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    //MARK: -Functions
    
    func configCells() {
        models.append(Section(options: [
            .staticCell(model: SettingsOptions(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconColor: .systemOrange) {
            }),
            .staticCell(model: SettingsOptions(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconColor: .systemBlue) {
            }),
            .staticCell(model: SettingsOptions(title: "Bluetooth", icon: UIImage(named: "bluetooth"), iconColor: .systemBlue) {
            }),
            .staticCell(model: SettingsOptions(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconColor: .systemGreen) {
            }),
            .staticCell(model: SettingsOptions(title: "Режим модема", icon: UIImage(systemName: "personalhotspot"), iconColor: .systemGreen) {
            }),
            .staticCell(model: SettingsOptions(title: "VPN", icon: UIImage(systemName: "wifi.square.fill"), iconColor: .systemBlue) {
            })
        ]))
        models.append(Section(options: [
            .staticCell(model: SettingsOptions(title: "Уведомления", icon: UIImage(systemName: "bell.badge.fill"), iconColor: .systemRed) {
            }),
            .staticCell(model: SettingsOptions(title: "Звуки, тактильные сигналы", icon: UIImage(systemName: "speaker.wave.3.fill"), iconColor: .systemRed) {
            }),
            .staticCell(model: SettingsOptions(title: "Не беспокоить", icon: UIImage(systemName: "moon.fill"), iconColor: .systemIndigo) {
            }),
            .staticCell(model: SettingsOptions(title: "Экранное время", icon: UIImage(systemName: "hourglass"), iconColor: .systemIndigo) {
            })
        ]))
        models.append(Section(options: [
            .staticCell(model: SettingsOptions(title: "Основные", icon: UIImage(systemName: "gear"), iconColor: .systemGray) {
            }),
            .staticCell(model: SettingsOptions(title: "Пункт управления", icon: UIImage(systemName: "switch.2"), iconColor: .systemGray) {
            }),
            .staticCell(model: SettingsOptions(title: "Экран и яркость", icon: UIImage(systemName: "textformat.size"), iconColor: .systemBlue) {
            }),
            .staticCell(model: SettingsOptions(title: "Экран \"Домой\"", icon: UIImage(systemName: "apps.iphone"), iconColor: .systemGreen) {
            }),
            .staticCell(model: SettingsOptions(title: "Универсальный доступ", icon: UIImage(systemName: "figure.wave.circle"), iconColor: .systemGreen) {
            })
        ]))
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let section = models[section]
//        return section.title
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingTableViewCell.identifier,
                for: indexPath) as? SettingTableViewCell else {
                    return UITableViewCell()
                }
            cell.configure(with: model)
            return cell
        case .switchCell(let model):
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
        print("cell tapped")
    }
    
}

