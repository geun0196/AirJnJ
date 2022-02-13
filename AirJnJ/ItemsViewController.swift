//
//  ItemsTableViewController.swift
//  AirJnJ
//
//  Created by usg on 2022/02/08.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var items = [
        ItemInfo(user: User.Jin, itemName: "수납장", itemThumbnail: "수납장",
                 price: 20000, size: Size(w: 75, d: 75, h: 150)),
        ItemInfo(user: User.franky, itemName: "BROMMÖ", itemThumbnail: "brommo",
                 detailImage: ["brommo_1", "brommo_2", "brommo_3", "brommo_4", "abrommo_5"],
                 price: 8000, size: Size(w: 48, d: 92, h: 89)),
        ItemInfo(user: User.goyangci, itemName: "EKEDALEN", itemThumbnail: "ekedalen",
                 detailImage: ["ekedalen_1", "ekedalen_2", "ekedalen_3", "ekedalen_4", "ekedalen_5"],
                 price: 6000, size: Size(w: 43, d: 51, h: 95)),
        ItemInfo(user: User.franky, itemName: "HATTEFJÄLL", itemThumbnail: "hattefjall",
                 detailImage: ["hattefjall_1", "hattefjall_2", "hattefjall_3", "hattefjall_4", "hattefjall_5"],
                 price: 23000, size: Size(w: 68, d: 68, h: 110)),
        ItemInfo(user: User.popo, itemName: "MARKUS", itemThumbnail: "markus",
                 detailImage: ["markus_1", "markus_2", "markus_3", "markus_4", "markus_5", "markus_6", "markus_7"],
                 price: 20000, size: Size(w: 62, d: 60, h: 140)),
        ItemInfo(user: User.goyangci, itemName: "MILLBERGET", itemThumbnail: "millberget",
                 detailImage: ["millberget_1", "millberget_2", "millberget_3", "millberget_4", "millberget_5", "millberget_6"],
                 price: 8000, size: Size(w: 52, d: 65, h: 123)),
        ItemInfo(user: User.popo, itemName: "NORDMYRA", itemThumbnail: "nordmyra",
                 detailImage: ["nordmyra_1", "nordmyra_2", "nordmyra_3"],
                 price: 5000, size: Size(w: 45, d: 48, h: 80)),
        ItemInfo( user: User.ggamdi, itemName: "NORRÅKER", itemThumbnail: "norraker",
                 detailImage: ["norraker_1", "norraker_2", "norraker_3", "norraker_4", "norraker_5", "norraker_6"],
                 price: 8000, size: Size(w: 41, d: 50, h: 81)),
        ItemInfo(user: User.ggamdi, itemName: "TUNHOLMEN", itemThumbnail: "tunholmen",
                 detailImage: ["tunholmen_1", "tunholmen_2", "tunholmen_3", "tunholmen_4", "tunholmen_5"],
                 price: 8000, size: Size(w: 55, d: 55, h: 78)),
        ItemInfo(user: User.popo, itemName: "YPPERLIG", itemThumbnail: "ypperlig",
                 detailImage: ["ypperlig_1", "ypperlig_2", "ypperlig_3", "ypperlig_4", "ypperlig_5", "ypperlig_6", "ypperlig_7"],
                 price: 8000, size: Size(w: 55, d: 51, h: 83))
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
        cell.detailTextLabel?.text = item.user.name
        cell.imageView?.image = UIImage(named: item.itemThumbnail)
        
        return cell
    }
    
    // DetailVC 전환
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // sender는 보내는 역할 (UITableViewCell에서 보낸다), 선택한 셀을 indexPath에 저장
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell){
            let selected = items[indexPath.row]
            // 받는사람 정하기
            let detailVC = segue.destination as? DetailViewController
            detailVC?.item = selected
        }
    }
}
