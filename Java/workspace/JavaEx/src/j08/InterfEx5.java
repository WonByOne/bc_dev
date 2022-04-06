package j08;

import java.awt.Dimension;
import java.awt.Frame;
import java.awt.Toolkit;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
public class InterfEx5 extends WindowAdapter {	// 실제로는 Frame 클래스를 상속 받는게 맞다. 더 많이 사용할 것이기 때문에

	public void windowClosing(WindowEvent e) {
		System.exit(0);
	}
	public static void main(String[] args) {
		Dimension res = Toolkit.getDefaultToolkit().getScreenSize();
		 
		
		Frame f = new Frame("Interface");
		f.setVisible(true);
		f.setSize(400,200);
		Dimension siz = f.getSize();
		f.setLocation((res.width-siz.width)/2, res.height/2);
		f.addWindowListener(new InterfEx5());	// Listener가 Method의 위치를 모름. 
												// 어느 객체가 가지고 있는지 알려주어야 한다.	
	}
}
