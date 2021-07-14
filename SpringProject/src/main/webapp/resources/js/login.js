(function() {
	console.log('스크립트 호출 성공!');
})();


// <input> 입력 시에 checkInput 함수실행
// 로그인 페이지
$('.loginForm_txt').on('input', checkInput_login);

function checkInput_login() {
	
  var loginTxt_check = $('.loginForm_txt').val();   // loginForm.jsp <input> 변수
  var submitBtn = $('.submit_btn');

  if (loginTxt_check === '') {
    // 기본 로그인 버튼 색상
	  submitBtn.removeClass('on');
  } else {
    //  이메일,비밀번호 입력 시에 비밀번호 찾기 버튼 배경색 변경
	  console.log('스크립트 성공!');
	  submitBtn.addClass('on');
  }
  
} 


// 회원가입 페이지
$('.joinForm_txt').on('input', checkInput_join);

function checkInput_join() {
	
  var joinTxt_check = $('.joinForm_txt').val();   // joinForm.jsp <input> 변수
  var submitBtn = $('.submit_btn');

  if (joinTxt_check === '') {
    // 기본 회원가입 버튼 색상
	  submitBtn.removeClass('on');
  } else {
    //  회원가입 항목 입력 시에 비밀번호 찾기 버튼 배경색 변경
	  console.log('스크립트 성공!');
	  submitBtn.addClass('on');
  }
  
}


//비밀번호 찾기 페이지
$('.pwdSearchForm_txt').on('input', checkInput_pwd);

function checkInput_pwd() {
	
  var pwdSearchTxt_check = $('.pwdSearchForm_txt').val();   // pwdSearch.jsp <input> 변수
  var submitBtn = $('.submit_btn');

  if (pwdSearchTxt_check === '') {
    // 기본 비밀번호 찾기 버튼 색상
	  submitBtn.removeClass('on');
  } else {
    //  ID 이름 입력 시에 비밀번호 찾기 버튼 배경색 변경
	  console.log('스크립트 성공!');
	  submitBtn.addClass('on');
  }
  
}