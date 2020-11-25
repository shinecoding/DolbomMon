<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	if("${msg}"!="" && "${msg}"!=null){
		if("${msg}"=="errorcode-1"){
			alert("쪽지 보내기를 실패하였습니다. \n\n1. 받는이 아이디가 잘못되었을 수 있습니다. \n2. 제목은 한글 100자, 내용은 한글 1500자까지 허용됩니다.");	
		}else{
			alert("${msg}");
		}
	}
	if("${back}"!="" && "${back}"!=null){
		history.go(-${back});
	}else{
		history.go(-1);
	}
	
</script>