
package controller;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import model.controllers.EstadoJpaController;
import model.controllers.FichatecnicaJpaController;
import model.controllers.TallaJpaController;
import model.controllers.TipomodeloJpaController;
import model.controllers.TipotelaJpaController;
import model.controllers.exceptions.NonexistentEntityException;
import model.entities.Cliente;
import model.entities.Estado;
import model.entities.Fichatecnica;
import model.entities.Talla;
import model.entities.Tipomodelo;
import model.entities.Tipotela;
import org.springframework.http.HttpRequest;
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
        private TipomodeloJpaController repo2;
        private TallaJpaController repo3;
        private EstadoJpaController repo4;
        
        public FichaTecnicaController() {
        em = getEntityManager();
        repo = new FichatecnicaJpaController(emf);
        repo1 = new TipotelaJpaController(emf);
        repo2 = new TipomodeloJpaController(emf);
        repo3 = new TallaJpaController(emf);
        repo4 = new EstadoJpaController(emf);
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
        
        List<Tipomodelo> prendas = repo2.findTipomodeloEntities();
        
        mv.addObject("listamodelo", prendas);
        
        List<Talla> tallas = repo3.findTallaEntities();
        
        mv.addObject("listatallas", tallas);
        
        List<Estado> estado = repo4.findEstadoEntities();
        
        mv.addObject("estado", estado);

        model.addAttribute("fichatecnica", new Fichatecnica());
        
        mv.setViewName("Ficha");
        
        return mv;
    }
    
    
    @RequestMapping(value = "FichaTecnica.htm", method = RequestMethod.POST)
    
    public ModelAndView NuevaFichaTecnica(@ModelAttribute("fichatecnica") Fichatecnica f, HttpServletRequest request) throws Exception{
        
        Cliente c = (Cliente)request.getSession().getAttribute("usuario");
        
        f.setIdCliente(c);
        
        repo.create(f);
        
        return new ModelAndView("redirect:/pedidos.htm");
    }
    
    @RequestMapping(value = "editarficha.htm", method = RequestMethod.GET)
    
    public ModelAndView EditarFichatecnica(HttpServletRequest request) {
        
        Cliente c = (Cliente)request.getSession().getAttribute("usuario");
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Fichatecnica obj = repo.findFichatecnica(id);
        
        ModelAndView mv = new ModelAndView();
        
        List<Tipotela> telas = repo1.findTipotelaEntities();
        
        mv.addObject("tipotelas", telas);
        
        List<Tipomodelo> prendas = repo2.findTipomodeloEntities();
        
        mv.addObject("listamodelo", prendas);
        
        List<Talla> tallas = repo3.findTallaEntities();
        
        mv.addObject("listatallas", tallas);
        
        mv.addObject("fichatecnica", obj);
       
        mv.setViewName("editarficha");
        
        return mv;
        
    }
    
    @RequestMapping(value = "editarficha.htm", method = RequestMethod.POST)
    
    public ModelAndView EditarFichatecnica(@ModelAttribute("fichatecnica") Fichatecnica f, HttpServletRequest request) throws Exception {
        
        Cliente c = (Cliente)request.getSession().getAttribute("usuario");
        
        f.setIdCliente(c);
        
        repo.edit(f);

        return new ModelAndView("redirect:/pedidos.htm");
    }
    
     @RequestMapping(value = "eliminarficha.htm")
     
    public ModelAndView EliminarFichatecnica(HttpServletRequest request) throws NonexistentEntityException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        repo.destroy(id);

        return new ModelAndView("redirect:/pedidos.htm");
    }
    
}


