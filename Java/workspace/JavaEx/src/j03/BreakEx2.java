package j03;

// 최초로 합이 2000 넘을 때 그 수와 합

public class BreakEx2 {

	public static void main(String[] args) {
		
		int i = 0;
		int sum = 0;
		while (true) {
			i++;
			sum += i;
			if (sum > 2000) break;
			
		}
		
		System.out.println("i   : " + i);
		System.out.println("합계 : " + sum);
		
	}

}
