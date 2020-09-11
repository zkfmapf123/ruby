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

1. homework/detail 부분에서 좋아요 실헝요 부분
2. homworkr/detail 부분에서 view 부분도 하나늘게끔수정하기
3. 노가다 하자...