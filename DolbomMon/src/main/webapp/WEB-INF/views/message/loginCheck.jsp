<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	if("${msg}"!="" && "${msg}"!=null){
		alert("${msg}");	
	}
	if("${back}"!="" && "${back}"!=null){
		history.go(-${back});
	}else{
		history.go(-1);
	}
	
</script>