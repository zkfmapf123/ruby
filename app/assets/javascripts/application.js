// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

var btn1 = document.getElementById("btn1");
var btn2 = document.getElementById("btn2");
var btn3 = document.getElementById("btn3");
var btn4 = document.getElementById("btn4");

var modal = document.getElementsByClassName("modal");
var btnJoin = document.getElementById("btnJoin");
var btnForget = document.getElementById("btnForget");
var errorMessage = document.getElementsByClassName("error");
var modalPassword = document.getElementById("modalPassword");
var current_user = document.getElementById("current_user");

//간이버튼
btn1.addEventListener("click", function(e){
    if(current_user.textContent === "로그인을 해주세요!"){
        e.preventDefault();
    
        modal[0].style.display="block";
        errorTextDefault(0);
    }
});

btn2.addEventListener("click", function(e){
    if(current_user.textContent === "로그인을 해주세요!"){
        e.preventDefault();
    
        modal[0].style.display="block";
        errorTextDefault(0);
    }
});

btn3.addEventListener("click", function(e){
    if(current_user.textContent === "로그인을 해주세요!"){
        e.preventDefault();
    
        modal[0].style.display="block";
        errorTextDefault(0);
    }
});

btn4.addEventListener("click", function(e){
    if(current_user.textContent === "로그인을 해주세요!"){
        e.preventDefault();
    
        modal[0].style.display="block";
        errorTextDefault(0);
    }
});

//회원가입버튼
btnJoin.addEventListener("click",function(e){
    e.preventDefault();
    modal[0].style.display= "none";
    modal[1].style.display= "block";
    errorTextDefault(1);
})

//아이디 / 비밀번호찾기 버튼
btnForget.addEventListener("click",function(e){
    e.preventDefault();
    modal[0].style.display = "none";
    modal[2].style.display = "block";
    modalPassword.style.display ="none";
    errorTextDefault(2);
    errorTextDefault(3);
})

//바탕화면 누르면 초기화
window.onclick = function(e){
    for(let i=0; i<modal.length; i++){
        if(e.target == modal[i]){
            modal[i].style.display="none";
        }
    }
}

//버튼 눌렀을때 flash 초기화
var errorTextDefault = function(index){
    var errorText = document.getElementsByClassName("error");
    if(errorText[index].textContent !== "") errorText[index].style.display="none";
}

//로그인 및 회원가입 오류시 나타내는 메시지
var errorTextShowup = function(){
    if(errorMessage[0].textContent !== ""){
        modal[0].style.display="block";
        modal[1].style.display="none";
        modal[2].style.display="none";
    }
    
    if(errorMessage[1].textContent !== ""){
        modal[0].style.display="none";
        modal[1].style.display="block";
        modal[2].style.display="none";
    }
    
    if(errorMessage[2].textContent !== ""){
        modal[0].style.display ="none";
        modal[1].style.display ="none";
        modal[2].style.display ="block";
    }

    if(errorMessage[2].textContent !== "해당하는 이메일이 없습니다" && errorMessage[2].textContent !== ""){
        modal[0].style.display ="none";
        modal[1].style.display = "none";
        modal[2].style.display = "block";
        modalPassword.style.display="block";
    }
}

errorTextShowup();

