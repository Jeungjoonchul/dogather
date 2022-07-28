package com.dogather.action;

public class ActionTo {
	//이동 경로
	private String path;
	
	//이동 방법(true : redirect / false : forward)
	private boolean isRedirect;

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
}
