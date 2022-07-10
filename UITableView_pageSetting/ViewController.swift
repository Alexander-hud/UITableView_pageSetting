//
//  ViewController.swift
//  UITableView_pageSetting
//
//  Created by Александр Алешин on 03.07.2022.
//

import UIKit

class ViewController: UIViewController {
    let idCell = "MyCell"
    @IBOutlet weak var tableView: UITableView!
    
    var items: [String] = ["we", "heart", "Swift"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.lightGray
        self.tableView.sectionHeaderHeight = 10
    }
    
}

struct Cell {
    var title: String?
}


class CellApi {
    static func getData() -> [[Cell]] {
        let section1 = [Cell(title: "Авиарежим"),
                        Cell(title: "Wi-Fi"),
                        Cell(title: "Bluetooth"),
                        Cell(title: "Сотовая связь"),
                        Cell(title: "Режим модема"),
                        Cell(title: "VPN")]

        return [section1]
    }
}

var allCellData = CellApi.getData()
extension ViewController: UITableViewDataSource {
    // MARK: Количество строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 6
        } else if section == 1 {
            return 4
        } else if section == 2 {
            return 4
        } else {
            return 0
        }
    }
    
    func label(width text: String) {
        let _: UILabel = {
         let n = UILabel()
            n.textColor = UIColor.darkGray
            n.textAlignment = .right
            n.text = text
            n.font = UIFont(name: "Montserrat", size: 12)
         return n
        }()
    }
    
    
    // MARK: клик на ячейку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let title = allCellData[indexPath.section][indexPath.row].title
        print("Выбрана ячейка \(title ??  "")")
    }

    // MARK: настройка ячеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: idCell)
        if(indexPath.section == 0){
            
            if(indexPath.item == 0) {
                cell.textLabel?.text = allCellData.first?[0].title
                cell.imageView?.image = UIImage(named: "airplane")
                cell.accessoryView = UISwitch()
            } else if (indexPath.item == 1){
                cell.textLabel?.text = allCellData.first?[1].title
                cell.imageView?.image = UIImage(named: "wifi")
                cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
                cell.detailTextLabel?.text = "Не подключено"
            } else if (indexPath.item == 2){
                cell.textLabel?.text = allCellData.first?[2].title
                cell.imageView?.image = UIImage(named: "bl")
                cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
                cell.detailTextLabel?.text = "Вкл."
            } else if (indexPath.item == 3){
                cell.textLabel?.text = allCellData.first?[3].title
                cell.imageView?.image = UIImage(named: "antenna")
                cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            } else if (indexPath.item == 4){
                cell.textLabel?.text = allCellData.first?[4].title
                cell.imageView?.image = UIImage(named: "modem")
                cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            } else if (indexPath.item == 5){
                cell.textLabel?.text = allCellData.first?[5].title
                cell.imageView?.image = UIImage(named: "vpn")
                cell.accessoryView = UISwitch()
            }
        } else  if(indexPath.section == 1){
            if(indexPath.item == 0) {
                cell.textLabel?.text = "Уведомления"
                cell.imageView?.image = UIImage(named: "general")
                
            } else if (indexPath.item == 1){
                cell.textLabel?.text = "Звуки, тактильные сигналы"
                cell.imageView?.image = UIImage(named: "general")
            } else if (indexPath.item == 2){
                cell.textLabel?.text = "Не беспокоить"
                cell.imageView?.image = UIImage(named: "general")
            } else if (indexPath.item == 3){
                cell.textLabel?.text = "Экранное время"
                cell.imageView?.image = UIImage(named: "general")
            }
        } else  if(indexPath.section == 2){
            if(indexPath.item == 0) {
                cell.textLabel?.text = "Основное"
                cell.imageView?.image = UIImage(named: "general")
            } else if (indexPath.item == 1){
                cell.textLabel?.text = "Пункт управления"
                cell.imageView?.image = UIImage(named: "general")
            } else if (indexPath.item == 2){
                cell.textLabel?.text = "Экран и яркость"
                cell.imageView?.image = UIImage(named: "general")
            } else if (indexPath.item == 3){
                cell.textLabel?.text = "Экран домой"
                cell.imageView?.image = UIImage(named: "general")
            }
        }
        return cell
    }
    // MARK: Количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // MARK: Name section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
       return " "
    }
}

