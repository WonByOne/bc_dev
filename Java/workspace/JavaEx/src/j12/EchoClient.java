package j12;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;

public class EchoClient {
	private Socket s;			// 소켓은 클라이언트에서 만듬
	private BufferedReader br;	// 여러 멤버함수에서 사용하기 위해 
	private BufferedWriter bw;
	private BufferedReader brmsg;
	private String msg; 		// 보낼 메세지
	private String returnmsg;	// 받은 메세지
	
	public EchoClient(String ip, int port) throws IOException {
		s = new Socket(ip, port);	// 1. 소켓 생성
		
		// 3. 스트림 생성 (client) * server에도 할 것
		br = new BufferedReader(new InputStreamReader(s.getInputStream()));
		bw = new BufferedWriter(new OutputStreamWriter(s.getOutputStream()));
		brmsg = new BufferedReader(new InputStreamReader(System.in)); // 키보드 입력
		while(true) {	// server와 계속 송수신 가능하도록
			// 4. 메세지 송신
			System.out.print("Message to send : ");
			msg = brmsg.readLine(); 	// 받은 입력을 스트링으로
			bw.write(msg);				// 스트링을 스트림으로
			bw.newLine();			
			bw.flush();
			// 7. 메세지 수신
			returnmsg = br.readLine();
			if(returnmsg.equals("exit")) {
				System.out.println("Connection terminated");
				break;
			} else {
				System.out.println("Message returned : "+returnmsg);
			}
		}	// while
		// 8. 소켓 종료
		if(s != null) s.close();
		if(br != null) br.close();
		if(bw != null) bw.close();
		if(brmsg != null) brmsg.close();
		
	}	// 생성자

	
	public static void main(String[] args) throws IOException {
		new EchoClient("localhost",3000);	// 127.0.0.1 -> 서버 호출
	}

}
