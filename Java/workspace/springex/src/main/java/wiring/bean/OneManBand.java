package wiring.bean;

import java.util.List;

public class OneManBand implements Performer {
	private String song;
	private List<Instrument> instruments;
	public void setSong(String song) {
		this.song = song;
	}
	public void setInstruments(List<Instrument> instruments) {	// 객체 리스트
		this.instruments = instruments;
	}
	@Override
	public void perform() throws PerformanceException {
		System.out.println(song+"을 연주합니다");
		for(Instrument instrument : instruments) {
			instrument.playing();
		}
	}
}
