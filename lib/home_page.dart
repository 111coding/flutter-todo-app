import 'package:flutter/material.dart';
import 'package:flutter_todo_app/todo_widget.dart';

class HomePage extends StatelessWidget {
  // @override => 어노테이션
  // 코드의 메타데이터!
  // 없어도 에러는 나지 않음
  // 협업할 때, 다른개발자한테 알려주기위해서!
  // 빌드할때 (apk파일 만들 때)

  // 함수
  void buttonClick(
    /** 매개변수 */
  ) {
    //
  }

  @override
  Widget build(BuildContext context) {
    IntrinsicHeight;
    List<String> titles = ["물마시기", "프로그래밍", "아침에코딩", "Q&A", "스터디"];
    return Scaffold(
      appBar: AppBar(
        title: Text("투두앱"),
        // 안드로이드, 아이폰 모두 title이 가운데 옴!
        // 기본값 : 안드로이드 - 왼쪽, 아이폰 - 가운데
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(20),
        itemCount: titles.length,
        separatorBuilder: (context, index) {
          return SizedBox(height: 20);
        },
        itemBuilder: (context, index) {
          return TodoWidget(title: titles[index], isDone: index % 2 == 0);
        },
      ),
      // 익명 함수 => 이름이 없는 함수
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("버튼 터치됨");
          showModalBottomSheet(
            context: context,
            // 화면 전체 사용할 수 있게 해주는 속성!
            isScrollControlled: true,
            builder: (context) {
              final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
              print("키보드의 높이는 : $keyboardHeight");

              return GestureDetector(
                onTap: () {
                  print("컨테이너 터치됨");
                  // 키보드 내릴 때!
                  FocusScope.of(context).unfocus();
                },
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                      //
                    ),
                  ),
                  padding: EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 20,
                    bottom: 24,
                  ),
                  // 키보드 영역만큼 아래공간 띄우기
                  // 실기기 (안드로이드, 아이폰) + 아이폰 가상머신용
                  margin: EdgeInsets.only(bottom: keyboardHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "할일",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 11),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xFF1414E6)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(0xFF1414E6),
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      // ElevatedButton 속성에는 크기를 정할 수 있는 속성이 없음
                      // 부모위젯의 크기가 있다면 => 부모위젯의 크기만큼 버튼크기가 확장됨
                      // 없다면 => 자녀 위젯의 크기만큼 축소됨
                      // double.infinity => 소수 표현하는 타입 double.
                      // => double(소수) 이 가질 수 있는 값중에서 가장 큰값(무한)
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          // ButtonStyle 클래스 사용하면
                          // WidgetStatePropertyAll(Colors.red)
                          // 이런식으로 객체 하나 더 감싸줘야돼서
                          // 코드가 길어짐
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF5714E6),
                            foregroundColor: Colors.white, // 버튼 내 아이콘, 텍스트 모두 적용됨
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {},
                          child: Text("저장"),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Color(0xFF5714E6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add, color: Colors.white, size: 36),
      ),
    );
  }
}
