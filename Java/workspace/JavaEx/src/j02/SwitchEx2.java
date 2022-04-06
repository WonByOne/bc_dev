package j02;

// 0 ~ 100 아니면 유효값 아님

public class SwitchEx2 {

	public static void main(String[] args) {
		int a = Integer.parseInt(args[0]);
		
		if (a <= 100 && a >= 0) {
			switch (a / 10) {  
			case 10 : 
			case 9 : System.out.println("A"); break;
			case 8 : System.out.println("B"); break;
			case 7 : System.out.println("C"); break;
			case 6 : System.out.println("D"); break;
			default : System.out.println("F");
			}
		}
		else System.out.println("Error");
	}

}
