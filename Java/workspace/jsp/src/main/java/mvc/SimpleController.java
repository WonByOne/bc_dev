package mvc;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SimpleController extends HttpServlet{ // 웹 서블릿 상속
	private Map<String, CommandHandler> handlerMap =
		new HashMap<String, CommandHandler>();
	@Override // init은 서블릿 실행되면 생성자처럼 항상 먼저 실행됨: 재정의 해준다
	public void init(ServletConfig config) throws ServletException {
		// ServletConfig를 이용해서 환경을 읽어옴
		String configFile = config.getInitParameter("configFile");
		String path = config.getServletContext().getRealPath("/"); // 최상위 path
		String filename = path + "/" + configFile;
		
		FileInputStream fis = null;
		Properties prop = new Properties();
		
		try {
			fis = new FileInputStream(filename);
			prop.load(fis);	// 환경 설정 읽어오기
			
			Iterator<Object> keys = prop.keySet().iterator();
			while(keys.hasNext()) {
				String command = (String) keys.next();
				String handlerName = prop.getProperty(command); // 핸들러 클래스 이름
				// 이름을 이용한 객체 생성
				Class<?> handlerClass = Class.forName(handlerName);
				CommandHandler handler = (CommandHandler) handlerClass.newInstance();
				handlerMap.put(command, handler); // command와 hander를 맵에 넣음
			}
		} catch(FileNotFoundException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		} catch(IllegalAccessException e) {
			e.printStackTrace();
		} catch(InstantiationException e) {
			e.printStackTrace();
		}
		
	}
	public void doProcess(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		// 1. 요청을 받는다
		// String command = request.getParameter("command");
		String command = request.getRequestURI();
		// http://localhost:8080/jsp/hello.do
		if(command.indexOf(request.getContextPath()) == 0) { // jsp까지 주소가 맞는지?
			// jsp뒤 쪽을 잘라서 넣는다.
			command = command.substring(request.getContextPath().length());
		}
		// 2. 요청 분석
		String result = null;
		String viewPage = null;	// 뷰페이지 선택을 위한 변수
/*	Handler 처리로 간단하게 만들기
		if(command == null) {	// 3. 요청 처리
			result = "처리할 요청이 없습니다";
			request.setAttribute("result", result); // 4. 처리 결과 저장
			viewPage = "/mvc/null.jsp";
		} else if(command.equals("hello")) {
			result = "안녕하세요";
			request.setAttribute("result", result);
			viewPage = "/mvc/hello.jsp";
		} else if(command.equals("bye")) {
			result = "안녕히 가세요";
			request.setAttribute("result", result);
			viewPage = "/mvc/bye.jsp";
		} else {
			result = "처리할 수 없는 요청입니다";
			request.setAttribute("result", result);
			viewPage = "/mvc/default.jsp";
		}
*/
/*		hander 속성 파일로 다시 정의
 		CommandHandler handler = null; 	// 다형성 구현 클래스는 implement를 통해 정의
		if(command == null) {
			handler = new NullHandler();		
		} else if(command.equals("hello")) {
			handler = new HelloHandler();
		} else if(command.equals("bye")) {
			handler = new ByeHandler();
		} else {
			handler = new DefaultHandler();
		}
*/
		CommandHandler handler = handlerMap.get(command);
		if(handler == null) {
			handler = new DefaultHandler();
		}
		
		try {	// 각 핸들러에서 던지 예외 처리
			viewPage = handler.process(request, response);	// 내장 객체 공유
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 5. 츨력 뷰로 fwd
		// 하나의 뷰페이지에 결과값만 다르게 출력
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/mvc/hello.jsp");
		// 뷰페이지 선택
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	@Override	// doGet 재정의
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		doProcess(req, resp);
	}
	@Override	// doPost 재정의
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		doProcess(req, resp);
	}
}
