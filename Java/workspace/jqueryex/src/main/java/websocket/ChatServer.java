package websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket/chat")	// WebSocket 객체에 넘긴 문자열과 같아야함
public class ChatServer {
	private String prefix = "Guest";
	private static int cnt = 0;
	private static List<ChatServer> clients = new ArrayList<ChatServer>();
	// 객체생성이 직접 불가라 arraylist 이용해야한다?
	private Session session; // 웹소켓 임포트 필요
	private String name;
	
	public ChatServer() {
		String threadName = "Thread Name : " + Thread.currentThread().getName();
		name = prefix + " : " + ++cnt;
		System.out.println(threadName+" : "+name);
	}
	@OnOpen	 // 이벤트 클래스 임포트 필요 - 자기 밑에 있는 함수를 실행한다
	public void start(Session session) {
		System.out.println("Client connected : "+session);
		this.session = session;
		clients.add(this);
		String message = name + "님이 접속했습니다.";
		broadcast(message);
	}
	@OnClose
	public void end() {
		clients.remove(this);
		String message = name + "님이 퇴장했습니다.";
		broadcast(message);
	}
	@OnMessage
	public void incoming(String msg) {
		if(msg == null || msg.equals("")) {
			return;
		}
		broadcast(msg);
	}
	@OnError
	public void error(Throwable t) throws Throwable {
		System.out.println("Error : "+t.toString());
	}
	
	public void broadcast(String message) {
		for(int i=0; i<clients.size(); i++) { 	// 클라이언트 만큼 반복
			ChatServer client = clients.get(i);	// ChatServer 클래스의 arraylist 이므로
			
			try { 
				synchronized(client) {			// 동기화
					client.session.getBasicRemote().sendText(message);
				}
			} catch(IllegalStateException e) {	// 송신 중 수신 시 발생
				if(e.getMessage().indexOf("[TEXT_FULL_WRITING") != -1) {	// 정해진 값
					new Thread() {
						public void run() {
							while(true) {
								try {
									client.session.getBasicRemote().sendText(message);
									break;
								} catch(IOException e) {
									e.printStackTrace();
								} catch(IllegalStateException e) {
									try {
										Thread.sleep(1000);
									} catch(InterruptedException e1) {
										e1.printStackTrace();
									}
								}
							}
						}
					}.start();	// 익명 내부 클래스
				}
				
			} catch(Exception e) {
				System.out.println("Foreced terminated : "+e.getMessage());
				clients.remove(this);
				try {
					client.session.close();
				} catch(IOException e1) {		// 위쪽 exception과 변수명 안 겹치게
					e1.printStackTrace();
				}
				String msg = name + "님이 강제 종료했습니다.";
				broadcast(msg);
			}
		}
	}
}
