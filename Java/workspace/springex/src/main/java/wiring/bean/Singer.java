package wiring.bean;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class Singer implements Performer {
	private String name;
	private List<Song> songs;
	private Map<String, Instrument> instruments;
	
//	private Song song;
//	public Singer() {}	// 디폴트 생성자
//	public Singer(String name, Song song) {
//		this.name = name;
//		this.song = song;
//	}
	public void setName(String name) {
		this.name = name;
	}
	public void setSongs(List<Song> songs) {
		this.songs = songs;
	}
	public void setInstruments(Map<String, Instrument> instruments) {
		this.instruments = instruments;
	}

	//	public void setSong(Song song) {
//		this.song = song;
//	}
	
	@Override
	public void perform() throws PerformanceException {
		System.out.println("이름 : "+name);
//		song.singing();
		for(Song song : songs) {
			song.singing();
		}
		Iterator<String> iter = instruments.keySet().iterator();
		while(iter.hasNext()) {
			String key = iter.next();
			Instrument instrument = instruments.get(key);
			System.out.println(key);
			instrument.playing();
		}
	}
}
