package study;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PersonServlet extends HttpServlet {
	public void doGet( HttpServletRequest request, HttpServletResponse response )
		throws IOException, ServletException{
		//1.요청을 받는다
		String name =new String( 
				request.getParameter( "name" ).getBytes("8859_1"), "utf-8" );
		//요청에다가 한글처리를 해줘야 이름이 출력나온다 겟바이츠로 쪼개서 8859_1이 기본모양에서 utf로 변형시켜줘라

		int age = Integer.parseInt( request.getParameter( "age" ) );
		String gender = request.getParameter( "gender" );
		String hobby[] = request.getParameterValues( "hobby" );
		
		if( gender.equals("1") ) gender = " 남자";
		else gender = " 여자";
		
		//2.요청을 처리한다
		
		//3.응답할 스트림을 생성한다
		response.setContentType( "text/html; charset=utf-8" ); //응답에 대한 한글은 "당신은 ..이런문자
		PrintWriter out = response.getWriter();
		
		//4.응답하면된다
		out.println( "<html>" );
		out.println( 	"<head>" );
		
		out.println( 		"<meta charset='utf-8'>" );
		
		out.println( 	"</head>" );
		out.println( 	"<body>" );
		
		out.println( 		"당신의 이름은 " + name + "입니다.<br>" );
		out.println( 		"나이는 " + age + "살 이고 먹을만큼 먹은" + gender + "입니다." );		
		
		
		out.println(		"취미는 ");
		for( int i=0; i<hobby.length; i++) {
			switch( hobby[i] ) {
			case "1" : out.println( "독서" ); break;
			case "2" : out.println( "등산" ); break;
			case "3" : out.println( "운동" ); break;
			case "4" : out.println( "게임" ); break;
			}
		}
		out.println(		"입니다 ");
		out.println(	"</body>");
		out.println("</html>");
		
		
		
		
		out.println( 	"</body>" );
		out.println( "</html>" );
		
		
		
		
	}
	public void doPost( HttpServletRequest request, HttpServletResponse response )
		throws IOException, ServletException {
		doGet( request, response );
	}
}























