
package controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import model.controllers.FichatecnicaJpaController;
import model.controllers.TipotelaJpaController;
import model.entities.Fichatecnica;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class FichaTecnicaController  {
    
        private EntityManager em;
        private EntityManagerFactory emf;
        private FichatecnicaJpaController repo;
        private TipotelaJpaController repo1;
        
        public FichaTecnicaController() {
        em = getEntityManager();
        repo = new FichatecnicaJpaController(emf);
    }

    private EntityManager getEntityManager() {
        
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("AventuraSAC_OFICIALPU");
        }
        return emf.createEntityManager();
    }
    
    @RequestMapping(value = "FichaTecnica.htm", method = RequestMethod.GET)
    
    public ModelAndView NuevaFichaTecnica(Model model) {
        
        ModelAndView mv = new ModelAndView();

        model.addAttribute("fichatecnica", new Fichatecnica());/*Guiaremision es la clase osea la entidad*/
        
        mv.setViewName("FichaTecnica");
        
        return mv;
    }
    
    @RequestMapping(value = "FichaTecnica.htm", method = RequestMethod.POST)
    
    public ModelAndView NuevaFichaTecnica(@ModelAttribute("fichatecnica") Fichatecnica f) throws Exception{
        
        repo.create(f);
        
        return new ModelAndView("redirect:/menu.htm");
    }
    
}


