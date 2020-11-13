<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	        
	        <div class="modal-body">
			 <div class="panel-body">
			      <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th style="width: 40px; text-align: center;">거래번호</th>
                                        <th style="text-align: center;">신청날짜</th>
                                        <th style="text-align: center;">계약서</th>
                                        <th style="text-align: center;">진행상태</th>
                                        <th style="text-align: center;">고용인</th>
                                        <th style="text-align: center;">선생님</th>
                                        <th style="text-align: center;">금액</th>
                                        <th style="text-align: center;">입금일</th>
                                        <th style="text-align: center;">입금상태 </th>
                                        <th style="text-align: center; width: 130px" >특이사항 </th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<!-- 
                                	<c:forEach items="3" var="rcListVO" varStatus="status">
                                	 -->
                                	<%
                                		for(int i=0; i<=10; i++){
                                	%>
                                	
                                	
                                    <tr class="odd gradeX">
                                    	<td style="text-align: center; vertical-align: middle;">3,750</td>
                                        <td style="text-align: center; vertical-align: middle;">2020-11-13 17:50</td>
                                        <td style="text-align: center; vertical-align: middle;"><a href="#">계약서 링크</a></td>
                                        <td style="text-align: center; vertical-align: middle;">진행중</td>
                                        <td style="text-align: center; vertical-align: middle;">홍길동</td>
                                        <td style="text-align: center; vertical-align: middle;">이순신</td>
                                        <td style="text-align: center; vertical-align: middle;">105,000</td>
                                        <td style="text-align: center; vertical-align: middle;">2020-11-15 11:30</td>
                                        <td style="text-align: center; vertical-align: middle;">입금완료
                                           <!-- <c:set value="0" var="status"/>
                                                <c:choose>
                                                 <c:when test="${status ==0}">입금확인중 </c:when>
                                                 <c:when test="${status ==1}">입금완료</c:when>
                                                 <c:when test="${status ==2}">지불완료</c:when>
                                                 <c:when test="${status ==4}">환불신청</c:when>
                                                 <c:when test="${status ==4}">환불완료</c:when>
                                                </c:choose>
                                            -->         
                                         </td>
                                         <td style="text-align: center; vertical-align: middle;"></td>
                                    </tr>
                                    <%
                                		}
                                    %>
                                    <!-- </c:forEach> -->
                                    
                                </tbody>
                            </table>
			 <!-- /.table-responsive -->
			  </div>
	        </div>
	        
	        <div class="modal-footer">
	        </div>



