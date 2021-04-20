<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String msg = (String)session.getAttribute("msg");
	if(msg != null)
		session.removeAttribute("msg");
	
	Member loginMember = (Member)session.getAttribute("loginMember");

%>  