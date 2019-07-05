<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="repository"
	class="kr.co.torpedo.hellojsp.repository.hibernate.HibernateRepository" />
<jsp:useBean id="admin" class="kr.co.torpedo.hellojsp.domain.Admin" />
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	admin = repository.selectManager(id);
	if (admin == null) {
		response.sendRedirect("loginFail.html");
	} else {
		boolean check = admin.checkAdmin(id, passwd);
		if (check) {
	response.sendRedirect("viewUserList.jsp");
		} else {
	response.sendRedirect("loginFail.html");
		}
	}
%>