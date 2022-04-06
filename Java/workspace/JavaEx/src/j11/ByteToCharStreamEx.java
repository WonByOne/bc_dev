package j11;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

// 1byte -> 2bytes
// InputStreamReader 	
// OuputStreamWriter

public class ByteToCharStreamEx {
	
	public String input(String str) {
		System.out.print(str);
//		InputStreamReader isr = new InputStreamReader(System.in);	// 키보드 입력을 2바이트로 바꿔줌
//		BufferedReader br = new BufferedReader(isr); 				// isr 객체를 매개변수로
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		// isr 변수 없이 만든 객체를 직접 매개변수로 사용
		try {
			return br.readLine();	
		} catch(IOException e) {
			return null;			// 예외처리를 할 때 catch 영역에서도 리턴을 해야한다 아니면 throws 사용 
		}
	}
	
	
	public static void main(String[] args) throws FileNotFoundException, IOException{
		ByteToCharStreamEx btc = new ByteToCharStreamEx();
		String id = btc.input("ID\t: ");
		String passwd = btc.input("Password : ");
		
//		FileOutputStream fos = new FileOutputStream("src/j11/ByteToCharStreamEx.txt");
//		OutputStreamWriter osw = new OutputStreamWriter(fos);
//		BufferedWriter bw = new BufferedWriter(osw);
		BufferedWriter bw = new BufferedWriter(	// close 할 때는 변수 없는 객체들은 garbage가 되어 JVM이 회수
								new OutputStreamWriter(
									new FileOutputStream("src/j11/ByteToCharStreamEx.txt")));
		bw.write("ID\t: ");
		bw.write(id);
		bw.newLine();
		bw.write("Password : ");
		bw.write(passwd);
		bw.newLine();
		
		if(bw!= null) bw.close();
		
	}

}
