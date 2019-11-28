package controller;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import model.controllers.ClienteJpaController;
import model.controllers.CotizacionJpaController;
import model.controllers.PedidoJpaController;
import model.controllers.CotizacionDetalleJpaController;
import model.controllers.PedidoDetalleJpaController;
import model.entities.Cliente;
import model.entities.Cotizacion;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


/**
 *
 * @author Sabrina Bv
 */
public class CotizacionController {


    private EntityManager em;
    private EntityManagerFactory emf;
    private ClienteJpaController repo;
    private PedidoJpaController repo2;
    private CotizacionJpaController repo3;
    private CotizacionDetalleJpaController repo4;
    private PedidoDetalleJpaController repo5;
    
    public CotizacionController() {
        em = getEntityManager();
        repo = new ClienteJpaController(emf);
    }

    private EntityManager getEntityManager() {
        
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("AventuraSAC_OFICIALPU");
        }
        return emf.createEntityManager();
    }
    
    @RequestMapping(value = "Cotizacion.htm", method = RequestMethod.GET)
    
    public ModelAndView NuevoCotizacion(Model model) {
        
        ModelAndView mv = new ModelAndView();

        model.addAttribute("cotizacion", new Cotizacion());
        
        mv.setViewName("Cotizacion");
        
        return mv;
    }
    
    @RequestMapping(value = "Cotizacion.htm", method = RequestMethod.POST)
    
    public ModelAndView NuevoCliente(@ModelAttribute("cotizacion") Cliente c) throws Exception{
        
        repo.create(c);
        
        return new ModelAndView("redirect:/menu.htm");
    }
    
}