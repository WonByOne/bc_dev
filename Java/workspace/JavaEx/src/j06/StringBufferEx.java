package j06;

public class StringBufferEx {	

	public static void main(String[] args) {
		
		// 생성
		// lang package - import 불필요
		StringBuffer sb = new StringBuffer( "Hello Java!!");// 문자열 제외 16byte 추가
		System.out.println("Capacity :\t" + sb.capacity()); 
		System.out.println("Size :\t\t" + sb.length());
		System.out.println();
		
		// 추가
		System.out.println("Insert :\t" + sb.append( "!!" ));		// 버퍼에 "!!" 추가 
		System.out.println("After Insert :\t" + sb);				// sb 자체가 바뀜
		System.out.println("Insert : \t" + sb.insert(5, " & JSP"));	// sb[5]에 추가
		System.out.println();
		
		// 삭제
		System.out.println("Delete :\t" + sb.delete(5, sb.length()));	// sb[5]부터 끝까지 지움
		System.out.println("Capacity :\t" + sb.capacity()); 			// 할당된 메모리는 그대로
		System.out.println("Size :\t\t" + sb.length());	
		System.out.println();
	
		//trim
		sb.trimToSize();	// 빈 메모리 반납, 매개변수, 리턴 없음
		System.out.println("Capacity :\t" + sb.capacity());
		System.out.println("Size :\t\t" + sb.length());
	}

}
