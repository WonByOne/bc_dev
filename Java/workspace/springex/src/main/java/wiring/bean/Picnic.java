package wiring.bean;

public class Picnic implements Poem {
	@Override
	public void recite() throws PerformanceException {
		String str = "나 하늘로 돌아가리라.\r\n"
				+"새벽빛 와 닿으면 스러지는\r\n"
				+"이슬 더불어 손에 손을 잡고,\r\n"
				+"나 하늘로 돌아가리라\r\n"
				+"노을빛 함께 단 둘이\r\n"
				+"기슭에서 놀다가 구름 손짓하면은,\r\n"
				+"나 하늘로 돌아가리라.\r\n"
				+"아름다운 이 세상 소풍 끝내는 날,\r\n"
				+"가서, 아름다웠더라고 말하리라.";
		System.out.println(str);
	}
	
}
