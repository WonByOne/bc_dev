package j08;

import java.awt.Dimension;
import java.awt.Toolkit;

import java.awt.Frame;
import java.awt.event.WindowListener;
import java.awt.event.WindowEvent;
// 2. 상속

public class InterfEx4 extends Frame implements WindowListener { 	//인터페이스를 다 구현해야한다

	public InterfEx4() {
		super("Interface");
		Dimension res = Toolkit.getDefaultToolkit().getScreenSize();
		setVisible(true);
		setSize(400,200);
		setLocation(res.width/2, res.height/2);
		addWindowListener(this);
	}
	
	public void windowActivated(WindowEvent e) {}	// interface 앞에 modifier 없으면 default이므로 public 으로 확장
	public void windowClosed(WindowEvent e) {}
	public void windowClosing(WindowEvent e) {
		System.exit(0);	
	}
	public void windowDeactivated(WindowEvent e) {}
	public void windowDeiconified(WindowEvent e) {
		System.out.println("윈도우화");
	}
	public void windowIconified(WindowEvent e) {
		System.out.println("아이콘화");
	}
	public void windowOpened(WindowEvent e) {}
	
	public static void main(String[] args) {
//		// 1.객체생성
//		Dimension res = Toolkit.getDefaultToolkit().getScreenSize();
//		Frame f = new Frame("Interface");
//		f.setVisible(true);
//		f.setSize(400, 200);
//		f.setLocation(res.width/2, res.height/2);
		
		InterfEx4 ie = new InterfEx4();
//		ie.setVisible(true);		// 보통 처음에 무조건 해주는 건 생성자에 넣는다
		
		

		
		
	}

}
