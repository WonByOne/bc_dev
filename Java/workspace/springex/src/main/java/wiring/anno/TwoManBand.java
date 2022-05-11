package wiring.anno;

import java.util.Iterator;
import java.util.Map;

public class TwoManBand implements Performer {
	private String song;
	private Map<String, Instrument> instruments;
	public void setSong(String song) {
		this.song = song;
	}
	public void setInstruments(Map<String, Instrument> instruments) {
		this.instruments = instruments;
	}
	@Override
	public void perform() throws PerformanceException {
		System.out.println(song+"을 연주합니다");
		Iterator<String> iter = instruments.keySet().iterator(); // 키를 뽑기
		while(iter.hasNext()) {
			String key = iter.next();	// 키 값 가져오
			Instrument instrument = instruments.get(key);
			instrument.playing();
		}
	}
}
