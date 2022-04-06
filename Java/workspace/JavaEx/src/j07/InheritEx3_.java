package j07;

// 같은 예제를 추상 클래스로
abstract class Cars {
	String name;
	String fuel;
	public Cars(String name, String fuel) {
		this.name = name;
		this.fuel = fuel;
	}
	public abstract String getName();
	public abstract String getFuel();
}

class Trucks extends Cars {
	private int cargo;
	public Trucks(String name, String fuel, int cargo) {
		super(name, fuel);
		this.cargo = cargo;
	}
	public String getName() {
		return name;
	}
	
	public String getFuel() {
		return fuel;
	}
	
	public int getCargo() {
		return cargo;
	}
}

class Buses extends Cars {
	private int number;
	public Buses(String name, String fuel, int number) {
		super(name, fuel);
		this.number = number;
	}
	public String getName() {
		return name;
	}
	
	public String getFuel() {
		return fuel;
	}
	
	public int getNumber() {
		return number;
	}	
}

class Bikes extends Cars {
	public Bikes(String name, String fuel) {
		super(name, fuel);
	}
	public String getName() {
		return name;
	}
	
	public String getFuel() {
		return fuel;
	}
	
}
public class InheritEx3_ {
	
	public static void main(String[] args) {
		// Car 클래스 상속받는 Truck, Bus, Bike 클래스
		
		Trucks truck = new Trucks("포터", "경유", 1);
		System.out.println("차종 : "+truck.getName());
		System.out.println("연료 : "+truck.getFuel());
		System.out.println("적재 : "+truck.getCargo()+"톤");
		System.out.println();
		
		Buses bus = new Buses("현대", "가스", 407);
		System.out.println("차종 : "+bus.getName());
		System.out.println("연료 : "+bus.getFuel());
		System.out.println("노선 : "+bus.getNumber());
		System.out.println();
		
		Bikes bike = new Bikes("대림", "휘발유");
		System.out.println("차종 : "+bike.getName());
		System.out.println("연료 : "+bike.getFuel());
			                               
		}
	}