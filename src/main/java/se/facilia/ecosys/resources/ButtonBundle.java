package se.facilia.ecosys.resources;

import java.util.ListResourceBundle;

public class ButtonBundle extends ListResourceBundle {
	private final Object[][] contents;

	public ButtonBundle() {
		setParent(new se.facilia.player.resources.ButtonBundle());

		contents = new Object[][] {};
	}

	@Override
	public Object[][] getContents() {
		return contents;
	}

	public static void main(String[] args) {
		ButtonBundle bundle = new ButtonBundle();

		for (int i = 0; i < bundle.contents.length; i++) {
			System.out.println(bundle.contents[i][0] + ":" + bundle.contents[i][1]); //$NON-NLS-1$

		}

		System.out.println(bundle.getString("CutAction.name")); //$NON-NLS-1$
	}
}
