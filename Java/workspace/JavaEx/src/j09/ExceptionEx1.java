package j09;

// 예외처리 에러가 안 나는 예외	-	사용자의 편의성을 위해
// C		에러		경고
// Java		에러		에러		예외

// 예외처리에서는 쓸데없는 부분을 하면 실행시간이 길어진다.
// 어디에서 예외가 생기는지 아는 게 중요.

public class ExceptionEx1 {

	public static void main(String[] args) {
//		int a;
//		System.out.println(a); 		// C에서는 스레기값 출력 가능, Java에서는 불가능
		
		int m[] = {10, 20, 30};
		
		try {		// 실제로는 m[i] 부분에서 예외가 발생하지만 가독성으로 인해 for, if 등은 묶어주는 것이 좋다.
			for(int i=0; i<m.length+1; i++) {			
				System.out.println("m["+i+"] : "+m[i]);	// C에서는 m[3] 쓰레기값 출력
			}											// 자바에서는 예외 발생	
			System.out.println("For Terminated"); 		// 예외가 있으면 그냥 종료되기 때문에 실행되지 않음	
		} catch(ArrayIndexOutOfBoundsException e) {		// 예외가 발생하면 예외클래스 객체가 전달됨
			System.out.println("Array Index Out of Bounds");
		} finally {
			System.out.println("Terminated");
		}	
	}
}
