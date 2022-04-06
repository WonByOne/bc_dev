package j10;

class ATM {
	static int account = 10000;	
	public synchronized void out(String name, int money) {
		if(account == 0) {
		System.out.println(name+": Out of money");	
		try {
			wait ();
		}
		catch (InterruptedException e) {
			e.printStackTrace();
		}
		} else {
			
			account -= 1000;
			System.out.println(name+" : "+account);
			notifyAll();	// 접근이 끝났음을 알려줌
		}
	}
}
//class ATM {
//	private int account = 100000;
//	public void out(int money) {
//		account -= money;
//		if(account<0) {
//			System.out.println(name+" : Out of money");
//			try {
//				wait();
//			} catch(InterruptedException e) {
//				e.printStackTrace();
//			}
//		} else {
//			System.out.println(name+" 잔고 : "+account);
//			notifyAll();
//		}
//	}
//}

class Person extends Thread {
	private ATM a;
	private int cnt;
	private String name;
	public Person(ATM a, String name, int cnt) {
		this.a = a;
		this.cnt = cnt;
		this.name = name;
	}
	public void run() {
		for(int i=0;i<cnt;i++) {
//			System.out.print(name+"\t: ");	// 먼저 출력을 한 뒤에 thread로 출력을 하게되니 꼬이는 현상 발생
//			a.out();	
			a.out(name, 1000);				// out method에서 이름 출력까지 모두 담당하게 해서 해결				
		}
	}
	
}

public class ThreadStudy {
	public static void main(String[] args) {
		// father 	1000원씩 10번
		// mother 	1000원씩 20번
		// son		1000원씩 5
		ATM a = new ATM();
		Person father = new Person(a, "Father", 10);
		Person mother = new Person(a, "Mother", 20);
		Person son = new Person(a, "Son", 5);
		
		father.start();
		mother.start();
		son.start();
		
	}
}
