package wiring.anno;

import org.springframework.beans.factory.annotation.Qualifier;

@Qualifier("rock")
public class Stone implements Song {
	@Override
	public void singing() throws PerformanceException {
		String str = "Hit me harder Make me strong\n"
				+ "그저 정해진 대로 따르라고\n"
				+ "그게 현명하게 사는 거라고\n"
				+ "쥐 죽은 듯이 살라는 말\n"
				+ "같잖은 말 누굴 위한 삶인가\n"
				+ "뜨겁게 지져봐\n"
				+ "절대 꼼짝 않고 나는 버텨낼 테니까\n"
				+ "거세게 때려봐\n"
				+ "네 손만 다칠 테니까\n"
				+ "나를 봐\n"
				+ "끄떡없어\n"
				+ "쓰러지고 떨어져도\n"
				+ "다시 일어나 오를 뿐야\n"
				+ "난 말야\n"
				+ "똑똑히 봐\n"
				+ "깎일수록 깨질수록\n"
				+ "더욱 세지고 강해지는 돌덩이\n"
				+ "감당할 수 없게 벅찬 이 세상\n"
				+ "유독 내게만 더 모진 이 세상\n"
				+ "모두가 나를 돌아섰고\n"
				+ "비웃었고 아픔이 곧 나였지\n"
				+ "시들고 저무는\n"
				+ "그런 세상 이치에 날 가두려 하지 마\n"
				+ "틀려도 괜찮아\n"
				+ "이 삶은 내가 사니까\n"
				+ "나를 봐\n"
				+ "끄떡없어\n"
				+ "쓰러지고 떨어져도\n"
				+ "다시 일어나 오를 뿐야\n"
				+ "난 말야\n"
				+ "똑똑히 봐\n"
				+ "깎일수록 깨질수록\n"
				+ "더욱 세지고 강해지는 돌덩이\n"
				+ "누가 뭐라 해도 나의 길\n"
				+ "오직 하나뿐인 나의 길\n"
				+ "내 전부를 내걸고서 Hey\n"
				+ "걸어가\n"
				+ "계속해서\n"
				+ "부딪히고 넘어져도\n"
				+ "다시 일어나 걷는 거야\n"
				+ "언젠가\n"
				+ "이 길 끝에 서서\n"
				+ "나도 한 번 크게 한 번\n"
				+ "목이 터져라 울 수 있을 때까지";
		System.out.println("돌덩이 : "+str);
	}
}
