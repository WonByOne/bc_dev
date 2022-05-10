package wiring.auto;

public class Singer implements Performer {
	private String name;
	private Song song;
	public Singer() {}
	public Singer(String name, Song song) {
		this.name = name;
		this.song = song;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setSong(Song song) {
		this.song = song;
	}
	
	@Override
	public void perform() throws PerformanceException {
		System.out.println(name+"이 부릅니다");
		song.singing();
	}
}
