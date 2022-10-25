<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div style="width : 1200px; margin: 0 auto">
        <div class="container-fluid px-4">
        
         <div class="row"><!-- 하단 메뉴바 ...기본!!-->
                        <div class="col">
                            <ul class="nav justify-content-center">
                                <li class="nav-item">
                                  <a class="nav-link active" aria-current="page" href="./blogIndex">둘러보기</a>
                                </li>
                                <li class="nav-item">
                                  <a class="nav-link" href="#">검색</a>
                                </li>
                                <li class="nav-item">
                                  <a class="nav-link" href="./boardWriteAll">기록하기</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">알림</a>
                                </li>
                                <li class="nav-item">
                                	<c:choose>
		                                <c:when test="${!empty sessionMemberInfo }"><!-- 이거 조건문 다시 걸기..블로그 만들었으면 myblog -->
		                                    <a class="nav-link" href="./Intro">내 옷장</a>
		                                </c:when>
		                                <c:otherwise>
		                                    <a class="nav-link" href="./myBlog">내 옷장</a>
		                                </c:otherwise>
                                	</c:choose>	
                                   
                                </li>
                              </ul>
                        </div>
          </div>
   		 </div>
</div>