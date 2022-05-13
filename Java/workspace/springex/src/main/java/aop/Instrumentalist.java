package aop;

public class Instrumentalist implements Performer {
	
	private String song;
	private Instrument instrument;	
	public void setSong(String song) { 	// xml에 property가 없으면 필요 없음
		this.song = song;
	}
	public void setInstrument(Instrument instrument) {
		this.instrument = instrument;
	}
		
	@Override
	public void perform() throws PerformanceException {
		char lastChar = song.charAt(song.length()-1);
		String postPosition = (lastChar - 0xAC00) % 28 > 0 ? "을" : "를";

		System.out.println(song+postPosition+" 연주합니다.");
		instrument.playing();
	}
}
