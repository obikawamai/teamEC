<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<header>
	<div id="header">
		<div id="header-title">galaxy</div>
		<div id="header_menu">
			<ul>

				<s:form action="SearchItemAction">
					<!-- カテゴリを表示 -->
					<s:if test="session.containsKey('mCategoryList')">
						<li><s:select name="categoryId" list="#session.mCategoryList"
								listKey="categoryId" listValue="categoryName" id="categoryId" class="
								text_box"/></li>
					</s:if>

					<!-- 商品検索ワードを表示-->
					<li><s:textfield name="searchWord" placeholder="検索ワード" class="text_box"/></li>

					<!-- 商品検索ボタン押下 -->
					<li><s:submit value="商品検索" class="submit_btn"/></li>
				</s:form>

				<!-- 未ログインなら、ログインボタンを表示 -->
				<s:if test="#session.loginFlg==0">
					<s:form action="GoLoginAction">
						<li><s:submit value="ログイン" class="submit_btn"/></li>
					</s:form>
				</s:if>

				<!-- ログインしてたら、ログアウトボタン表示 -->
				<s:if test="#session.loginFlg==1">
					<s:form action="LogoutAction">
						<li><s:submit value="ログアウト" class="submit_btn"/></li>
					</s:form>
				</s:if>

				<!-- カートボタン押下-->
				<s:form action="CartAction">
					<li><s:submit value="カート" class="submit_btn"/></li>
				</s:form>

				<!-- ログインしてたら、マイページボタン表示 -->
				<s:if test="#session.loginFlg==1">
					<s:form action="MyPageAction">
						<li><s:submit value="マイページ" class="submit_btn"/></li>
					</s:form>
				</s:if>
			</ul>
		</div>

	</div>
</header>