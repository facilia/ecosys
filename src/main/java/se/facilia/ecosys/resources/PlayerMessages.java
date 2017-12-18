package se.facilia.ecosys.resources;

import java.util.MissingResourceException;
import java.util.ResourceBundle;

public class PlayerMessages {
	private static final String BUNDLE_NAME = "se.facilia.player.resources.messages"; //$NON-NLS-1$

	private static ResourceBundle RESOURCE_BUNDLE;

	private PlayerMessages() {}

	public static String getString(String key) {
		if( RESOURCE_BUNDLE == null ) {
			RESOURCE_BUNDLE = ResourceBundle.getBundle(BUNDLE_NAME);
		}

		try {
			return RESOURCE_BUNDLE.getString(key);
		} catch (MissingResourceException e) {
			return '!' + key + '!';
		}
	}
}
