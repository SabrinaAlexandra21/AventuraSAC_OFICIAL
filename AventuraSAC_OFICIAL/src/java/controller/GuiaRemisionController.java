package controller;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import model.controllers.ClienteJpaController;
import model.controllers.CotizacionJpaController;
import model.controllers.GuiaremisionDetalleJpaController;
import model.controllers.GuiaremisionJpaController;
import model.entities.Guiaremision;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Sabrina Bv
 */
public class GuiaRemisionController  {


    private EntityManager em;
    private EntityManagerFactory emf;
    private CotizacionJpaController repo;
    private GuiaremisionJpaController repo1;
    private GuiaremisionDetalleJpaController repo2;
   /*No olvidar que faltan algunos*/
    
    public GuiaRemisionController() {
        em = getEntityManager();
        repo1 = new GuiaremisionJpaController(emf);
    }

    private EntityManager getEntityManager() {
        
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("AventuraSAC_OFICIALPU");
        }
        return emf.createEntityManager();
    }
    
    @RequestMapping(value = "GuiaRemision.htm", method = RequestMethod.GET)
    
    public ModelAndView NuevaGuiaRemision(Model model) {
        
        ModelAndView mv = new ModelAndView();

        model.addAttribute("guiaremision", new Guiaremision());/*Guiaremision es la clase osea la entidad*/
        
        mv.setViewName("GuiaRemision");
        
        return mv;
    }
    
    @RequestMapping(value = "GuiaRemision.htm", method = RequestMethod.POST)
    
    public ModelAndView NuevaGuiaRemision(@ModelAttribute("guiaremision") Guiaremision g) throws Exception{
        
        repo1.create(g);
        
        return new ModelAndView("redirect:/menu.htm");
    }
    
}
