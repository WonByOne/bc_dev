package j09;

import java.util.Stack;

// LIFO 	Last In First Out
public class StackEx {

	public static void main(String[] args) {
		// 생성
		String [] groupA = {"사우디", "이란", "쿠웨이트", "대한민국"};
		
		Stack <String> s = new Stack<String>();
		
		for(int i=0;i<groupA.length;i++) {
			System.out.println(s.push(groupA[i]));
		}
		// 검색
		System.out.println("검색 : "+s.search("대한민국"));	// 제일 위가 1
		System.out.println("검색 : "+s.search("사우디"));	// 밑바닥이 4
		
		// 삭제
		System.out.println("삭제 : "+s.remove(1));  		// remove가 부모인 Vector의 method이기 때문에
														// index 방식이 달라서 대한민국 아닌 이란이 지워짐
		System.out.println("삭제 : "+s.remove("대한민국"));
		// 출력

		while(!s.empty()) {
//			System.out.println("출력 : "+s.peek());		// 제일 위에 있는 것 보고 그대로 둠 - 무한루프
			System.out.println("출력 :"+s.pop());
		}
		
	}

}
