package j10;

import java.awt.Frame;
import java.awt.Label;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.Calendar;

// Thread				// 하나의 프로그램 안에서 여러가지 작업을 동시에 실행하기 위해 - 한 작업을 더 빨리도 가능
// Multi Tasking
// Multi Process
// Multi Thread
// Tss Time Sharing System 시분할방
// Multi Tasking

class Thread1 extends Thread {
	public void run() {
		int cnt = 0;
		while(true) {
			System.out.println(++cnt);
		}
	}
}

class Thread2 extends Frame implements Runnable {	// Runnable interface로 thread로 만듬
	Label la = new Label();
	public Thread2() {	// 객체 생성 시 한 번만 실행될 부분은 생성자에
		add(la);
		la.setAlignment(Label.CENTER);
		setVisible(true);
		setSize(300, 200);
		setLocation(1000, 200);
		addWindowListener(
			new WindowAdapter() {
				public void windowClosing(WindowEvent e) {
					System.exit(0);
				}
			}
		);
	} 
	
	public void run() {	// 동시에 실행할 작업
		while(true) {
			Calendar now = Calendar.getInstance();
			String str = now.get(Calendar.HOUR_OF_DAY)+" : "
						+now.get(Calendar.MINUTE)+" : "
						+now.get(Calendar.SECOND);
			la.setText(str);
		}
	}
}

public class ThreadEx1 {

	public static void main(String[] args) {
		Thread1 t1 = new Thread1();	// Thread 상속 안에 start() 구현되어 있음 
		t1.start();
		Thread2 t2 = new Thread2();	// Runnable 안에 start() 미구현 
		Thread t = new Thread(t2);	
		t.start();
	}
}
