package j07;

// Inheritance
// 부모 것은 내것 except Constructor // 생성자는 자동호출이라서 가져와도 사용할 수 없음
// 재사용 - 코드의 간결성, 개발 시간 단축

// class CellPhone		모델명, 전화번호 관리
// class CaPhone		카메라 화소 관리
// class Mp3Phone		화음 관리

class CellPhone {	// file 하나에 구현할 때는 public 빼야 함
//	private String model;
//	private String tel;
	
	private String model;
	private String tel;
	
	public CellPhone() {
		System.out.println("부모생성자");	// 확인용
	}
	public CellPhone( String model, String tel) {
		this.model = model;
		this.tel = tel;
		
	}
	
	public String getModel() {
		return model;
		
	}
	
	public String getTel() {
		return tel;
		
	}
	
	public void printModel() {
		System.out.println( "모델명\t: "+this.model);
	}
	public void printTel() {
		System.out.println( "전화번호\t: "+this.tel);
	}

}

class CaPhone extends CellPhone {	// class CellPhone 상속
	private int pixel;
	public CaPhone(int pixel) {
		this.pixel = pixel;
	}
	
	public CaPhone ( String model, String tel, int pixel) {
//		this.model = model;	// 부모 생성자에서 해야할 일
//		this.tel = tel;
//		super();			// 부모 default 생성자 호출, 생성자끼리만 사용, 생략 가능
		super(model, tel);	// private 대신 접근하도록 해주는 역할
		this.pixel = pixel;
//		System.out.println("자식생성자");	// 확인용
	}
	
	public int getPixel(){
		return pixel;
	}
	
	public void printPixel() {
		System.out.println("화소\t: " +this.pixel);
	}
}

class Mp3Phone extends CaPhone {
	private int chord;
	public Mp3Phone(String model, String tel, int pixel, int chord) {
		super(model, tel, pixel);
		this.chord = chord;
	}
	
	public int getChord(){
		return chord;
	}
	
	public void printChord() {
		System.out.println("화음\t: " +this.chord);
	}
}

public class InheritEx {

	public static void main(String[] args) {
//		CellPhone cp = new CellPhone("K-500", "1111-2222");
//		
//		System.out.println( "모델명\t: "+cp.getModel());
//		System.out.println( "전화번호\t: "+cp.getTel());
		
//		CaPhone ca = new CaPhone("K-500", "1111-2222", 500);
//		
//		ca.printModel();		// Class CaPhone에는 printModel 멤버 함수가 없지만 상속으로 사용 가능
//		ca.printTel();
//		ca.printPixel();
		
		Mp3Phone mp = new Mp3Phone("K-500", "1111-2222", 500, 64);
		mp.printModel();
		mp.printTel();
		mp.printPixel();
		mp.printChord();
		
	}
}
