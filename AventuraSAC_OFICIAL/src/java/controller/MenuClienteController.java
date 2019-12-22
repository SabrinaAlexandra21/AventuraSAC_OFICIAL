
package controller;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.controllers.ClienteJpaController;
import model.controllers.PedidoJpaController;
import model.entities.Cliente;
import model.entities.Pedido;
import org.springframework.stereotype.Controller;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.request;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MenuClienteController  {
    
    private EntityManager em;
    private EntityManagerFactory emf;
    private PedidoJpaController repo;
    private ClienteJpaController repo1;
    
    public MenuClienteController() {
        em = getEntityManager();
        repo = new PedidoJpaController(emf);
        repo1 = new ClienteJpaController(emf);
    }
    
    private EntityManager getEntityManager() {
        
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("AventuraSAC_OFICIALPU");
        }
        
        return emf.createEntityManager();
    }
    
    @RequestMapping(value = "pedidos.htm", method = RequestMethod.GET)
    
    public ModelAndView NuevoPedido(HttpServletRequest request, HttpServletResponse response) {
        
        LoginController log = new LoginController();
        
        ModelAndView mv = new ModelAndView();
        
        List<Cliente> c = repo1.findClienteEntities();
        
        log.getValidaLogin(request, response).addObject("usuario", log);
        
        mv.addObject("pedido", new Pedido());
        
        mv.setViewName("pedidos");
        
        return mv;
    }
    
    
  
}
