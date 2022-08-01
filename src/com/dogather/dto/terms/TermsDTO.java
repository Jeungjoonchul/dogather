package com.dogather.dto.terms;

public class TermsDTO {
	private int terms_index;
	private String terms_title;
	private String terms_contents;
	private String terms_type;
	public int getTerms_index() {
		return terms_index;
	}
	public void setTerms_index(int terms_index) {
		this.terms_index = terms_index;
	}
	public String getTerms_title() {
		return terms_title;
	}
	public void setTerms_title(String terms_title) {
		this.terms_title = terms_title;
	}
	public String getTerms_contents() {
		return terms_contents;
	}
	public void setTerms_contents(String terms_contents) {
		this.terms_contents = terms_contents;
	}
	public String getTerms_type() {
		return terms_type;
	}
	public void setTerms_type(String terms_type) {
		this.terms_type = terms_type;
	}
}
