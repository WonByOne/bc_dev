package j10;

// thread synchronization
// 동시에 접근하는 method 에게 synchronized
class BreadPlant {
	private int cnt;		// 빵의 개수
	public synchronized void make() {	// ++
		if(cnt > 9) {
			System.out.println("Bread Overflow");
			try {
				wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		} else {
			cnt++;
			System.out.println("Bread Made: "+cnt);
		}
	}
	public synchronized void sell() {	// --
		if(cnt < 1) {
			System.out.println("Bread Shortage");
			try {
				wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		} else {
			cnt--;
			System.out.println("Bread Sold: "+cnt);
		}
	}
}

class BreadMaker extends Thread {
	private BreadPlant bp;
	public BreadMaker(BreadPlant bp) {
		this.bp = bp;
	}
	public void run() {
		for(int i=0;i<10;i++) {
			bp.make();
		}
	}
}

class BreadSeller extends Thread {
	private BreadPlant bp;
	public BreadSeller(BreadPlant bp) {
		this.bp = bp;
	}
	public void run() {
		for(int i=0;i<10;i++) {
			bp.sell();
		}
	}
}

public class ThreadEx3 {

	public static void main(String[] args) {
		BreadPlant bp = new BreadPlant();
		BreadMaker bm = new BreadMaker(bp);
		BreadSeller bs = new BreadSeller(bp);
		
		bm.start();
		bs.start();
		BreadMaker bm1 = new BreadMaker(bp);
		BreadSeller bs1 = new BreadSeller(bp);
		bm1.start();
		bs1.start();
	}
}
