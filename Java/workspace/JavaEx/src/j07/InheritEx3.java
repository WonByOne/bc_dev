package j07;

class Car {
	String name;
	String fuel;
	public Car(String name, String fuel) {
		this.name = name;
		this.fuel = fuel;
	}
	public String getName() {
		return name;
	}
	
	public String getFuel() {
		return fuel;
	}
}

class Truck extends Car {
	private int cargo;
	public Truck(String name, String fuel, int cargo) {
		super(name, fuel);
		this.cargo = cargo;
	}
	
	public int getCargo() {
		return cargo;
	}
}

class Bus extends Car {
	private int number;
	public Bus(String name, String fuel, int number) {
		super(name, fuel);
		this.number = number;
	}
	
	public int getNumber() {
		return number;
	}	
}

class Bike extends Car {
	public Bike(String name, String fuel) {
		super(name, fuel);
	}
}

public class InheritEx3 {

	public static void main(String[] args) {
		// Car 클래스 상속받는 Truck, Bus, Bike 클래스
		
		Truck truck = new Truck("포터", "경유", 1);
		System.out.println("차종 : "+truck.getName());
		System.out.println("연료 : "+truck.getFuel());
		System.out.println("적재 : "+truck.getCargo()+"톤");
		System.out.println();
		
		Bus bus = new Bus("현대", "가스", 407);
		System.out.println("차종 : "+bus.getName());
		System.out.println("연료 : "+bus.getFuel());
		System.out.println("노선 : "+bus.getNumber());
		System.out.println();
		
		Bike bike = new Bike("대림", "휘발유");
		System.out.println("차종 : "+bike.getName());
		System.out.println("연료 : "+bike.getFuel());
		                               
	}
}
