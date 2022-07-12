//
//  ViewController.swift
//  UITableView_pageSetting
//
//  Created by Александр Алешин on 03.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let identifier = "MyCell"
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.backgroundColor = UIColor.lightGray
        self.tableView.sectionHeaderHeight = 10
    }
  
}

struct Cell {
    var title: String?
}

struct CellApiNetwork {
    static func getNetworkTitle() -> [Cell] {
        let Network = [Cell(title: "Авиарежим"),
                        Cell(title: "Wi-Fi"),
                        Cell(title: "Bluetooth"),
                        Cell(title: "Сотовая связь"),
                        Cell(title: "Режим модема"),
                        Cell(title: "VPN"),
                        
                        Cell(title: "Уведомления"),
                        Cell(title: "Звуки, тактиоьные сигналы"),
                        Cell(title: "Не беспокоить"),
                        Cell(title: "Экранное время"),
                       
                        Cell(title: "Основное"),
                        Cell(title: "Пункт управления"),
                        Cell(title: "Экран и яркость"),
                        Cell(title: "Экран домой")]
        return Network
    }
}


struct CellApiNotifications{
    static func getDataNotifications() -> [Cell] {
    let notifications = [Cell(title: "Уведомления"),
                        Cell(title: "Звуки, тактильные сигналы"),
                        Cell(title: "Не беспокоить"),
                        Cell(title: "Экранное время")]
    return notifications
    }
}

struct CellApiGeneral{
    static func getDataGeneral() -> [Cell] {
    let general = [Cell(title: "Основное"),
                   Cell(title: "Пункт управления"),
                   Cell(title: "Экран и яркость"),
                   Cell(title: "Экран домой")]
    return general
    }
}

var allCellDataNetwork = CellApiNetwork.getNetworkTitle()
var allCelldataNotifications = CellApiNotifications.getDataNotifications()
var allCellDataGeneral = CellApiGeneral.getDataGeneral()
let allCell = [allCellDataNetwork, allCelldataNotifications, allCellDataGeneral]

extension ViewController: UITableViewDelegate {
    
    // MARK: клик на ячейку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let title = allCell[indexPath.section][indexPath.row].title
        print("Выбрана ячейка: \(title ??  "")")
    }
    
    // MARK: Количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // MARK: Header and Footer sections
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
}

extension ViewController: UITableViewDataSource{
    
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
    
    // MARK: настройка ячеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: identifier)
        if(indexPath.section == 0){

            if(indexPath.item == 0) {
                cell.textLabel?.text = allCellDataNetwork[0].title
                cell.imageView?.image = UIImage(named: "airplane")
                cell.accessoryView = UISwitch()
            } else if (indexPath.item == 1){
                cell.textLabel?.text = allCellDataNetwork[1].title
                cell.imageView?.image = UIImage(named: "wifi")
                cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
                cell.detailTextLabel?.text = "Не подключено"
            } else if (indexPath.item == 2){
                cell.textLabel?.text = allCellDataNetwork[2].title
                cell.imageView?.image = UIImage(named: "bl")
                cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
                cell.detailTextLabel?.text = "Вкл."
            } else if (indexPath.item == 3){
                cell.textLabel?.text = allCellDataNetwork[3].title
                cell.imageView?.image = UIImage(named: "antenna")
                cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            } else if (indexPath.item == 4){
                cell.textLabel?.text = allCellDataNetwork[4].title
                cell.imageView?.image = UIImage(named: "modem")
                cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            } else if (indexPath.item == 5){
                cell.textLabel?.text = allCellDataNetwork[5].title
                cell.imageView?.image = UIImage(named: "vpn")
                cell.accessoryView = UISwitch()
            }
        } else  if(indexPath.section == 1){
            if(indexPath.item == 0) {
                cell.textLabel?.text = allCelldataNotifications[0].title
                cell.imageView?.image = UIImage(named: "Notifications")
            } else if (indexPath.item == 1){
                cell.textLabel?.text = allCelldataNotifications[1].title
                cell.imageView?.image = UIImage(named: "sounds")
            } else if (indexPath.item == 2){
                cell.textLabel?.text = allCelldataNotifications[2].title
                cell.imageView?.image = UIImage(named: "moon")
            } else if (indexPath.item == 3){
                cell.textLabel?.text = allCelldataNotifications[3].title
                cell.imageView?.image = UIImage(named: "time")
            }
        } else  if(indexPath.section == 2){
            if(indexPath.item == 0) {
                cell.textLabel?.text = allCellDataGeneral[0].title
                cell.imageView?.image = UIImage(named: "general")
            } else if (indexPath.item == 1){
                cell.textLabel?.text = allCellDataGeneral[1].title
                cell.imageView?.image = UIImage(named: "switch")
            } else if (indexPath.item == 2){
                cell.textLabel?.text = allCellDataGeneral[2].title
                cell.imageView?.image = UIImage(named: "brightness")
            } else if (indexPath.item == 3){
                cell.textLabel?.text = allCellDataGeneral[3].title
                cell.imageView?.image = UIImage(named: "house")
            }
        }
        return cell
    }
   
}

