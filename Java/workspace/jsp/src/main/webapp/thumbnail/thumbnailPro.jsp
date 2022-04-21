<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.Graphics"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>Thumbnail Image: Process</h2>

<%
	String path = application.getRealPath("/save");
	new File(path).mkdir();
	
	MultipartRequest multi = new MultipartRequest(
		request, path, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());
	
	String title = multi.getParameter("title");
	String name = multi.getParameter("name");
	String originName = multi.getOriginalFileName("img");
	String systemName = multi.getFilesystemName("img");
%>
실제 경로 : <%=path%><br>
제목 : <%=title%><br>
파일 이름 : <%=originName%><br>
저장 이름 : <%=systemName%><br>
<br>
<img src="/jsp/save/<%=systemName%>">

<%
	String oname = path + "\\" + systemName; 	// *.jpg
	String tname = path + "\\t" + systemName;	// t*.jpg
	int size = 5;
%>
<%
	RenderedOp op = JAI.create("fileload", oname);	// 파일 로드 옵션
	BufferedImage obuffer = op.getAsBufferedImage();
	int width = obuffer.getWidth() / size;
	int height = obuffer.getHeight() /size;
	
	BufferedImage tbuffer = new BufferedImage(
			width, height, BufferedImage.TYPE_INT_RGB);	// buffer 생성
	Graphics g = tbuffer.getGraphics(); 				// 그림 그릴 연필 객체
	g.drawImage(obuffer, 0, 0, width, height, null);	// buffer에 그리기
	
	ImageIO.write(tbuffer, "jpg", new File(tname));
	ImageIO.write(tbuffer, "png", new File(tname));
	ImageIO.write(tbuffer, "gif", new File(tname));
%>
<br>
썸네일 이미지<br>
<img src="/jsp/save/t<%=systemName%>">

<h2>이미지 다운로드</h2>
<%-- 화면에 보여지게 된다
<a href="/jsp/save/<%=systemName%>"><%=originName%></a>  --%>
<a href="/jsp/file/fileDownload.jsp?originName=<%=originName%>&systemName=<%=systemName%>">
	<%=originName%></a>

<body bgcolor="black" text="#d6d6d6"/>