package j02;


// 국어 영어 수학
// 평균 70점 이상 합격 미만 불합격
// 잘못입력 처리
// 삼항연산

public class OperatorSturdy {

	public static void main(String[] args) {
		int kor = Integer.parseInt(args[0]);
		int eng = Integer.parseInt(args[1]);
		int mat = Integer.parseInt(args[2]);
	
		
		double avg = (kor + eng + mat) / 3.0;  // 평균
		
		System.out.println("평균 : " + avg);
	    // 세과목 중 하나라도 입력이 잘못되었나?
		boolean c = ((kor > 100 || kor < 0 || eng > 100 || eng < 0 || mat > 100 || mat < 0));
	    	    
		
	    String s = (c) ? "Error" : (avg >= 70) ?  "합격" : "불합격";  // 삼항연산   
		
		if (c) s = "Error";
		else if (avg >= 70) s = "합격";
		else s = "불합격";
		
		System.out.println(s);
		
		
	}

}
