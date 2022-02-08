//
//  ItemsTableViewController.swift
//  AirJnJ
//
//  Created by usg on 2022/02/08.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    struct ItemInfo {
        var userName: String
        var itemName: String
        var itemImage: String
    }
    
    
    
    var items = [
        ItemInfo(userName: "승진", itemName: "수납장", itemImage: "수납장"),
        ItemInfo(userName: "프랭키", itemName: "BROMMÖ", itemImage: "brommo"),
        ItemInfo(userName: "고양씨", itemName: "EKEDALEN", itemImage: "ekedalen"),
        ItemInfo(userName: "프랭키", itemName: "HATTEFJÄLL", itemImage: "hattefjall"),
        ItemInfo(userName: "뽀뽀", itemName: "MARKUS", itemImage: "markus"),
        ItemInfo(userName: "고양씨", itemName: "MILLBERGET", itemImage: "millberget"),
        ItemInfo(userName: "뽀뽀", itemName: "NORDMYRA", itemImage: "nordmyra"),
        ItemInfo(userName: "깜디", itemName: "NORRÅKER", itemImage: "norraker"),
        ItemInfo(userName: "깜디", itemName: "TUNHOLMEN", itemImage: "tunholmen"),
        ItemInfo(userName: "뽀뽀", itemName: "YPPERLIG", itemImage: "ypperlig"),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = items[indexPath.row]
        cell.textLabel?.text = item.itemName
        cell.detailTextLabel?.text = item.userName
        cell.imageView?.image = UIImage(named: item.itemImage)
        
        return cell
    }
}
