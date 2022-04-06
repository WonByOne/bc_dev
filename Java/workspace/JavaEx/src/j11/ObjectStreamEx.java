package j11;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Vector;

// 객체 단위 입출력 - 클래스 단위(구조체 단위)
//				- bin class는 객체 직렬화 필요
//				- vector 등 컬렉션, 맵 들은 이미 직렬화가 되어 있다
class Customer implements Serializable {	// bin class 직렬화 
	private String name;
	private String tel;
	private transient int point;			// tansient 직렬화 제외 옵션
	
	public Customer(String name, String tel, int point) {
		this.name = name;
		this.tel = tel;
		this.point = point;
	}
	public String getName() {
		return name;
	}
	public String getTel() {
		return tel;
	}
	public int getPoint() {
		return point;
	}
}

public class ObjectStreamEx {
	public static void main(String[] args) {
		FileOutputStream fos = null;
		ObjectOutputStream oos = null;
		FileInputStream fis = null;
		ObjectInputStream ois = null;
		
		try {
			fos = new FileOutputStream("src/j11/ObjectStreamEx_result.ser");	// 객체 직렬화 파일 생성
			oos = new ObjectOutputStream(fos);
			
			Customer m[] = { new Customer("홍길돌", "1111-2222", 500),
							 new Customer("이순신", "1111-3333", 1000),
							 new Customer("김유신", "2222-5555", 5000),
							 new Customer("강감찬", "2222-7777", 2000),
							 new Customer("대조영", "1111-1111", 3000)};

// 벡터로 바꾸어라
			Vector<Customer> v = new Vector<Customer>();
			for(int i=0;i<m.length;i++) {
				v.add(m[i]);
			}
			
			oos.writeObject(v);		// 객체 단위 입출력
//			oos.writeObject(m);		// 사실 배열은 직렬화 안해도 가능하다
		
			fis = new FileInputStream("src/j11/ObjectStreamEx_result.ser");
			ois = new ObjectInputStream(fis);
			
//			Customer n[] = (Customer []) ois.readObject();				// 배열로 바로 받아오는 방법			

//			for(int i=0;i<n.length;i++) {
//									n[i]= (Customer) ois.readObject();	// 이렇게 하나하나 읽어오지 않아도 됨 
//				System.out.println("Name\t: "+m[i].getName());
//				System.out.println("Tel\t: "+m[i].getTel());
//				System.out.println("Point\t: "+m[i].getPoint());
//			}	


			Vector<Customer> vv =	(Vector<Customer>) ois.readObject();
			
			for(int i=0; i<vv.size();i++) {
				Customer c = vv.get(i);	// Customer 객체가 나옴
				System.out.println("Name\t: "+c.getName());
				System.out.println("Tel\t: "+c.getTel());
				System.out.println("Point\t: "+c.getPoint());
			}
			
			
//			oos.writeObject(new Customer("홍길동", "2322-3332", 500));
//			
//			fis = new FileInputStream("src/j11/ObjectStreamEx_result.ser");
//			ois = new ObjectInputStream(fis);
//			Customer cus = (Customer) ois.readObject();
//			
//			System.out.println("Name\t: "+cus.getName());
//			System.out.println("Tel\t: "+cus.getTel());
//			System.out.println("Point\t: "+cus.getPoint());
			
			
			
		} catch(FileNotFoundException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				if(fis != null) fis.close();
				if(ois != null) ois.close();
				if(fos != null) fos.close();
				if(oos != null) oos.close();
			} catch(IOException e) {
				e.printStackTrace();
			}
		}
		
		
	}
}
