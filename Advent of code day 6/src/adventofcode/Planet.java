package adventofcode;

import java.util.ArrayList;
import java.util.List;

public class Planet {
	
	public Planet parent = null;
	public List<Planet> children = new ArrayList<Planet>();
	public String name = "";
	
	public Planet(Planet planet, String name) {
		this.parent = planet;
	}
	
	public Planet(String name) {
		this.name = name;
	}
	
	public boolean hasChild(Planet pla) {
		for (Planet c : children) {
			if (c.name.equals(pla.name)) {
				return true;
			}
		}
		return false;
	}
	
	public void addChild(Planet a) {
		children.add(a);
		a.parent = this;
	}
	
	public Planet getParent() {
		return this.parent;
	}
}
