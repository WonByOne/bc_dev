package j03;

public class SwitchEx3 {

	public static void main(String[] args) {
		String a = args[0];
		switch(a) {			// available String since v1.7
		case "1" : System.out.println("One"); break;
		case "2" : System.out.println("Two"); break;
		case "3" : System.out.println("Three"); break;
		default : System.out.println("String");
		}
		
	}

}
