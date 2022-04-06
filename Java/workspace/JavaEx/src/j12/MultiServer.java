package j12;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;

class MultiServerThread extends Thread{
	private Socket s;
	private BufferedReader br; 
	private BufferedWriter bw;
	private String msg;
	private String name;
	private static ArrayList<BufferedWriter> list = new ArrayList<BufferedWriter>(); // broadcasting 접속한 모든 client의 소켓과 연결 된 bufferedwrite를 관리
	public MultiServerThread(Socket s) throws IOException {
		this.s = s;
		br = new BufferedReader(new InputStreamReader(s.getInputStream()));
		bw = new BufferedWriter(new OutputStreamWriter(s.getOutputStream()));
		list.add(bw);	// 접속한 client 소켓과 연결된 쓰기 buffer를 arraylist에 추가
	}
	public synchronized void run() {
		try {
			name = br.readLine();
			sendAll("[["+name+"]] joined");
			while(true) {
				msg = br.readLine();
				if(msg.equals("exit")) {
					bw.write(msg);
					bw.newLine();
					bw.flush();
					break;
				} else {
					sendAll("["+name+"] "+msg);
				}
			}
			System.out.println("Client Terminated");
		} catch(Exception e) {
			System.out.println("Forced Termination");
		} finally {
			try {
				list.remove(bw);
				sendAll("[["+name+"]] is out");
				if(s != null) s.close();
				if(br != null) br.close();
				if(bw != null) bw.close();
			} catch(IOException e) {
				e.printStackTrace();
			}
		}
	}	// run
	public void sendAll(String str) throws IOException {
		for(int i=0;i<list.size();i++) {
			BufferedWriter b = list.get(i);
			b.write(str);
			b.newLine();
			b.flush();
		}
	}
	
}

public class MultiServer {
	private ServerSocket ss;
	private Socket s;
	public MultiServer(int port) {
		try {
			ss = new ServerSocket(port);
			
			while(true) {
				System.out.println("Waiting Client..");
				s = ss.accept();
				System.out.println("Client connected : "+
						   s.getInetAddress().getHostName());
				MultiServerThread mst = new MultiServerThread(s);
				mst.start();
			}
			
		} catch(IOException e) {
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println("Forced Termination");
		}
		
		
	}	// 생성자
	public static void main(String[] args) {
		new MultiServer(3000);
			
	}

}
