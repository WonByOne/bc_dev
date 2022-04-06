package j10;

// thread 우선순위
class ThreadPri extends Thread {
	private String name;
	public ThreadPri(String name) {
		this.name = name;
	}
	public void run() {
		for(int i=0;i<5;i++) {
			System.out.println(name+" : "+i);
			
//			try {
//				Thread.sleep(1);				// 잠시 멈추면 thread 3개씩 묶어서 실행 됨
//			} catch (InterruptedException e) {	// interrupt 발생 예외 처리
//				e.printStackTrace();
//			}
		}
	}
}

public class ThreadEx2 {
	public static void main(String[] args) {
		ThreadPri t1 = new ThreadPri("1st");
		ThreadPri t2 = new ThreadPri("2nd");
		ThreadPri t3 = new ThreadPri("3rd");
		
//		t1.setPriority(Thread.MAX_PRIORITY);	// 우선순위 지정 그러나 강제성은 없다
//		t3.setPriority(Thread.MIN_PRIORITY);
		
		
		t1.start();
		try {
			t1.join();							// thread 끝날 때까지 기다려라 강제성이 있다
		} catch (InterruptedException e) {		// 강제성이 있으면 예외처리
			e.printStackTrace();
		}		
		t2.start();
		t3.start();
		
	}
}
