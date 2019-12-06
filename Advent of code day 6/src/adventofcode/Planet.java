package adventofcode;

public class Planet {
	
	public Planet parent = null;
	public String name = "";
	
	public Planet(Planet planet, String name) {
		this.parent = planet;
	}
	
	public Planet(String name) {
		this.name = name;
	}
}
