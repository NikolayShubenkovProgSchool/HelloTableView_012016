//
//  TableViewController.swift
//  HelloTableView
//
//  Created by Nikolay Shubenkov on 25/01/16.
//  Copyright © 2016 Nikolay Shubenkov. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //1
    //создать пустой массив, в котором будут содержаться строки
    var items:[String] = [String]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupData()
        
       //2станем у тейбл вью его делегатом и датасорсом
        tableView.delegate   = self
        tableView.dataSource = self
    }
    
    //настроим данные
    func setupData() {
        
        // семейства шрифтов в виде массива строк с их названиями
        let familyNames = UIFont.familyNames()
        
        //для названия каждого семейства шрифтов
        for aFamilyName in familyNames {
            
            //найдем все шрифты этого семейства
            let allFontsOfThisFamily:[String] = UIFont.fontNamesForFamilyName(aFamilyName)
            
            //все строки из allFontsOfThisFamily будут перенесены в items
            items += allFontsOfThisFamily
        }
    }
}

//Поддерживаем протокол UITableViewDelegate
extension TableViewController: UITableViewDelegate {
    
}

extension TableViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //убедимся, что у нас есть какие-то элементы для отображения
        return items.count
    }
    
    //indexPath - это адрес ячейки в таблице
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Запросить прототип ячейки у TableView
        let cell = tableView.dequeueReusableCellWithIdentifier("JustACellID", forIndexPath: indexPath)
        
        let fontName = items[indexPath.row]
        let font = UIFont(name: fontName, size: 14)

        //Зная, что по indexPath.row у нас лежит конкретный текст для конкретной ячейки вставим его туда
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.font = font
        
        //вернем ячейку
        return cell
    }
}








