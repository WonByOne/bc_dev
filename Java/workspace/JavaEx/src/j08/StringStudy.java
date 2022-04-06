package j08;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import java.util.StringTokenizer;
import java.util.Calendar;

class Person {
	private int year;
	private int month;
	private int day;
	private int sex;
	private int age;
	private String mf;
//	private String birth;
//	private String ssn;
	StringBuffer sb;			// - 제외하고 통째로 관리하기 위해서
	
	public Person(StringTokenizer st) {
//		 birth = st.nextToken();						// 생년부와 주민번호부를 구분했다.
//		 ssn = st.nextToken();
//		 sex = Integer.parseInt(ssn.substring(0, 1));
		sb = new StringBuffer();
		while(st.hasMoreTokens()) {
		sb.append(st.nextToken());
		}
	}
	public int year() {
		year = Integer.parseInt(sb.substring(0, 2));
		if(sex < 3) year += 1900;
		else year += 2000;
		return year;
	}
	public int month() {
		month = Integer.parseInt(sb.substring(2, 4));
		return month;
	}
	public int day() {
//		day = Integer.parseInt(sb.substring(4, 6));
//		day = (sb.charAt(4)-48) * 10 + (sb.charAt(5))-48;	// 각 자리 자릿수 뽑아서 더하는 방법
		char str[] = sb.toString().toCharArray();			// sb->String으로->char 배열로
		day = (str[4]-48)*10 + str[5] - 48;
		return day;
	}
	public String sex() {
		sex = sb.charAt(6) - 48;
		if(sex%2 == 0) mf = "여자";
		else mf = "남자";		
		return mf;
	}
	public int age() {
		Calendar now = Calendar.getInstance();
		age = now.get(Calendar.YEAR)-year+1;
		return age;
	}
}


public class StringStudy {
	
	public int year(int birth) {			// 자릿수 넣으면 잘라주는 계산 함수를 만들어 보자
		return birth/10000+1900;
	}
	public int month(int birth) {
		return birth%10000/100;
	}
	public int day(int birth) {
		return birth%100;
	}
	public String sex(int ssn) {
		if(ssn%2 == 0) return "여자";
		else return "남자";
	}
	
	
	public static void main(String[] args) throws Exception {
		// 950323-1111111 	주민번호를 입력	3/4 2000년 5/6외국인
		// 1995년 3월 23일생 남자 28세입니다.
		BufferedReader br = new BufferedReader( new InputStreamReader( System.in ) );
		
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		
		StringTokenizer st = new StringTokenizer("950323-1111111", "-");
		
//		System.out.println(st);	// 주소만 출력됨

		Person p = new Person(st);
		System.out.println(p.year()+"년 "+p.month()+"월 "+p.day()+"일생 "+p.sex()+" "+p.age()+"세입니다." );

		System.out.print("주민번호를 입력하세요 : ");
		StringTokenizer st1 = new StringTokenizer(br.readLine(), "-");
		
		int birth = Integer.parseInt(st1.nextToken());
		int ssn = Integer.parseInt(st1.nextToken());
		
		StringStudy me = new StringStudy();
		
		String mf = me.sex(ssn);
		int y = me.year(birth);
		int m = me.month(birth);
		int d = me.day(birth);
		
		System.out.println(ssn/100000);
		if ((ssn/100000)>2) y += 100;
		
		System.out.println(y+"년 "+m+"월 "+d+"일생 "+mf+" "+(year-y+1)+"세입니다." );
		
		
	}

}
