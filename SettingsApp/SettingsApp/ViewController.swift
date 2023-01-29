//
//  ViewController.swift
//  SettingsApp
//
//  Created by Maximilian on 27.01.2023.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOptionType]
}
enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
}
struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    var handler: (() -> Void)
    var isOn: Bool
}
struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    var handler: (() -> Void)
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    
        private let tableView: UITableView = {
            let table = UITableView(frame: .zero, style: .grouped)
            table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
            table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)

            return table
    }()
    
    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Settings"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame  = view.bounds
    }
    func configure() {
        models.append(Section(title: "General", options: [
            
            .switchCell(model: SettingsSwitchOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemRed, handler: {
            }, isOn: true)),
        
                
            ]))
        models.append(Section(title: "General", options: [
            
            .staticCell(model: SettingsOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
            }),
            
                .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
                
            }),
            
                . staticCell(model: SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
            }),
            .staticCell(model: SettingsOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
                
            })
            ]))
        models.append(Section(title: "Information", options: [

            .staticCell(model: SettingsOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
            }),
            
                .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
                
            }),
            
                . staticCell(model: SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
            }),
            .staticCell(model: SettingsOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
            })
            ]))
                
            models.append(Section(title: "Apps", options: [

                .staticCell(model: SettingsOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                }),
                
                    .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
                    
                }),
                
                    . staticCell(model: SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
                }),
                .staticCell(model: SettingsOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
                })
        ]))
                
            }
                            
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
                            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                        
                                let model = models[indexPath.section].options[indexPath.row]
                              
                                switch model.self {
                                case.staticCell(let model) :
                                    guard  let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell else { return UITableViewCell()
                                    
                                }
                                cell.configure(with:model)
                                return cell
                                case.switchCell(let model):
                                    guard  let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as? SwitchTableViewCell else { return UITableViewCell()
                                    }
                                    cell.configure(with: model)
                                    return cell
                                }
                            }
                                func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                                    tableView.deselectRow(at: indexPath, animated: true)
                                    let type = models[indexPath.section].options[indexPath.row]
                                    switch type.self {
                                    case.staticCell(let model) :
                                        model.handler()
                                    case.switchCell(let model):
                                        model.handler()
                                    }
                                }
                            }
