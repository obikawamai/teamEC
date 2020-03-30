package com.internousdev.galaxy.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.galaxy.dao.UserInfoDAO;
import com.internousdev.galaxy.dto.UserInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class MyPageAction extends ActionSupport implements SessionAware {

	UserInfoDTO userInfoDTO;
	private Map<String, Object> session;

	public String execute() {
		String tempLoginId = String.valueOf(session.get("loginFlg"));
		int loginFlg = "null".equals(tempLoginId) ? 0 : Integer.parseInt(tempLoginId);
		if (loginFlg != 1) {
			return "loginError";
		}

		UserInfoDAO userInfoDAO = new UserInfoDAO();
		userInfoDTO = userInfoDAO.getUserInfo(String.valueOf(session.get("userId")));

		return SUCCESS;
	}

	public UserInfoDTO getUserInfoDTO() {
		return userInfoDTO;
	}

	public void setUserInfoDTO(UserInfoDTO userInfoDTO) {
		this.userInfoDTO = userInfoDTO;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}