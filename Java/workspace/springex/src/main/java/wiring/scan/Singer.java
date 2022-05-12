package wiring.scan;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

// @Component	// 소문자 singer로 객체 생성됨
public class Singer implements Performer {
	
	@Resource(name="stone")
	private Song song;

	
	@Resource(name="guitar")
	private Instrument instrument;
	
	@Override
	public void perform() throws PerformanceException {
		song.singing();
		instrument.playing();
	}
}
