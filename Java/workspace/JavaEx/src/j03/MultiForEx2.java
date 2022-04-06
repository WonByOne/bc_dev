package j03;

public class MultiForEx2 {

	public static void main(String[] args) {

// 		screen.putString(0, 0, "foo", Color.WHITE, Color.BLACK);
		
		for (int i=0;i<=9;i++) {
			
			if ( i == 0 )
				for (int j=2;j<=9;j++) {
					System.out.print(j + "단\t");
					if(j==9) System.out.println();
				}
			else {
									
				for (int j=2;j<=9;j++) {
										
					System.out.print( j + "*" + i + "=" + String.format("%2d", i*j));
					System.out.print( "\t" );
					
				}
			System.out.println();
			
			}
		}
		
		
	}

}
