package com.chan.dto;

import org.springframework.web.multipart.MultipartFile;

public class HelpDTO {
	
	//================join=================
	private String join_id;
	
	public String getJoin_id() {
		return join_id;
	}
	public void setJoin_id(String join_id) {
		this.join_id = join_id;
	}
	
	//===========notice=============================
	private int notice_id;
	private String notice_subject;
	private String notice_content;
	private String notice_saveFileName;
	
	
	public String getNotice_saveFileName() {
		return notice_saveFileName;
	}
	public void setNotice_saveFileName(String notice_saveFileName) {
		this.notice_saveFileName = notice_saveFileName;
	}
	private String notice_created;
	
	private MultipartFile file;
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	
	
	public String getNotice_created() {
		return notice_created;
	}
	public void setNotice_created(String notice_created) {
		this.notice_created = notice_created;
	}
	
	//===========faq=============================
	

	private int faq_id;
	private String faq_subject;
	private String faq_content;
	private String faq_division;



	public int getFaq_id() {
		return faq_id;
	}
	public void setFaq_id(int faq_id) {
		this.faq_id = faq_id;
	}
	public String getFaq_subject() {
		return faq_subject;
	}
	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public String getFaq_division() {
		return faq_division;
	}
	public void setFaq_division(String faq_division) {
		this.faq_division = faq_division;
	}
	
	//===========delivery=============================	
	
	private String addr1;
	private String addr2;
	
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	
	//===========qnalist(1:1»ó´ã)=============================	

	private int qna_id;
	private String qna_select;
	private String qna_type;
	private String qna_subject;
	private String qna_content;
	private String qna_created;
	private String qna_saveFileName;
	private String qna_state;
	private String qna_store;
	private String qna_reply;
	
	


	public String getQna_reply() {
		return qna_reply;
	}
	public void setQna_reply(String qna_reply) {
		this.qna_reply = qna_reply;
	}
	public String getQna_store() {
		return qna_store;
	}
	public void setQna_store(String qna_store) {
		this.qna_store = qna_store;
	}
	public String getQna_state() {
		return qna_state;
	}
	public void setQna_state(String qna_state) {
		this.qna_state = qna_state;
	}
	public String getQna_created() {
		return qna_created;
	}
	public void setQna_created(String qna_created) {
		this.qna_created = qna_created;
	}
	public int getQna_id() {
		return qna_id;
	}
	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
	}
	public String getQna_select() {
		return qna_select;
	}
	public void setQna_select(String qna_select) {
		this.qna_select = qna_select;
	}
	public String getQna_type() {
		return qna_type;
	}
	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_saveFileName() {
		return qna_saveFileName;
	}
	public void setQna_saveFileName(String qna_saveFileName) {
		this.qna_saveFileName = qna_saveFileName;
	}

	
	
	
	
	

}
