
package controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import static javax.swing.text.StyleConstants.ModelAttribute;
import model.controllers.GuiaremisionDetalleJpaController;
import model.entities.GuiaremisionDetalle;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

public class GuiaRemisionDetalleController {
    private EntityManager em;
    private EntityManagerFactory emf;
    private GuiaremisionDetalleJpaController repo1;
    
  
    
    public GuiaRemisionDetalleController() {
        em = getEntityManager();
        repo1 = new GuiaremisionDetalleJpaController(emf);
        
    }

    private EntityManager getEntityManager() {
        
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("AventuraSAC_OFICIALPU");
        }
        return emf.createEntityManager();
    }
    
    @RequestMapping(value = "GuiaRemision.htm", method = RequestMethod.GET)
    
    public ModelAndView NuevaGuiaRemisionDetalle(Model model) {
        
        ModelAndView mv = new ModelAndView();

        model.addAttribute("guiaremisiondetalle", new GuiaremisionDetalle());
        
        mv.setViewName("GuiaRemision");
        
        return mv;
    }
    
    @RequestMapping(value = "GuiaRemision.htm", method = RequestMethod.POST)
    
    public ModelAndView NuevaGuiaRemisionDetalle(@ModelAttribute("guiaremision") GuiaremisionDetalle g) throws Exception{
        
        repo1.create(g);
        
        return new ModelAndView("redirect:/menu.htm");
    }
    
}
