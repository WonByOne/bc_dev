package j10;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class CalendarEx {

	public static void main(String[] args) {
		// 클래스 안에 인스터스를 만들어주는 메소드가 있는 경우 - 보통은 만들어 쓰거나 상속 받아 쓰거나 아니면 static 함수를 씀 
		Calendar now = Calendar.getInstance();
		// 클래스 사용법
		// 1. 객체 생성
		// 2. 상속
		// 3. 멤버 모두가 static
		// 4. 대신 객체를 생성해주는 method 사용
		// 5. 자식 클래스로 객체를 생성
		// 6. Class.forName() 이용
		
		// Interface 사용
		// 1. implements 빠짐없이 구현 - 실제로는 어려움
		// 2. 대신 구현한 클래스 사용
		// 3. 익명내부클래스로 객체 사용
		// 4. 자식클래스로 객체 생성
		// 5. 대신 객체를 생성해주는 메소드 사용
		
		int year = now.get(now.YEAR);		// 인스턴스의 YEAR에 접근 * now의 시간은 흐르지 않는다고 함(확인필요)
		int month = now.get(Calendar.MONTH) + 1;
		int day = now.get(Calendar.DAY_OF_MONTH);
		int weekday = now.get(Calendar.DAY_OF_WEEK);	// 1~7까지 멤버 변수
		
		System.out.print(year+"년 "+month+"월 "+day+"일 ");
		switch(weekday) {
		case 1 : System.out.println("Sunday"); break;
		case 2 : System.out.println("Monday"); break;
		case 3 : System.out.println("Tuesday"); break;
		case 4 : System.out.println("Wendsday"); break;
		case 5 : System.out.println("Thursday"); break;
		case 6 : System.out.println("Friday"); break;
		case 7 : System.out.println("Saturday"); break;
		
		}
		Calendar cal = new GregorianCalendar(); // 자식 클래스로 객체 생성
		int hour = cal.get(cal.HOUR_OF_DAY);
		int minute = cal.get(cal.MINUTE);
		int second = cal.get(cal.SECOND);
		int milsec = cal.get(cal.MILLISECOND);
		
		System.out.println(hour+":"+String.format("%2d", minute)+":"+second+":"+milsec);
	}

}
