package j03;

public class BreakEx {

	public static void main(String[] args) {
		int i = 0;
		
		while (true) {
			i++;
			if (i > 10) break;
			if (i%2 != 0) continue;			// 반복문 처음으로 홀수면 출력을 안 하게 되는 효과
			System.out.println("i : " + i);
			
			
		}
		
	}

}
