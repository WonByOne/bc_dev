package j02;

// 90점 이상 A

public class ElseifEx {

	public static void main(String[] args) {

		int a = Integer.parseInt(args[0]);
		
//		if (a >= 90) System.out.println("A학점");
//		if (a < 90 && a >= 80) System.out.println("B학점");
//		if (a < 80 && a>= 70) System.out.println("C학점");
//		if (a < 70 && a >= 60) System.out.println("D학점");
//		if (a < 60) System.out.println("F학점");
		
		if (a >= 90) System.out.println("A학점");
		else if (a >= 80) System.out.println("B학점");
		else if (a >= 70) System.out.println("C학점");
		else if (a >= 60) System.out.println("D학점");
		else System.out.println("F학점");
		}
		
	}

