package j10;

import java.util.Enumeration;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Vector;

public class HashtableEx {

	public static void main(String[] args) {
		// 생성
		Hashtable<Integer, String> ht = new Hashtable<Integer, String>();
		System.out.println(ht.put(9, "홍길동"));	// 출력하면 이전 put 값이 나온다.
		ht.put(3, "이순신");
		ht.put(2, "김유신");
		ht.put(7, "강감찬");
		ht.put(9, "대조영");	// 중복 Key 
		ht.put(5, "홍길동");
		
		System.out.println("Size\t: "+ht.size());
		// 출력
		Enumeration<String> e = ht.elements();	// Key 내림차순
		while (e.hasMoreElements()) {
			System.out.println("Value\t: "+e.nextElement());
		}
		Enumeration<Integer> en = ht.keys();	// Key 내림차순
		while(en.hasMoreElements()) {
			System.out.println("Key\t: "+ht.get(en.nextElement()));	// Key를 이용해서 Value 가져오기 
		}
		HashSet<Integer> hs = new HashSet<Integer>(ht.keySet()); 	// Hashset에 Key 넣기 오차순이 됨
		for(int a : hs) {
			System.out.println("Set\t: "+a);
		}
		Vector<String> v = new Vector<String>(ht.values());			// Vetor에 Value 넣기 내림차순 그대
		for(int i=0; i<v.size();i++) {
			System.out.println("Vector : "+v.get(i));
		}
	}

}
