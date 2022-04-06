package j08;

import java.awt.Dimension;
import java.awt.Toolkit;
import java.awt.Frame;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class InnerClassEx2 extends Frame {
	public InnerClassEx2() {
		Dimension res = Toolkit.getDefaultToolkit().getScreenSize();
//		Dimension siz = this.getSize();  // 사이즈가 정해지기 전에 받으면 0, 0이 된다.
		setVisible(true);
		setSize(300, 300);
		Dimension siz = this.getSize();
		setLocation((res.width-siz.width)/2, (res.height-siz.width)/2);
		
//		WindowAdapter wa = new WindowAdapter() {
//			public void windowClosing(WindowEvent e) {
//				System.exit(0);
//			}
//		};
//		
//		addWindowListener(wa);
		
		addWindowListener(						// 익명 내부클래스 사용법
			new WindowAdapter() {
				public void windowClosing(WindowEvent e) {
					System.exit(0);
				}
			
			}
		);	
	}
	
	

	public static void main(String[] args) {
		new InnerClassEx2();	// 생성자 호출  
	}

}
