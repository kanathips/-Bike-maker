
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



/**
 * Web application lifecycle listener.
 *
 * @author kanathip
 */
public class ContextListener implements ServletContextListener {

    ServletContext context;
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        context = sce.getServletContext();
        
        context.setAttribute("adminEmail", "isad.bike.maker@gmail.com");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
}
