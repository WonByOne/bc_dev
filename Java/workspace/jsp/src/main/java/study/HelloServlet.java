package study;



import java.io.IOException;

import java.io.PrintWriter;



import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;



// 클라이언트 에서 서버쪽으로 --------request

// 서버에서 클라이언트로 ------------response







public class HelloServlet extends HttpServlet { //웹서버에 올릴 자바 작업

    //재정의를 해줘야 한다 그래서 거기다가 할일을 지정해주면 된다

    @Override

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 

        throws ServletException, IOException {

        // 요청을 받는다.     
        // 데이터를 처리한다.

        // 응답할 스트림 생성한다.

        resp.setContentType( "text/html; charset=utf-8"); //응답에 한글을 할수있게 셋팅

        PrintWriter out = resp.getWriter();

        

        //결과를 응답한다.

        out.println( "<html>" );
        out.println(     "<head>" );
        out.println(         "<meta charset='utf-8'>" );//헤드안에 한글 인코딩이 들어간다
        out.println(         "<title> Servlet </title>" );
        out.println(     "</head>" );
        out.println(     "<body>" );
        out.println(         "Hello Servlet!!!<br>" );
        out.println(         "안녕하세요<br>" );        
        out.println(     "</body>" );
        out.println( "</html>" );

        // 실행 하면 주소가 
        // 이렇게 나온다 http://localhost:8080/jsp/servlet/study.HelloServlet
        // 원래는 웹브라우저에서 프로그램을 접속하지 못하게 해놯다 
        // 그래서 서블릿맵핑??? 을 해줘야한다 그래야 실행이 된다
        // src > java > webapp > web-inf > web.xml 에 정의해야 함 

    }

    @Override

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 

        throws ServletException, IOException {



        doGet( req, resp ); //똑같은걸 2개 짤필요 없이 여기에다가 짜면 던져서사용

        }

}