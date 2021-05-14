package org.ims;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


public class AppListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent sce) {
        sce.getServletContext().setAttribute("ctx",sce.getServletContext().getContextPath());
    }
}
