package com.dz.media.common;

import com.dz.media.controller.indexController;

public class Routes extends com.jfinal.config.Routes {

	@Override
	public void config() {
		add("/",indexController.class,"/WEB-INF/view");
	}

}
