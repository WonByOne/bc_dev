package wiring.bean;

public class PoeticJuggler extends Juggler {
	private Poem poem;
	public PoeticJuggler(int beanBags, Poem poem) {
		super(beanBags);	// beanBag는 부모에서 처리 
		this.poem = poem;
	}
	@Override
	public void perform() throws PerformanceException {
		System.out.println("PoeticJuggler : "+beanBags+"개를 저글링합니다.");
		poem.recite();	// perform 이란 함수로 시낭송 까지 
	}
}
