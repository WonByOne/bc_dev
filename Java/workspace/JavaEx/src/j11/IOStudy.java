package j11;

//txt 		-> 	txt
//2 5 + 	->	2 + 5 = 7

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.StringTokenizer;

class Calc {
	private int a;
	private int b;
	private char c;
	private String r;
	
	public Calc(int a, int b, char c) {
		this.a = a;
		this.b = b;
		this.c = c;
	}
	
// 원래는 내부에서 파일 출력까지 하도록 설계했지만 예외 처리가 중복 되어 결과값만 리턴하도록 변경
	public String result() {	// 파일에 출력할 문자열 리턴
		switch (c) {
		case '+': r = Integer.toString(a + b); break;	// case " " 문자열 로 해도 됨
		case '-': r = Integer.toString(a - b); break;
		case '*': r = Integer.toString(a * b); break;
		case '/': r = Double.toString((double)a / b); break;
		}
		return a+" "+c+" "+b+" = "+r;
	}
}

public class IOStudy {

	public static void main(String[] args) {
		
		String msg = null;
		
	    BufferedReader br = null;
	    BufferedWriter bw = null;
	    try {
//	    	new FileWriter("src/j11/IOStudy_result.txt");	// 파일 열고, while 안에서 한줄씩 출력
			br = new BufferedReader(new FileReader("src/j11/IOStudy.txt"));			// 가비지 처리 JVM
			bw = new BufferedWriter(new FileWriter("src/j11/IOStudy_result.txt"));
			while((msg=br.readLine()) != null ) {
				// String st[] = msg.split(" ");		// 배열로 받는 방법
				StringTokenizer st = new StringTokenizer(msg);
				Calc calc = new Calc(Integer.parseInt(st.nextToken()), 
									 Integer.parseInt(st.nextToken()),
									 st.nextToken().charAt(0));	// char로 변환 하지만 문자열 그대로해도 됨
//				bw = new BufferedWriter(new FileWriter("src/j11/IOStudy_result.txt"),true); // 한줄씩
				bw.write(calc.result());
				bw.newLine();
//				bw.flush();	// flush를 반복문 바깥에 하면 파일에 추가할 필요가 없음
			} 
			bw.flush();		// 버퍼에 써둔 걸 한번에 파일로!
		} catch(FileNotFoundException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(br != null) br.close();
				if(bw != null) br.close();
			} catch(IOException e) {
				e.printStackTrace();
			}			
		}
	}
}
