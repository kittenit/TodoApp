//
//  TodoDetail.swift
//  ToDo
//
//  Created by JIHYUN on 6/10/25.
//

import SwiftUI

struct TodoDetail: View {
    
    // 프로퍼티 자리
    @State var todo : Todo
    
    
    var body: some View {
       
        VStack{
            TextField("to-do title", text: $todo.title)
            // 바인딩 : 스택필드 안에서 변수를 수정할 때는 $ 붙여야함
                .font(.title2)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.yellow, lineWidth: 2)
                )
            TextEditor(text: $todo.detail)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.yellow, lineWidth: 2))
            
        }
        .padding()
        .navigationTitle("TODOーN🍜 Edit📒") // 여기에서는 안뜸( 단독적인 뷰라서 )
        // 그러나 navigaitontitle은 contenteview에서 나옴 navigaitonstact안에 있는 코드라서 
        
    }
}

#Preview {
    TodoDetail(todo: Todo(title: "2번째 화면의 투두 "))
}
