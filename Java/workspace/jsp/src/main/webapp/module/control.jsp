<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>Flow Control Page</h2>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String product = request.getParameter("product");
	String name = null;
	String control = null;
	
	String company = request.getParameter("company");
	
	String sub = "";
	String cname;	// 왼쪽메뉴 및 content의 회사명 출력용 변수
%>
<%
	if(product.equals("1")) {
		control = "tv";	// tv.jsp tvleft.jsp
		name= "Televison";
		if(company == null || company.equals("1")) {
			sub = "";
			cname = "SAMSUNG";
		} else if(company.equals("2")) {
			sub = "lg";
			cname = "LG";
		} else if(company.equals("3")) {
			sub = "sony";
			cname = "SONY";
		}
		
	} else if(product.equals("2")) {
		control = "dc";	// dc.jsp dcleft.jsp
		name = "Digital Camera";
		if(company == null || company.equals("1")) {
			sub = "";
		} else if(company.equals("2")) {
			sub = "nik";
		} else if(company.equals("3")) {
			sub = "sony";
		}
		
		
	} else if(product.equals("3")) {
		control = "pc";	// pc.jsp pcleft.jsp
		name = "Computer";
		if(company == null || company.equals("1")) {
			sub = "";
		} else if(company.equals("2")) {
			sub = "lg";
		} else if(company.equals("3")) {
			sub = "hp";
		}
			
			
	} else if(product.equals("4")) {
		control = "cp";
		name = "Cellphone";
		if(company == null || company.equals("1")) {
			sub = "";
		} else if(company.equals("2")) {
			sub = "ss";
		} else if(company.equals("3")) {
			sub = "mi";
		}
	}
	
%>
<%-- template 으로 조건문에 따라 넘김 --%>
<jsp:forward page="template.jsp"> 
	<jsp:param name="paramName" value="<%=name%>"/>
	<jsp:param name="paramControl" value="<%=control%>"/>
	<jsp:param name="paramSub" value="<%=sub%>"/>
</jsp:forward>

<body bgcolor="black" text=#d6d6d6>

</body>
