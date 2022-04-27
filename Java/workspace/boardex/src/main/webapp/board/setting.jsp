<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="project" value="/boardex/board"/>	<%-- 프로젝트 경로 --%>

<c:set var="msg_list_x" value="게시판에 글이 없습니다. 글쓰기를 눌러주세요."/>
<c:set var="msg_passwd" value="Enter password."/>
<c:set var="msg_modify" value="수정할 정보를 입력하세요."/>
  
<c:set var="page_list" value="글 목록"/>
<c:set var="page_write" value="글 작성"/>
<c:set var="page_content" value="글 보기"/>
<c:set var="page_delete" value="글 삭제"/>
<c:set var="page_modify" value="글 수정"/>

<c:set var="str_count" value="전체 글"/>
<c:set var="str_list" value="목록"/>
<c:set var="str_writer" value="작성자"/>
<c:set var="str_email" value="E-Mail"/>
<c:set var="str_subject" value="제목"/>
<c:set var="str_content" value="내용"/>
<c:set var="str_passwd" value="비밀번호"/>
<c:set var="str_num" value="글 번호"/>
<c:set var="str_readcount" value="조회"/>
<c:set var="str_reg_date" value="작성일"/>

<c:set var="btn_write" value="작성"/>
<c:set var="btn_cancel" value="취소"/>
<c:set var="btn_list" value="목록"/>
<c:set var="btn_modify" value="수정"/>
<c:set var="btn_delete" value="삭제"/>
<c:set var="btn_reply" value="답글"/>
<c:set var="btn_mod_cancel" value="수정 취소"/>