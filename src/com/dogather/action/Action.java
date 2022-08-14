package com.dogather.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	// 비즈니스 로직을 수행할 모든 클래스들의 틀
	// excecute()가 실제 로직이 구현되어 있는 메소드(각 클래스에서 재정의)
	// 로직을 수행했다면 결과로 "어디로","어떻게" 이동할지가 나오기 때문에
	// 그 두 정보를 가지고 있는 ActionTo 객체를 만들어서 리턴하도록 설계를 한다.
	default public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		return null;
	}
	default public ActionTo execute(HttpServletRequest req, HttpServletResponse resp,String b_name,String r_name) throws ServletException, IOException {
		return null;
	}
	
}
