package j10;

import java.util.Enumeration;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Vector;
public class VectorEx {

	public static void main(String[] args) {
		// 생성 
		Vector <String> v = new Vector(5, 3);
		System.out.println("Capacity : "+v.capacity());
		System.out.println("Size : "+v.size());
		// 추가
		System.out.println("Insert : "+v.add("홍길동"));
		v.addElement("이순신");
		v.addElement("김유신");
	    v.add(2,"홍길동");
	    v.insertElementAt("강감찬", 2);
	    v.add(2,"대조영");
	    
	    System.out.println("Capacity : "+v.capacity());
		System.out.println("Size\t: "+v.size());
		// 삭제
		HashSet<String>hs = new HashSet<String>();
		hs.add("홍길동");
		hs.add("이순신");
		hs.add("연개소문");
		System.out.println( "Remove\t: "+v.removeAll(hs));
		
		// 검색
		System.out.println("Search\t: "+v.contains("홍길동"));
		
		// 출력
		for(int i=0;i<v.size();i++) {
			System.out.println("출력\t: "+v.get(i));
//			System.out.println("출력 : "+v.elementAt(i)); 	// 완전히 같다 
		}
		// 배열에 넣기
		String str[] = new String[v.size()];
		v.copyInto(str);
		for(int i=0;i<str.length;i++) {
			System.out.println("Array\t: "+str[i]);
		}
		// Iterator // 반복문 안될 때 가능하게 
		Iterator<String>it = v.iterator();
		while(it.hasNext()) {
			System.out.println("Iterator : "+it.next());
		}
		// Enumeration
		Enumeration<String> e = v.elements();
		while(e.hasMoreElements()) {
			System.out.println("Enumeration : "+e.nextElement());
		}
		// Trim
		System.out.println("Capacity : "+v.capacity());
		System.out.println("Size\t: "+v.size());
		v.trimToSize();
		System.out.println("Capacity : "+v.capacity());
		System.out.println("Size\t: "+v.size());
		
	}
		
}
