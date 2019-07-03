<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="repository"
	class="kr.co.torpedo.hellojsp.repository.hibernate.HibernateRepository" />
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	boolean check = repository.checkManager(id, passwd);

	if (check) {
		response.sendRedirect("viewUserList.jsp");
	} else {
		response.sendRedirect("loginFail.html");
	}
%>