//
//  ToDo.swift
//  ToDo
//
//  Created by JIHYUN on 6/6/25.
//

import Foundation
import SwiftData

@Model // 항상 swift data import하기
class Todo :  Identifiable { //Identifiable 는 프로토콜 ( 함수가 있다는 것을 ( 즉 id가 있다는 것 ) 보증 해줌 )

    var id : UUID

    var title : String
    var isCompleted : Bool
    var detail : String

    init(title: String) {
        self.id = UUID()

        self.title = title
        self.isCompleted = false // 처음에는 false로 설정
        self.detail = ""
    }
}

// 원래 코드 

//// content view 맨 위에 있어도 됨 ( 스위프트는 굳이 import는 필요없음
//
//// @state와 같이 뷰가 변경하게 할려면 클라스에서는 @Observable
//@Observable class Todo :  Identifiable { //Identifiable 는 프로토콜 ( 함수가 있다는 것을 ( 즉 id가 있다는 것 ) 보증 해줌 )
//    
//    let id : UUID
//    
//    var title : String
//    var isCompleted : Bool
//    var description : String
//    
//    init(title: String) {
//        self.id = UUID()
//        
//        self.title = title
//        self.isCompleted = false // 처음에는 false로 설정
//        self.description = ""
//    }
//}

