package controller;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import model.controllers.ClienteJpaController;
import model.controllers.CotizacionDetalleJpaController;
import model.controllers.CotizacionJpaController;
import model.controllers.PedidoJpaController;
import model.controllers.PedidoDetalleJpaController;
import model.entities.Cliente;
import model.entities.Cotizacion;
import model.entities.CotizacionDetalle;
import model.entities.Empleado;
import model.entities.Pedido;
import model.entities.PedidoDetalle;
import model.entities.PedidoDetalle_;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
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
        repo2 = new PedidoJpaController(emf);
        repo3 = new CotizacionJpaController(emf);
        repo4 = new CotizacionDetalleJpaController(emf);
        repo5 = new PedidoDetalleJpaController(emf);
        
    }

    private EntityManager getEntityManager() {

        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("AventuraSAC_OFICIALPU");
        }
        return emf.createEntityManager();
    }

    @RequestMapping(value = "Cotizacion.htm", method = RequestMethod.GET)

    public ModelAndView NuevoCotizacion(Model model, HttpServletRequest request) {

        ModelAndView mv = new ModelAndView();
        
        List<PedidoDetalle> pd = repo5.findPedidoDetalleEntities();
        
        List<PedidoDetalle> pdtem = new ArrayList();
        
        Pedido p = (Pedido) request.getSession().getAttribute("pedido");
              
        for (PedidoDetalle d : pd){
            
            if(d.getIdPedido().getIdPedido() == p.getIdPedido()){
               List<CotizacionDetalle> detalle = repo4.listadoxpedido(d.getIdDetallePedido());
               
               if(detalle.size() == 0){
                   pdtem.add(d);
               }
            }
        }

        mv.addObject("detalle", pdtem);
        
        mv.addObject("cotizacion", new Cotizacion());

        mv.setViewName("Cotizacion");

        return mv;
    }

    @RequestMapping(value = "Cotizacion.htm", method = RequestMethod.POST)

    public ModelAndView NuevoCliente(@ModelAttribute("cotizacion") Cliente c) throws Exception {

        repo.create(c);

        return new ModelAndView("redirect:/menu.htm");
    }

}
