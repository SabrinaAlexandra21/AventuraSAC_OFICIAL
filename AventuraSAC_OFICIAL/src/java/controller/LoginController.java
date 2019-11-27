
package controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.controllers.ClienteJpaController;
import model.controllers.EmpleadoJpaController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
    
    private EntityManager em;
    private EntityManagerFactory emf;
    private ClienteJpaController repo;
    private EmpleadoJpaController repo1;
    
    public LoginController() {
        em = getEntityManager();
        repo = new ClienteJpaController(emf);
        repo1 = new EmpleadoJpaController(emf);
    }

    private EntityManager getEntityManager() {
        
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("AventuraSAC_OFICIALPU");
        }
        return emf.createEntityManager();
    }
    
    @RequestMapping("error")
    
    public ModelAndView getError(){
        ModelAndView  mv = new ModelAndView();
        mv.setViewName("error");
        return mv;
    }
    
    @RequestMapping("menu")
    
    public ModelAndView getMain(){
        ModelAndView  mv = new ModelAndView();
        mv.setViewName("menu");
        return mv;
    }
    
    @RequestMapping("validar")
    
    public ModelAndView getValidaLogin( HttpServletRequest request, HttpServletResponse response){
        ModelAndView  mv = new ModelAndView();
        String usuario = request.getParameter("txtusuario");
        String clave = request.getParameter("txtclave");
        
        if(usuario.equals("Michelli") && clave.equals("123456")){
            mv.setViewName("menu");
        }
        mv.setViewName("error");
        return mv;
    }
}
