
	function contextPath(){
		var hostIndex = location.href.indexOf(location.host) + location.host.length;
		var contextPath = location.href.substring(hostIndex, location.href.indexOf('/',hostIndex+1));
		return contextPath;
	}
	const cp = contextPath();


	function loginCheck(loginUser){
		if(loginUser){
			location.href= cp+"/board/free_board/write.bo";
		}else{
			alert('로그인 후 이용 가능합니다');
			location.href=cp+"/user/login.us"
		}
	}

