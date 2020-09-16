# KDU 강의 평가사이트

# html body header main footer
```
html
head
body
   header
   main
   footer
/body
/html
구조로 돼어있다.

height를 쭉 늘리려면
html, body{
   height: 100%  
}

body{
   display: flex;
   flex: 1;
   flex-direction : column
}

header{
   display: flex;
   flex : 1;
}

main{
   display: flex;
   flex : 3;
}

footer{
   display: flex;
   flex : 1;   
}

flex 시 해당 flex를 넘어가게 되면 그걸 무시하고 넘어가는데 이때
2가지 방법이 존재한다.

main.height를 그만큼 javascript단에서 결정하는 방법이 있고,

overflow : auto 스크롤이 생긴다. 

1번 방법이 가장 효과적?1
```
이렇게 하면 쭉쭉 늘어남.

1. 과제공유 부분 삭제하는 부분 상속하자
2. 강의평가, 교수평가, 과제공유 좋아요 싫어요 찜하기 controller 
3. 내 과제 반영
4. 앞에 노가다
5. dns
6. 알파버젼할때까지 rds 설정하기