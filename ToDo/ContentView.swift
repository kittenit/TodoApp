//
//  ContentView.swift
//  ToDo
//
//  Created by JIHYUN on 6/6/25.
//

import SwiftUI
import SwiftData

// comm + shit + a = 다크모드 단축키
// color.primary ( 원래 색깔로 변경하는 코드 ) - 다크모드에 적용하는 

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext // 생성, 삭제를 위해서는 이 코드가 필요함
    
    @Query private var todoList: [Todo] = [ //@Query 는 데이터베이스가 관리 @state는 swift ui가 관리
        // query로 가져온건 조회랑 추가만 가능
        Todo(title: "열라면 먹기"),
        Todo(title: "참깨라면 먹기"),
        Todo(title: "맛있는 라면 먹기")
    ]
    
    func addTodo(){
        withAnimation { // @state가 붙어있는 뷰에 반영되는 변수들을 withanimation하면 더욱 부드럽게 뜸
            let new = Todo(title: "new todo")
            //            todoList.append(new) // 버튼을 누르면 새로운 투두가 추가(배열) 되게
            //modelcontext를 통하여 추가하기
            
            modelContext.insert(new)
            
        }
    }// 원래 있던 것을 함수로 빼내서 코드 간단하게 만들음
    
    
    //    indexSet in
    //       // indexSet : index들의 배열 (값들이 여러개 들어옴 )
    //       for index in indexSet{
    //           todoList.remove(at: index)}
    
    // 위와 같은 함수
    func deleteTodo(indexSet : IndexSet) {
        withAnimation{
            for index in indexSet{
                //   todoList.remove(at: index)}
                let todo = todoList[index]
                modelContext.delete(todo)
            }}
    }
        
        var body: some View {
            NavigationStack {
                VStack {
                    List {
                        ForEach(todoList) { todo in
                            HStack {
                                Image(systemName: todo.isCompleted ? "circle.fill" : "circle")
                                    .foregroundStyle(Color.yellow)
                                    .onTapGesture {
                                        todo.isCompleted.toggle()
                                    }
                                
                                NavigationLink {
                                    TodoDetail(todo: todo) // : todo는 for문의 todo
                                    
                                    
                                } label: {
                                    Text(todo.title)
                                        .strikethrough(todo.isCompleted, color: Color.yellow)
                                        .foregroundStyle(todo.isCompleted ? Color.gray : Color.red)
                                    //iscomplect == true : gray
                                    // iscomplect != true : red
                                }
                                
                            }
                            .listRowSeparator(.hidden) // 각 행의 밑줄을 없앰 ( 그래서 hstack 밑에 넣음 )
                        }
                        // 삭제 버튼 기능
                        .onDelete (perform : deleteTodo) // 인자로 전달하니까 소괄호 없애기
                        
                        
                        //                    HStack {
                        //                        Image(systemName: "circle")
                        //                            .foregroundStyle(Color.yellow)
                        //
                        //                        NavigationLink {
                        //                            Text("次のページです")
                        //                        } label: {
                        //                            Text("今日の夜ご飯はラーメンを食べる")
                        //                        }
                        //                }
                        
                    }
                    
                } //  -- vstact 화면 여기까지 --
                .listStyle(.plain)
                .navigationTitle("TODOーN🍜")
                
                .toolbar{ // 상단에 있는 버튼
                    ToolbarItem{
                        EditButton() // 이미 있는 버튼
                    }
                    ToolbarItem{
                        Button(action:addTodo, label:{Image(systemName: ("plus"))} // addtodo() 소괄호가 없음 ( 바로 실행 될게 아니라서,
                               // 그대신 버튼이 동작해줄 것이기때문에 )
                               
                               // 원래 코드
                               //                    Button(action:{ /*print("ボタン押下")*/
                               //                        // 동작에 관한 코드
                               //                        addTodo()
                               //                   },
                               //         label:{Image(systemName: ("plus"))
                               
                        )}
                }
            }
        }
    }


#Preview {
    ContentView()
}


// 원래 코드

//struct ContentView: View {
//
//   @State private var todoList: [Todo] = [  // todo들의 배열
//        Todo(title: "열라면 먹기"),
//        Todo(title: "참깨라면 먹기"),  // 쉼표로 단락 나누기
//        Todo(title: "맛있는 라면 먹기")
//
//    ]
//
//    var body: some View {
//
//        NavigationStack {  // 화면에서 화면을 겹치고 쌓는 형식임 ( 대다수의 어플은 다 이런듯 )
//            List {
//                
//                ForEach($todoList) { $todo in
//                    
//                    HStack {
//                        
//                        Image(systemName: $todo.isCompleted == true ? "circle.fill" : "circle")
//                        .foregroundStyle(Color.yellow)
//                         .onTapGesture {
//                               $todo.isCompleted.toggle()
//                        
//                        
//                        
////                        if todo.isCompleted == true {
////                            // todo가 완료 되었을 때
////                            Image(systemName: "circle.fill")  // sf symbols ( systemName )
////                            // circle.fill ( 꽉찬 원 )
////                                .foregroundStyle(Color.yellow)  // 원의 컬러
////                                .onTapGesture {
////                                    // print("押した") 눌려진 것을 확인 가능함
////                                    todo.isCompleted.toggle() // 자동으로 false 가 true가 되고
////                                    // true가 false가 됨
////                                }
////                        }else {
////                            // todo가 실패할때
////                            Image(systemName: "circle")
////                                .foregroundStyle(Color.yellow)
////                                .onTapGesture {
////                                    todo.isCompleted.toggle()}
////
//                         }
//                    }
//                    NavigationLink {  // 버튼이나 텍스트 등을 탭하여 다른 뷰로 이동 가능
//                        Text("次のページです")  // 다음 화면의 뷰
//                    } label: {
//                        Text(todo.title)  // 타이틀을 보여줌
//                            .strikethrough(todo.isCompleted, Color:Color.yellow)
//                    }
//                    
//                }
//                // todo에 \.self 안해도 되는 이유는 ( todo 안에 id란 고유한 값이 이미 존재 해서 todo 안에 있으니까 갖다 쓰라고
//                // 그래서 Identifiable 를 적으면  이름이 같은 게 있어도 선택한 것만 지워짐
//            }
//        }
//                    HStack {
//                    
//                        Image(systemName: "circle")  // sf symbols ( systemName )
//                            .foregroundStyle(Color.yellow)  // 원의 컬러
//                        
//                        NavigationLink {  // 버튼이나 텍스트 등을 탭하여 다른 뷰로 이동 가능
//                            Text("次のページです")  // 다음 화면의 뷰
//                        } label: {
//                            Text("今日の夜ご飯はラーメンを食べる")  // 현재 화면에서 버튼 어떻게 생길지
//                        }
//                        
//                    }
//               
//                .navigationTitle("TODOーN🍜")  // 네비게이션 스택에 있는 이유는 제목도 페이지와 함께 쌓이는 것임
//            }
//            
//}
//
//#Preview {
//    ContentView()
//
//}
