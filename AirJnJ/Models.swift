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
