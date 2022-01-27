//
//  ViewController.swift
//  AirJnJ
//
//  Created by usg on 2022/01/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userImageview: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var depthLabel: UILabel!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imageview.image = UIImage.init(named: "수납장")
        
        titleLabel.text = "원목 수납장"
        userImageview.image = UIImage.init(named: "지니")
        userLabel.text = "지니"
        priceLabel.text = "30,000"
        depthLabel.text = "40cm"
        widthLabel.text = "150cm"
        heightLabel.text = "75cm"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

