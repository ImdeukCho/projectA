
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<link rel="stylesheet" href="style.css" />
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
    <body>
        <button type='button' id="modal_btn">로그인</button>
        
        <div class="게시판">   
        </div>

        <div class="modal_background"></div> 
        <div class="modal_wrap">
            <h1 class="LoginTitle" 
              style="text-align: center; 
              border-bottom: 1px solid gray; padding-bottom: 5px;">
              로그인
            </h1>
            <img src="Log_img/classLogo.png" width="150" height="80"
             style="text-align: center;">
            <p>class가 처음이신가요??&#160<a href="">회원가입</a></p>
            <div class="modal_close"><img src="Log_img/close.png"></div>
            <section class="login-form">
              <form action="loginActionServlet"> <!-- 로그인 연결하기. -->
                <div class="int-area">
                  <input type="text" name="userId" id="userId"
                  autocomplete="off" required value="id1">
                  <label for="userId">ID</label>
                </div>
                <div class="int-area">
                  <input type="password" name="userPasswd" id="userPasswd"
                  autocomplete="off" required value="1234">
                  <label for="userPasswd">PASSWORD</label>
                </div> 
                <div >
                  <input type="checkbox" id="savelogin"><label for="savelogin">ID 저장 (cookie 구현예정)</label>
                </div>
                <div class="btn-area">
                  <button type="submit">LogIn</button>
                </div>
              </form>
            </section>
           
          <div class="login-type">
              <a class="btn btn1"href="https://www.naver.com/">네이버 계정으로 로그인</a>
              <a class="btn btn2"href="https://www.kakaocorp.com/">카카오 계정으로 로그인</a>
          </div>
        </div>
    </body>

    <script>
        'use strict';
        const modal_wrap = document.querySelector('.modal_wrap')
        const modal_background = document.querySelector('.modal_background')
    
        //팝업창 보이기
        document.querySelector('#modal_btn').addEventListener('click', () => {
        open()
        })
    
        //팝업창 x 누르면 팝업창 닫기
        document.querySelector('.modal_close').addEventListener('click', () => {
        close()
        })
    
        //팝업창 바깥부분 클릭시 팝업창 닫기
        window.addEventListener('click', (e) => {
        e.target === modal_background ?  close() : false
        })
        function close(){
        modal_wrap.classList.remove('show-modal');
        modal_background.classList.remove('show-modal');
        }
        function open(){
        modal_wrap.classList.add('show-modal')
        modal_background.classList.add('show-modal')
        }

        </script>

        <script>
          let userId = document.querySelector('#userId')
          let userPasswd = document.querySelector('userPasswd')
          let btn = document.querySelector('#btn')

          btn.addEventListener('click', () => {
              if(userId.value == "") {
                  label = userId.nextElementSibling
                  label.classList.add('warning')
                  setTimeout(() => {
                      label.classList.remove('warning')
                  }, 1500)
              } else if(userPasswd.value == "") {
                  label = userPasswd.nextElementSibling
                  label.classList.add('warning')
                  setTimeout(() => {
                      label.classList.remove('warning')
                  }, 1500)
              }
          })
        </script>
</html>