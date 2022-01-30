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
    @IBOutlet weak var likeCheck: UIButton!
    
    var currentImageIndex = 0
    let images = [
        "hattefjall_1",
        "hattefjall_2",
        "hattefjall_3",
        "hattefjall_4",
        "hattefjall_5"
    ]
    
    @IBAction func likeChanged(_ sender: Any) {
        likeCheck.isSelected = !likeCheck.isSelected
    }
    
    //UiView 버튼 조작
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    func showImage(index: Int) {
        let imageName = images[index]
        imageview.image = UIImage(named: imageName)
        
        // 좌/우 이미지 이동이 불가능한 상태면 버튼 상태를 disabled로
        leftButton.isEnabled = index > 0
        rightButton.isEnabled = index < images.count - 1
    }
    
    @IBAction func viewLeftChange(_ sender: Any) {
        currentImageIndex -= 1
        showImage(index: currentImageIndex)
    }
    @IBAction func viewRightChange(_ sender: Any) {
        currentImageIndex += 1
        showImage(index: currentImageIndex)
    }
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    let dateFormatter = DateFormatter()
    @IBAction func dateChoose(_ sender: Any) {
        dateFormatter.dateFormat = "yy년-MM월-dd일"
        let dateStr = dateFormatter.string(from: datePicker.date)
        dateLabel.text = dateStr
    }
    @IBAction func openCalenderButton(_ sender: Any) {
        datePicker.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // 초기 이미지는 첫번째 이미지이므로 왼쪽 버튼은 disabled로
        leftButton.isEnabled = false
        dateFormatter.dateStyle = .medium
        
        // 초기에 달력 숨김
        datePicker.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imageview.image = UIImage(named: "hattefjall_1")
        
        titleLabel.text = "의자"
        userImageview.image = UIImage.init(named: "지니")
        userLabel.text = "지니"
        
        priceLabel.text = "30,000"
        depthLabel.text = "40cm"
        widthLabel.text = "50cm"
        heightLabel.text = "75cm"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

