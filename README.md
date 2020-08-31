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
```
이렇게 하면 쭉쭉 늘어남.

1. 폰트적용함 headCircle

2. db 설계
   유저, 교수, 수업 db는 끝
   교수평가, 수업평가, 과제공유 찜하기

   과제공유 댓글다는 시스템까지 짜야된다... 