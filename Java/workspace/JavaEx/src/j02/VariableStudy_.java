package j02;

class Subject {
	String name;
	double score;
	
	public void printSub() {
//		System.out.printf(name + " :\t%4d점%n", score);
		System.out.printf(name + " :\t%.1f점%n", score);
	}

}




public class VariableStudy_ {

	public static void main(String[] args) {
		
		
		
		Subject kor = new Subject();
		kor.name = "국어";
		kor.score = 95;
		
		Subject eng = new Subject();
		eng.name = "영어";
		eng.score = 84;
		
		Subject mat = new Subject();
		mat.name = "수학";
		mat.score = 73;
		
		Subject tot = new Subject();
		tot.name = "총점";
		tot.score = kor.score + eng.score + mat.score;
		
		Subject avg = new Subject();
		avg.name = "평균";
		avg.score = tot.score / 3;
				
		kor.printSub();
		eng.printSub();
		mat.printSub();
		tot.printSub();
		avg.printSub();
		

	}

}
