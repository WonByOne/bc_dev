<%@page import="java.net.URLEncoder"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> 파일 업로드 - 처리페이지 </h2>

<%
	String path = application.getRealPath( "/save" );
	new File( path ).mkdir();
	
	MultipartRequest multi = new MultipartRequest( request, path, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy() );
%>
경로 : <%=path%> <br>

<%
	String originName1 = multi.getOriginalFileName( "upload1" );
	String systemName1 = multi.getFilesystemName( "upload1" );
	
	String originName2 = multi.getOriginalFileName( "upload2" );
	String systemName2 = multi.getFilesystemName( "upload2" );
	
%>
파일이름 1 : <%=originName1%> <br>
저장이름 1 : <%=systemName1%> <br>
파일이름 2 : <%=originName2%> <br>
저장이름 2 : <%=systemName2%> <br>

<%
	String name = multi.getParameter( "name" );
	String title = multi.getParameter( "title" );
%>
이름 : <%=name%> <br>
제목 : <%=title%> <br>

<h2> 파일 다운로드 </h2>

<%--
파일 1 : <a href="/JSP/save/<%=systemName1%>"><%=originName1%></a> <br>
파일 2 : <a href="/JSP/save/<%=systemName2%>"><%=originName2%></a> <br>
 --%>
<%
	String originName11 = URLEncoder.encode( originName1, "utf-8" );
	String systemName11 = URLEncoder.encode( systemName1, "utf-8" );
	String originName22 = URLEncoder.encode( originName2, "utf-8" );
	String systemName22 = URLEncoder.encode( systemName2, "utf-8" );
%>
파일 1 : <a href="fileDownload.jsp?originName=<%=originName11%>&systemName=<%=systemName11%>">
		<%=originName1%></a> <br>
파일 2 : <a href="fileDownload.jsp?originName=<%=originName22%>&systemName=<%=systemName22%>">
		<%=originName2%></a> <br>



















