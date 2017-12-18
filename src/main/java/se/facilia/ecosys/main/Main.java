package se.facilia.ecosys.main;

public class Main extends se.facilia.player.main.Main {
	public static void main(String[] args) {
		new Main().start(args);
	}

	@Override
	protected void installDefaults() {
		EcosysDefaults.install();
	}
}

