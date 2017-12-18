package se.facilia.ecosys.resources;

import java.util.ListResourceBundle;

public class DefaultsBundle extends ListResourceBundle {
	private final Object[][] contents = { { "config", "se/facilia/ecosys/resources/player-config.xml" },
			// Updates
			{ "update.home",
					"http://project.facilia.se/ecosys/updates" + System.getProperty("application.version.major-minor")
							+ "/" + System.getProperty("application.build-type") + "/" },
			{ "update.updated", Boolean.FALSE }, //$NON-NLS-1$
			{ "update.changelog", "se/facilia/ecosys/resources/changelog.html" }, //$NON-NLS-1$ //$NON-NLS-2$

	};

	public DefaultsBundle() {
		setParent(new se.facilia.player.resources.DefaultsBundle());
	};

	@Override
	public Object[][] getContents() {
		return contents;
	}

	public static void main(String[] args) {
		DefaultsBundle bundle = new DefaultsBundle();

		for (String keys : bundle.keySet()) {
			System.out.println(keys + " " + bundle.getObject(keys)); //$NON-NLS-1$
		}
	}
}
