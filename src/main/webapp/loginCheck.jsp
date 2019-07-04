<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="repository"
	class="kr.co.torpedo.hellojsp.repository.hibernate.HibernateRepository" />
<jsp:useBean id="manager" class="kr.co.torpedo.hellojsp.domain.Manager" />
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	manager = repository.selectManager(id);
	if (manager == null) {
		response.sendRedirect("loginFail.html");
	} else {
		boolean check = manager.checkManager(id, passwd);
		if (check) {
			response.sendRedirect("viewUserList.jsp");
		} else {
			response.sendRedirect("loginFail.html");
		}
	}
%>