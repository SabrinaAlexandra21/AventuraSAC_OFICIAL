package controller;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.controllers.ClienteJpaController;
import model.controllers.FichatecnicaJpaController;
import model.controllers.PedidoDetalleJpaController;
import model.controllers.PedidoJpaController;
import model.entities.Cliente;
import model.entities.Fichatecnica;
import model.entities.Pedido;
import model.entities.PedidoDetalle;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MenuClienteController {

    private EntityManager em;
    private EntityManagerFactory emf;
    private PedidoJpaController repo;
    private ClienteJpaController repo1;
    private FichatecnicaJpaController repo2;
    private PedidoDetalleJpaController repo3;

    public MenuClienteController() {
        em = getEntityManager();
        repo = new PedidoJpaController(emf);
        repo1 = new ClienteJpaController(emf);
        repo2 = new FichatecnicaJpaController(emf);
        repo3 = new PedidoDetalleJpaController(emf);
    }

    private EntityManager getEntityManager() {

        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("AventuraSAC_OFICIALPU");
        }

        return emf.createEntityManager();
    }

    @RequestMapping("listapedidos.htm")

    public ModelAndView Login() {

        ModelAndView mv = new ModelAndView();

        mv.setViewName("listapedidos");

        return mv;
    }
    
    @RequestMapping(value = "pedidos.htm", method = RequestMethod.GET)

    public ModelAndView NuevoPedido(Model model) {

        ModelAndView mv = new ModelAndView();

        List<Fichatecnica> ficha = new ArrayList<>();

        ficha = repo2.findFichatecnicaEntities();

        mv.addObject("ficha", ficha);

        model.addAttribute("pedido", new Pedido());

        mv.setViewName("pedidos");

        return mv;
    }

    @RequestMapping(value = "pedidos.htm", method = RequestMethod.POST)

    public ModelAndView NuevoPedido(@ModelAttribute("pedido") Pedido p, HttpServletRequest request) throws Exception {

        Cliente c = (Cliente) request.getSession().getAttribute("usuario");

        List<Fichatecnica> ficha = repo2.findFichatecnicaEntities();

        for (Fichatecnica x : ficha) {

            if(c.getIdCliente() == x.getIdCliente().getIdCliente()) {

                PedidoDetalle detalleP = new PedidoDetalle();

                detalleP.setIdPedido(p);
                detalleP.setIdFicha(x);
                
                p.getPedidoDetalleList().add(detalleP);
            }
        }
        
        
        repo.create(p);

        return new ModelAndView("redirect:/listapedidos.htm");
    }

}
