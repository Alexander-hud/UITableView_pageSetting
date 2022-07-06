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
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }


}

extension ViewController: UITableViewDataSource {
    // MARK: Количество строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 6
        } else if section == 1 {
            return 4
        } else if section == 2 {
            return 12
        } else if section == 2 {
            return 2
        } else {
            return 10
        }
    }
    // MARK: настройка ячеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: idCell)
       
        if(indexPath.section == 0){
            
            if(indexPath.item == 0) {
                cell.textLabel?.text = "Авиарежим"
                cell.imageView?.image = UIImage(named: "general")
            } else if (indexPath.item == 1){
                cell.textLabel?.text = "Wi-fi"
                cell.imageView?.image = UIImage(named: "general")
            } else if (indexPath.item == 2){
                cell.textLabel?.text = "Bluetooth"
                cell.imageView?.image = UIImage(named: "general")
            } else if (indexPath.item == 3){
                cell.textLabel?.text = "Сотовая связь"
                cell.imageView?.image = UIImage(named: "general")
            } else if (indexPath.item == 4){
                cell.textLabel?.text = "Режим модема"
                cell.imageView?.image = UIImage(named: "general")
            } else if (indexPath.item == 5){
                cell.textLabel?.text = "VPN"
                cell.imageView?.image = UIImage(named: "general")
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
        }
        return cell
    }
    // MARK: Количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    // MARK: Name section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return " "
        } else {
            return "section2"
        }
    }
}

