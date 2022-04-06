package j09;

import j09.mypack.*;
//import j09.mypack.MypackOne;
//import j09.mypack.MypackTwo;

// 하위 패키지도 다른 패키지이므로 import가 필요하다 
public class PakageEx {

	public static void main(String[] args) {
		MypackOne a = new MypackOne();
		MypackTwo b = new MypackTwo();
		a.one();
		b.two();
	}

}
