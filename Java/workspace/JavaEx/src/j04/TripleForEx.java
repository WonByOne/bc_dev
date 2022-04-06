package j04;

// 5만원을 권종별로

public class TripleForEx {

	public static void main(String[] args) {

		int sum = 50000;
		
		int[] m = new int[3];
		
		m[1]= 10000;
		
				
		for(int i=0;i<sum/m[0] + 1;i++) {
			for(int j=0;j<sum/m[1] + 1;j++) {
				for(int k=0;k<sum/m[3] + 1;k++) {
					if(i * m[0] + j * m[1] + k * m[2] == sum) {
						
						for(int l=0;l<=m.length;l++) {
						System.out.print( m[l] + "원 " + k + "장 ");
	
						}
						
					}
				}
			}
				
		}
			
		
		
		
		
	}

}
