package wiring.java;

public class Singer implements Performer {
	private Song song;
	private Instrument instrument;
	public void setSong(Song song) {
		this.song = song;
	}
	public void setInstrument(Instrument instrument) {
		this.instrument = instrument;
	}

	@Override
	public void perform() throws PerformanceException {
		song.singing();
		instrument.playing();
	}
}
