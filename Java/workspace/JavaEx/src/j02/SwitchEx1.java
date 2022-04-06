package j02;

public class SwitchEx1 {

	public static void main(String[] args) {

		int a = Integer.parseInt( args[0] );
		
		switch( a ) {        					    //  정수만 가능
		case 1 : System.out.println( "One" ); break;// case 같은 경우 들여쓰기 X 가독성
		case 2 : System.out.println( "Two" ); break;
		case 3 : System.out.println( "Three" ); break;
		default : System.out.println( "number");
		
		}
		
	}

}
