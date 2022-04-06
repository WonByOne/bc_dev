package j11;

/* 
	입력			출력
1byte	InputStream	OutputStream
2byte	Reader		Writer

*/

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class CharStreamEx {
	public static void main(String[] args) {
//		int data = 0;	// 한글자씩 읽을 때 사용
		String msg = null;
	    FileReader fr = null;
	    FileWriter fw = null;
	    BufferedReader br = null;
	    BufferedWriter bw = null;
	    
	    try {
	    	fr = new FileReader("src/j11/CharStreamEx.txt");
	    	fw = new FileWriter("src/j11/CharStreamEx1.txt");
	    	br = new BufferedReader(fr);
	    	bw = new BufferedWriter(fw);
	    	
//	    	while((data = br.read()) != -1) {		// 한글자씩 읽어오기
//	    		System.out.print((char)data);
//	    		bw.write(data);
//	    	}
	    	
	    	while((msg=br.readLine()) != null) {	// 한 행씩 읽어오기 LFCR을 잘라버림
	    		System.out.println(msg);	
	    		bw.write(msg);		
	    		bw.newLine();						// LFCR을 추가해줘야 함				
	    	}
	    	
	    	bw.flush();
	    	
	    } catch(FileNotFoundException e) {
	    	e.printStackTrace();	
	    } catch(IOException e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
	    		if(fr != null) fr.close();
	    		if(br != null) br.close();	// 일반 reader 먼저 닫은 후 buffer도 닫아야 한다 
		    	if(fw != null) fw.close();
		    	if(bw != null) bw.close();
		    	
	    	} catch(IOException e) {
	    		e.printStackTrace();
	    	}	
	    }
	}
}
