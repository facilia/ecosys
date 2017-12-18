package se.facilia.ecosys.main;

import java.io.File;

import javax.swing.UIManager;

import se.facilia.facilialib.resources.Resources;
import se.facilia.player.main.PlayerDefaults;

public class EcosysDefaults extends PlayerDefaults {
	public static void install() {
		install(new EcosysDefaults());
	}

	@Override
	public void setApplicationInfo() {
		// If not overridden, see ApplicationInfo.readCommandLineArguments(),
		// sets the
		// application directory where the lib directory and (by default) the
		// user directory
		// are located.
		if (!Resources.isApplicationDirSet()) {
			File appDir = Resources.getApplicationDir("Ecosys 1.0");
			Resources.setApplicationDir(appDir);
		}
		Resources.setApplicationPrefix("ecosys_prefs");
		Resources.setPackagePrefix("se.facilia.ecosys");
		Resources.setDefaultBundlePath("se.facilia.ecosys.resources.DefaultsBundle");
		Resources.setApplicationName("Ecosys 1.0");
		Resources.setAvailableLocales("en"); //$NON-NLS-1$
	}

	@Override
	protected void setUIDefaults() {
		UIManager.put("TabbedPane.contentOpaque", false);

		super.setUIDefaults();
	}
}
