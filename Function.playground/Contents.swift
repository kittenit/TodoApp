import UIKit

// 함수(function), 메소드(method)

print("hawai")

func hello() { // 함수는 무조건 소괄호
    print("yap")
    print("yep")
}

hello()
// 두가지의 내용이 묶어서 나타남

struct cat {
    let name : String //property
    let cutedamage : Int
    
    init(name: String, cutedamage: Int) {
        self.name = name
        self.cutedamage = cutedamage
    }
    
    func cute() { // 메소드 ( class, struct 안에 있는 함수는 "메소드" 라고 부름 )
        print("세젤귀")
    }
}
    
    let nya = cat(name: "nyaon", cutedamage: 100)
    nya.cute()
    

// 파라미터, 리터 값

print("---파라미터----")

func add(number1: Int, number2:Int) -> Int{ //  number1 , number2는 "파라미터(매개변수)"라고 한다.
                                    // 이 함수는 반드시 Int 값을 return 해야 해
//    print(number1+number2)
    return number1+number2
}

let  result = add(number1: 10, number2: 30)+5
// 함수가 외부로부터 전달 받는 값

print(result)
