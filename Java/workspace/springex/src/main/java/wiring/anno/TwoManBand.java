package wiring.anno;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;

public class TwoManBand implements Performer {
//	private String song;
	
//	@Value("#{singer.name}, 이순신") // getName getter가 있으면 이렇게도 가능
	@Value("하현우, Carpenters")
	private String[] names;
	@Resource(name="songs")	// 객체를 넣기 위해서는 @Resource 사용 필요
	private List<Song> songs;
	@Resource(name="instruments")
	private Map<String, Instrument> instruments;
//	public void setSong(String song) {
//		this.song = song;
//	}
//	public void setInstruments(Map<String, Instrument> instruments) {
//		this.instruments = instruments;
//	}
	@Override
	public void perform() throws PerformanceException {
//		System.out.println(song+"을 연주합니다");
		
		for(String name : names) {
			System.out.println("가수 : "+name);
		}
		for(Song song : songs) {
			song.singing();
		}
		
		Iterator<String> iter = instruments.keySet().iterator(); // 키를 뽑기
		while(iter.hasNext()) {
			String key = iter.next();	// 키 값 가져오기
			Instrument instrument = instruments.get(key);
			instrument.playing();
		}
	}
}
