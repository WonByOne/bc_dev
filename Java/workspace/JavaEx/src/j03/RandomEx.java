package j03;

import java.util.Random;

public class RandomEx {

	public static void main(String[] args) {
		
		Random r = new Random();
		
		System.out.println( r.nextInt(100) ); 				// 0 ~ 99
		
		System.out.println(Math.random());  				// 0.0 ~ 1.0미만 실수
		
		System.out.println((int)(Math.random()*100) + 1); 	// 곱셉 후 형변환 1 ~ 100
	}

}
