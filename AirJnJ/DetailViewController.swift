//
//  ViewController.swift
//  AirJnJ
//
//  Created by usg on 2022/01/27.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userImageview: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var depthLabel: UILabel!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var likeCheck: UIButton!
    
    var item: ItemInfo?
    
    var currentImageIndex = 0
    var images = [String]()
    
    @IBAction func likeChanged(_ sender: Any) {
        if let item = self.item {
            // 좋아요 목록에서 제거/좋아요 목록에 추가
            if Liked.shared.isLiked(item) {
                Liked.shared.remove(item)
                likeCheck.isSelected = false
            }
            else {
                Liked.shared.add(item)
                likeCheck.isSelected = true
            }
        }
    }
    
    //UiView 버튼 조작
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    // 상세이미지가 있을경우
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
        
        // 이미지 뷰 하단 구분선 그리기
        let borderLayer = CALayer()
        borderLayer.backgroundColor = UIColor.lightGray.cgColor
        borderLayer.frame = CGRect(x: 0, y: self.imageview.frame.height - 0.5, width: self.imageview.frame.width, height: 0.5)
        self.imageview.layer.addSublayer(borderLayer)
        
    }
    
    // 옵셔널 바인딩
    override func viewWillAppear(_ animated: Bool) {
        if let item = item{
            titleLabel.text = item.itemName
            userLabel.text = item.user.name
            if let imageName = item.user.image{
                userImageview.image = UIImage.init(named: imageName)
            }
            priceLabel.text = String(item.price)
            images = item.detailImage ?? []
            
            // 상세이미지 있을 경우
            if item.detailImage != nil{
                showImage(index: 0)
            }
            // 상세이미지가 없을 경우
            if item.detailImage == nil {
                imageview.image = UIImage(named: item.itemThumbnail)
                rightButton.isEnabled = false
            }
            
            if let size = item.size{
                depthLabel.text = "\(size.d)cm"
                widthLabel.text = "\(size.w)cm"
                heightLabel.text = "\(size.h)cm"
            }
            
            // 좋아요가 눌러졌는지 좋아요 버튼에 반영
            likeCheck.isSelected = Liked.shared.isLiked(item)
            
        }
        
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
    }
}
