//
//  ViewController.swift
//  iOS6-HW13-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 31.05.2022.
//

import UIKit

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
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return table
    }()
    
    var data = [String]()
    var models = [SettingsOptions]()
    
    //MARK: -viewLoads:
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        for x in 0...10 {
//            data.append("Data \(x)")
//        }
        config()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    //MARK: -Functions
    
    func config() {
        self.models = Array(0...50).compactMap({
            SettingsOptions(title: "Item \($0)", icon: UIImage(systemName: "house"), iconColor: .systemPink) {
            }
        })
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.count
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.text = model.title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("cell tapped")
    }
    

}

