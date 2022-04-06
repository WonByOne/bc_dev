package j11;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

// 1byte file io

public class ByteStreamEx {
	public static void main(String[] args) {
		int data = 0;
		FileInputStream fis = null;		// fis 객체를 try 밖에서 선언해야 finally에서 인식할 수 있다
		FileOutputStream fos = null; 	// 버퍼 사용 안 함
		BufferedInputStream bis = null;	// 버퍼 사용
		BufferedOutputStream bos = null;
		
		try {
			fis = new FileInputStream("src/j11/ByteStreamEx.txt"); 	// JavaEx PRJ 현재 디렉토리
			fos = new FileOutputStream("src/j11/ByteStreamEx1.txt");	// file 생성
			bis = new BufferedInputStream(fis);			
			bos = new BufferedOutputStream(fos);
			
			while((data = bis.read()) != -1) {		
				// 1byte 씩 읽어오기 때문에 한글은 콘솔에 출력에는 문제가 생기지만 파일에는 그대로 복사가 된다
				System.out.print((char)data);	// read()의 리턴값은 ASCII  
				bos.write(data);				// buffer에 쓰기 때문에 file에 아직 쓰지 않은 상태
			}
			bos.flush();						// file에 쓰기
			
		} catch(FileNotFoundException e) {		// file이 없을 경우의 예외
			e.printStackTrace();
		} catch(IOException e) {			
			e.printStackTrace();
		} finally {
			try {
				if(fis != null) fis.close();	// 버퍼도 닫아야 한다.
				if(bis != null) bis.close();
				if(fos != null) fos.close();
				if(bos != null) bos.close();
			} catch(IOException e) {
				e.printStackTrace();
			}
		}
		
	}

}
