package com.devpro.shop14.common;

import com.github.slugify.Slugify;

public class Util {

	public static String createSeoLink(final String text) {
		Slugify slugify = new Slugify();
		return slugify.slugify(text);
	}
	
}
