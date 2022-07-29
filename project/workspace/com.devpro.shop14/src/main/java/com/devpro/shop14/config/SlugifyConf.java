package com.devpro.shop14.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.github.slugify.Slugify;

@Configuration
public class SlugifyConf {
	
	@Bean
	public Slugify slugify() {
		return new Slugify();
	}

}
