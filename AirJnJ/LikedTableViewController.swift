//
//  LikedTableViewController.swift
//  AirJnJ
//
//  Created by usg on 2022/02/13.
//

import UIKit

class LikedTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    //모달창 닫힐때 앱 종료현상 방지
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        Liked.shared.saves.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Liked.shared.saves.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "likeCell", for: indexPath)
        
        let item = Liked.shared.saves[indexPath.row]
        
        cell.textLabel?.text = item.itemName
        cell.imageView?.image = UIImage(named: item.itemThumbnail)

        return cell
    }
    
}
