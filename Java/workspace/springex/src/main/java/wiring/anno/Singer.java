package wiring.anno;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;

public class Singer implements Performer {
	
	@Value("#{'하현우'}")
	private String name;
	
//	@Autowired(required=false)
//	@Qualifier("rock")
	@Resource(name="stone")	// autowired, qualified 대신 사용
							// 그러나 class에서 선언한 qualifier는 불러오지 못함
	private Song song;
	public Singer() {}
	public Singer(String name, Song song) {
		this.name = name;
		this.song = song;
	}
//	public void setName(String name) {
//		this.name = name;
//	}
	
//	public void setSong(Song song) {
//		this.song = song;
//	}
	
	@Override
	public void perform() throws PerformanceException {
		char lastChar = name.charAt(name.length()-1);
		String postPosition = (lastChar - 0xAC00) % 28 > 0 ? "이" : "가";
		
		System.out.println(name+postPosition+" 부릅니다");
		song.singing();
	}
}
