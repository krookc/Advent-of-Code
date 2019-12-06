package adventofcode;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Main {

	public List<Planet> planets = new ArrayList<Planet>();
	public int indirectroutes = 0;


	public static void main(String args[]) throws IOException{
		Main main = new Main();
	}

	public Main () throws IOException {
		File file = new File("C:\\Users\\chris\\Documents\\FROG-XFROG\\Advent-of-Code\\Advent of code day 6\\src\\adventofcode\\day6input.txt");

		BufferedReader br = new BufferedReader(new FileReader(file));

		String line;
		while ((line = br.readLine()) != null) {
			String[] p = line.split(" ");
			String p1 = p[0];
			String p2 = p[1];
			Planet orbitee = null;
			Planet orbiter = null;
			if (planets.size() != 0) {
				for (Planet pla : planets) {
					if(pla.name.equals(p1)){
						orbitee = pla;
					}else if(pla.name.equals(p2)){
						orbiter = pla;
					}
				}
				if (orbitee == null) {
					orbitee = new Planet(p1);
					planets.add(orbitee);
				}
				if (orbiter == null) {
					orbiter = new Planet(p2);
					planets.add(orbiter);
				}
			}else {
				orbitee = new Planet(p1);
				orbiter = new Planet(p2);
				planets.add(orbitee);
				planets.add(orbiter);
			}

			if(orbitee.hasChild(orbiter) != true) {
				orbitee.addChild(orbiter);
			}
		}

		int index = 0;

		for (Planet p : planets) {
			if (p.parent == null){
				indirectroutes = this.getIndirect(p);
			}
		}

		System.out.println(this.getDirect()+this.indirectroutes);
	}

	public int getDirect() {
		return planets.size()-1;
	}

	public int getIndirect(Planet p) {
		int index = 0;

		int currentIt = 0;

		for (Planet current : planets) {
			Planet temp = current;
			while (temp.getParent() != null) {
				if (currentIt == 0) {
					temp = temp.getParent();
					currentIt = 1;
				}else {
					index+=1;
					temp = temp.getParent();
				}
			}
			currentIt = 0;
		}
		return index;
	}
}
