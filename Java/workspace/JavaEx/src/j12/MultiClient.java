package j12;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.lang.reflect.Field;
import java.net.Socket;
import java.nio.charset.Charset;

class MultiReadThread extends Thread {
	private Socket s;	// 지금 이 예제에서는 쓰이지 않음 확인해볼 것
	private BufferedReader br;
	private String returnmsg;
	public MultiReadThread(Socket s) throws IOException {
		this.s = s;		// 멤버 변수에 넣었지만 사용되지 않음
		br = new BufferedReader(new InputStreamReader(s.getInputStream())); // 받아온 소켓에 직접?
	}
	public synchronized void run() {
		try {
			while(true) {
				returnmsg = br.readLine();
				if (returnmsg.equals("exit")) {
					System.out.println("Connection terminated");
					break;
				}
				else System.out.println(returnmsg);
			}
		} catch(IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(s != null) s.close();	
				if(br != null) br.close();
			} catch(IOException e) {
				e.printStackTrace();
			}
		}
	}
}

class MultiWriteThread extends Thread {
	private Socket s;
	private BufferedWriter bw;
	private BufferedReader brmsg;
	private String msg;
	private String name;
	public MultiWriteThread(Socket s) throws IOException {
		this.s = s;
		bw = new BufferedWriter(new OutputStreamWriter(s.getOutputStream()));
		brmsg = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("Enter ID : ");
		name = brmsg.readLine();
		bw.write(name);
		bw.newLine();
		bw.flush();
	}
	public synchronized void run() {
		try {
			// 소켓을 넘기는 순간 접속되기 때문에 생성자에서 바로 ID를 넘기면 됨
//			System.out.print("ID를 입력하세요 : ");
//			name = brmsg.readLine();
//			bw.write(name);
//			bw.newLine();
//			bw.flush();
			while(true) {
				this.sleep(10);	// 입력창과 서버 메세지 겹치는 것 방지
				System.out.print("Message to send : ");
				msg = brmsg.readLine();
				bw.write(msg);
				bw.newLine();
				bw.flush();
				if(msg.equals("exit")) {
//					System.out.println("Connection terminated");	// 읽는 쪽을 닫고 마무리
					break;
				}
			}
		} catch(IOException e) {
			e.printStackTrace();
		} catch(InterruptedException e) {
			e.printStackTrace();
		} finally {
			try {
//				if(s != null) s.close();							// 읽는 쪽에서 닫아야 함
				if(bw != null) bw.close();
				if(brmsg != null) brmsg.close();
			} catch(IOException e) {
				e.printStackTrace();
			}
		}
	}
	
}
public class MultiClient {
	private Socket s;
	public MultiClient(String ip, int port) throws IOException {
		s = new Socket(ip, port);
		MultiReadThread mrt = new MultiReadThread(s);
		MultiWriteThread mwt = new MultiWriteThread(s);
		mrt.start();
		mwt.start();
	}
	
	public static void main(String[] args) throws IOException, NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException {
		System.setProperty("file.encoding","UTF-8");
//		Field charset = Charset.class.getDeclaredField("defaultCharset");
//		charset.setAccessible(true);
//		charset.set(null,null);



		
		new MultiClient("192.168.10.140", 3000);
	}

}
