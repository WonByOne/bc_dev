package j09;

import java.util.HashSet;

/* 
Collection		Set			HashSet
							TreeSet
				List		Vector		Stack
							ArrayList
				Queue		LinkedList

Map				HashMap
				HashTable
*/


//Set			index 없는 주머니 - 중복이 불가능
public class HashSetEx {
	public static void main(String[] args) {
		// 생성
		HashSet <String> hs = new HashSet <String>();
		// 추가
		System.out.println("추가 : "+hs.add("홍길동"));
		System.out.println("추가 : "+hs.add("이순신"));
		System.out.println("추가 : "+hs.add("홍길동"));	// 중복 불가
		System.out.println("크기 : "+hs.size());
		
		// 검색
		System.out.println("검색 : "+hs.contains("김유신"));
		
		// 삭제
		System.out.println("삭제 : "+hs.remove("홍길동"));
		
		// 출력
		for(String str : hs) {		// 개선된 루프 * 인덱스 없는 컬렉션도 가능
			System.out.println("출력 : "+str);
		}
		
	}

}



		










