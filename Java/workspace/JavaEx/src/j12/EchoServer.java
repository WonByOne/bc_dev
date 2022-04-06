package j12;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.ServerSocket;
import java.net.Socket;

// network		data 이동 장치 집합
// node			network에 연결된 장치
// host			서비스 해주는 node
// IP			internet protocol
// port			2byte 0 ~ 1023까지는 사전 지정
// protocol		client - server 통신 규약
// TCP			protocol의 일종 전화
// UDP			protocol의 일종 편지

// server		response
// client		request

class EchoServerThread extends Thread {
	private Socket s;
	private BufferedReader br;	// 여러 멤버함수에서 사용하기 위해 
	private BufferedWriter bw;
	private String msg;
	public EchoServerThread(Socket s) {
		this.s = s;
	}
	public void run() {	// run은 throws 불가
		try {
			// 3. 스트림 생성 (server) * client에도 할 것
			br = new BufferedReader(new InputStreamReader(s.getInputStream()));
			bw = new BufferedWriter(new OutputStreamWriter(s.getOutputStream()));
			while(true) {	// 한 client와 계속 메세지 송수신
				// 5. 메세지 수신
				msg = br.readLine();
				// 6. 메시지 송신
				bw.write(msg);
				bw.newLine();
				bw.flush();
				
				if(msg.equals("exit")) {
					System.out.println("Client connection terminated");
					break;
				} else {
					System.out.println("Message recieved : "+msg);
				}
			}	
		} catch(IOException e) {
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println("Forced Termination");
		} finally {
			try {
				// 8. 소켓종료
				if(s != null) s.close();
				if(br != null) br.close();
				if(bw != null) bw.close();
			} catch(IOException e) {
				e.printStackTrace();
			}
		} 
		
	}
}	// EchoServerThread

public class EchoServer {
	private ServerSocket ss;	// 접속 확인용 소켓 - 클라이언트 소켓
	private Socket s;
	
	public EchoServer(int port) throws IOException{
		ss= new ServerSocket(port);
		while(true) {		// 2.접속 대기 무한루프
			System.out.println("Waiting Client...");
			s = ss.accept();// 클라이언트 소켓 가져옴
			System.out.println("Client connected : "+
							   s.getInetAddress().getHostName());
			EchoServerThread est = new EchoServerThread(s);
			est.start();
		}	// while
	}	// 생성자
	public static void main(String[] args) throws IOException {
		new EchoServer(3000);
		
	}
}

/*
public class EchoServer {
	private ServerSocket ss;	// 접속 확인용 소켓 - 클라이언트 소켓
	private Socket s;
	private BufferedReader br;	// 여러 멤버함수에서 사용하기 위해 
	private BufferedWriter bw;
	private String msg;
	public EchoServer(int port) throws IOException{
		ss= new ServerSocket(port);
		while(true) {		// 2.접속 대기 무한루프
			System.out.println("Waiting Client...");
			s = ss.accept();// 클라이언트 소켓 가져옴
			System.out.println("Client connected : "
				+ s.getInetAddress().getHostName());
			// 3. 스트림 생성 (server) * client에도 할 것
			br = new BufferedReader(new InputStreamReader(s.getInputStream()));
			bw = new BufferedWriter(new OutputStreamWriter(s.getOutputStream()));
			while(true) {	// 한 client와 계속 메세지 송수신
				// 5. 메세지 수신
				msg = br.readLine();
				// 6. 메시지 송신
				bw.write(msg);
				bw.newLine();
				bw.flush();
				
				if(msg.equals("exit")) {
					System.out.println("Client connection terminated");
					break;
				} else {
					System.out.println("Message recieved : "+msg);
				}
			}
			// 8. 소켓종료
			if(s != null) s.close();
			if(br != null) br.close();
			if(bw != null) bw.close();
		}	// while
	}	// 생성자
	public static void main(String[] args) throws IOException {
		new EchoServer(3000);
		
	}
}
*/
