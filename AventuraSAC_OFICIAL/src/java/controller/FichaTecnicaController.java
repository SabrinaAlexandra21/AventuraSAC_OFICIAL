
package controller;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import model.controllers.FichatecnicaJpaController;
import model.controllers.TallaJpaController;
import model.controllers.TipoprendaJpaController;
import model.controllers.TipotelaJpaController;
import model.entities.Fichatecnica;
import model.entities.Talla;
import model.entities.Tipoprenda;
import model.entities.Tipotela;
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
        private TipoprendaJpaController repo2;
        private TallaJpaController repo3;
        
        public FichaTecnicaController() {
        em = getEntityManager();
        repo = new FichatecnicaJpaController(emf);
        repo1 = new TipotelaJpaController(emf);
        repo2 = new TipoprendaJpaController(emf);
        repo3 = new TallaJpaController(emf);
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
        
        List<Tipotela> telas = repo1.findTipotelaEntities();
        
        mv.addObject("tipotelas", telas);
        
        List<Tipoprenda> prendas = repo2.findTipoprendaEntities();
        
        mv.addObject("listaprendas", prendas);
        
        List<Talla> tallas = repo3.findTallaEntities();
        
        mv.addObject("listatallas", tallas);

        model.addAttribute("fichatecnica", new Fichatecnica());/*Guiaremision es la clase osea la entidad*/
        
        mv.setViewName("Ficha");
        
        return mv;
    }
    
    @RequestMapping(value = "FichaTecnica.htm", method = RequestMethod.POST)
    
    public ModelAndView NuevaFichaTecnica(@ModelAttribute("fichatecnica") Fichatecnica f) throws Exception{
        
        repo.create(f);
        
        return new ModelAndView("redirect:/menu.htm");
    }
    
}


