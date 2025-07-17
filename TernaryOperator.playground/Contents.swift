import UIKit

// 삼항 연산자 , Terary operator  : if문의 단순 버전

let member : Bool = false

if member == true {
    print("멤버 입니다.")
}else{
    print(("멤버가 아닙니다.")) // 멤버가 아닙니다가 뜸
}

// 삼항연산자 사용

print(member != true ? "멤버입니다." : "멤버가 아닙니다.")
//                조건 ? true일때    : false 일때


let fee = ( member == true )  ? 100 : 200
print(fee)

// 멤버가 false니까 fee는 200이 뜸s`

