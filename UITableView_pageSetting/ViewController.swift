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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: idCell)
        cell.textLabel?.text = "My text"
        cell.imageView?.image = UIImage(named: "general")
        return cell
    }
    
    
}

