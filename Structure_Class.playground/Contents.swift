import UIKit

let pokemons : [String] = ["피카츄" , "푸린" , "파이리"]


// 커스텀 타입 ( struct or class )
class Pokemons { //string이나 int의 이름을 쳐줌 ( 타입의 이름은 대문자 / 변수나 이런건 소문자 국룰 )
    var 이름 :  String = ""
    var 번호 :  Int = 0 // 기본 값
    var 속성 :  String = ""
}

var 포켓몬 = Pokemons() // 포켓몬이랑 변수에 방금 만든 것을 넣어줌

포켓몬.이름 = "피카츄"
포켓몬.번호 = 25
포켓몬.속성 = "전기" // 마찬가지로 속성에 접근해서 데이터 추가

print("이름 : " , 포켓몬.이름) // 클래스의 프로퍼티(속성)에 접근을 하기 위해서는 .을 찍어줌
print("번호 : ", 포켓몬.번호)
print("속성 : ", 포켓몬.속성)


("---- 학생으로 다시 한번 ----")

class Student { // Student는 name과 grade를 갖고 있는 프로퍼티
    var name : String
    var grade : Int
    
    init(이름: String, grade: Int) { // init으로 이름과 학년 값을 전달 받음 ( 외부로 부터 )
        name = 이름
        self.grade = grade // 같은 grade지만 외부에 있는 grade의 값을 내부에 있는 self.garde 즉 원래 grade에 넣어주라
        
    } // init은 외부로 받은 값을 내부에 있는 프로퍼티(속성)에 전달 해줌
    
    
}
let 학생1 = Student(이름 : "제니" , grade : 6) // 그래서 제니와 6을 전달 받아 name과 grade에 넣어줌
print("학생 이름 : " , 학생1.name)


class idol {
    var group : String
    var name : String
    
    init(group: String, name: String) {
        self.group = group
        self.name = name
    }
}
var 제니 = idol(group: "blackpink", name: "제니")
var 리사 = idol(group: "blackpink", name: "리사")


var blackpink = [제니, 리사] // 입력 된 값을 배열에 관리 가능

for ygidol in blackpink {
    print("내 그룹은 \(ygidol.group)이야. 이름은 \(ygidol.name) 야")
} // 포문을 이용해서 추가한 그룹명이랑 이름이 나타남


print("---- struct ----")

struct idole { // class랑 그렇게 큰 차이는 없음 ( struct 구조체 )
    var groups : String
    var names : String
    
    init(groups: String, names: String) {
        self.groups = groups
        self.names = names
    }
}
var 지수 = idole(groups: "happy", names: "지수")
var 로제 = idole(groups: "blackpink", names: "로제")


var bp = [지수, 로제] // 입력 된 값을 배열에 관리 가능

for ygidols in bp {
    print("내 그룹은 \(ygidols.groups)이야. 이름은 \(ygidols.names) 야")
} // 포문을 이용해서 추가한 그룹명이랑 이름이 나타남


// to do title , 완료 여부 , 상세정보

class Todo  {
    var title : String
    var completed : Bool
    var description : String
    
    init(title: String) {
        self.title = title
        self.completed = false // 처음에는 false로 설정
        self.description = ""
    }
}

print("UUID : ", UUID()) // 고유식별자를 랜덤으로 = uuid 
