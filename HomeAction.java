package com.internousdev.galaxy.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.galaxy.dao.MCategoryDAO;
import com.internousdev.galaxy.dto.MCategoryDTO;
import com.internousdev.galaxy.util.CommonUtility;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;

	public String execute() {
		//ログインフラグを保持していない場合は、
		//未ログインとしてログインフラグを保持
		if (!session.containsKey("loginFlg")) {
			session.put("loginFlg", 0);
		}

		//未ログイン状態、かつ仮ユーザーIDを保持していない場合は、
		//仮ユーザーID（16桁のランダムな数字）を作成し、
		String tempLoginId = String.valueOf(session.get("loginFlg"));
		int loginFlg = "null".equals(tempLoginId) ? 0 : Integer.parseInt(tempLoginId);
		if (!session.containsKey("tempUserId") && loginFlg == 0) {
			CommonUtility commonUtility = new CommonUtility();
			session.put("tempUserId", commonUtility.getRamdomValue());
		}

		//DBのカテゴリーマスターテーブルからカテゴリーを取得し、
		//DB以外の保存領域に保持する。
		if (!session.containsKey("mCategoryList")) {
			List<MCategoryDTO> mCategoryList = new ArrayList<MCategoryDTO>();
			MCategoryDAO mCategoryDAO = new MCategoryDAO();
			mCategoryList = mCategoryDAO.getAllCategory();

			session.put("mCategoryList", mCategoryList);
		}
		return SUCCESS;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}