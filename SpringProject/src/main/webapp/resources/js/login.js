(function() {
	console.log('스크립트 호출 성공!');
})();


// <input> 입력 시에 checkInput 함수실행
// 로그인 페이지
$('.loginForm_txt').on('input', checkInput);

function checkInput() {
	
  var loginTxt_check = $('.loginForm_txt').val();   // loginForm.jsp <input> 변수
  var loginBtn = $('.login_btn');

  if (loginTxt_check === '') {
    // 기본 로그인 버튼 색상
	 loginBtn.removeClass('on');
  } else {
    // ID 비밀번호 입력 시에 로그인 버튼 배경색 변경
	 loginBtn.addClass('on');
  }
  
}

// 회원가입 페이지
$('.joinForm_txt').on('input', checkInput);

function checkInput() {
	
  var joinTxt_check = $('.joinForm_txt').val();   // joinForm.jsp <input> 변수
  var joinBtn = $('.join_btn');

  if (joinTxt_check === '') {
    // 기본 회원가입 버튼 색상
	 joinBtn.removeClass('on');
  } else {
    // 회원가입 항목 입력 시에 회원가입 버튼 배경색 변경
	 joinBtn.addClass('on');
  }
  
}