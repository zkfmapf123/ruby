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

var btn = document.getElementById("btn1");
var modal = document.getElementsByClassName("modal");
var btnJoin = document.getElementById("btnJoin");
var btnForget = document.getElementById("btnForget");

btn.addEventListener("click", (e)=>{
    e.preventDefault();

    modal[0].style.display="block";
});

btnJoin.addEventListener("click",(e)=>{
    e.preventDefault();

    modal[0].style.display="none";
    modal[1].style.display="block";
    modal[2].style.display="none";
})

btnForget.addEventListener("click",(e)=>{
    e.preventDefault();

    modal[0].style.display="none";
    modal[1].style.display="none";
    modal[2].style.display="block"
})

window.onclick = (e) =>{
    for(let i=0; i<modal.length; i++){
        if(e.target == modal[i]){
            modal[i].style.display="none";
        }
    }
}
