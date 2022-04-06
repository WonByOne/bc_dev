package j02;

public class VariableStudy {

	public static void main(String[] args) {

		int kor = 95;
		int eng = 84;
		int mat = 72;

		int sum = kor + eng + mat;
		double avg = sum / 3.0;

		System.out.printf("국어 :\t%4d점%n", kor);
		System.out.printf("영어 :\t%4d점%n", eng);
		System.out.printf("수학 :\t%4d점%n", mat);
		System.out.printf("총점 :\t%4d점%n", sum);
		System.out.printf("평균 :\t%.1f점", avg);

	}

}
