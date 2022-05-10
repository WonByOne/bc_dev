package wiring.bean;

public class Flower implements Poem {
	@Override
	public void recite() throws PerformanceException {
		String str = "내가 그의 이름을 불러 주기 전에는\n"
				+ "그는 다만\n"
				+ "하나의 몸짓에 지나지 않았다.\n"
				+ "내가 그의 이름을 불러 주었을 때\n"
				+ "그는 나에게로 와서\n"
				+ "꽃이 되었다.\n"
				+ "내가 그의 이름을 불러 준 것처럼\n"
				+ "나의 이 빛깔과 향기에 알맞은\n"
				+ "누가 나의 이름을 불러 다오.\n"
				+ "그에게로 가서 나도\n"
				+ "그의 꽃이 되고 싶다.\n"
				+ "우리들은 모두\n"
				+ "무엇이 되고 싶다.\n"
				+ "너는 나에게 나는 너에게\n"
				+ "잊혀지지 않는 하나의 향기가 되고 싶다.";
		System.out.println(str);
	}
}
