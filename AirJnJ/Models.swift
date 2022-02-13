//
//  Models.swift
//  AirJnJ
//
//  Created by usg on 2022/02/13.
//

import Foundation

// 튜플로 크기 정보 다루기
typealias Size = (w:Int, d:Int, h:Int)

//구조체로 아이템 정보 다루기
struct ItemInfo {
    var user: User
    var itemName: String
    var itemThumbnail: String
    var detailImage: [String]?
    var price: Int
    var size: Size?
}

// 클래스로 유저 정보 다루기
class User {
    var name: String
    var image: String?
    // 초기화
    init(name: String, image: String?) {
        self.name = name
        self.image = image
    }
    
    // 미리 생성한 유저 정보
    static let Jin = User(name: "승진", image: "지니")
    static let ggamdi = User(name: "깜디", image:"ggamdi")
    static let franky = User(name: "프랭키", image:"franky")
    static let goyangci = User(name: "고양씨", image:"goyangc")
    static let popo = User(name: "뽀뽀", image:"popo")
}

//구조체로 좋아요 다루기
struct Liked {
    //싱글톤 패턴 (객체의 인스턴스를 최초 1회만 생성)
    static var shared = Liked()
    
    var saves = [ItemInfo]()
    
    func isLiked(_ item: ItemInfo) -> Bool {
        for one in saves {
            // 제품 이름으로 같다고 비교
            if one.itemName == item.itemName {
                return true
            }
        }
        return false
    }
    
    mutating func add(_ item: ItemInfo) {
        self.saves.append(item)
    }
    
    mutating func remove(_ item: ItemInfo) {
        for (index, one) in saves.enumerated() {
            // 제품 이름으로 같다고 비교
            if one.itemName == item.itemName {
                saves.remove(at: index)
                return
            }
        }
    }

}
