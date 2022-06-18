//
//  SettingsController.swift
//  iOS6-HW13-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 17.06.2022.
//

import Foundation
import UIKit

final class SettingsController: UIViewController {
    
    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }
    
    var model: SettingsModel?
    
    //MARK: -Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = SettingsView()
        model = SettingsModel()
        title = "Настройки"
        configureView()
    }
}

private extension SettingsController {
    func configureView() {
        guard let models = model?.configCell() else { return }
        models.forEach { [unowned self] model in
            settingsView?.configureView(with: models)
        }
    }
}
