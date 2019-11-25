
package controller;

import model.controllers.ProveedorJpaController;
import modelo.entities.Proveedor;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import model.controllers.ProveedorJpaController;
import modelo.entities.Proveedor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProveedorController {
    

   
    private EntityManager em;
    private EntityManagerFactory emf;
    private ProveedorJpaController repo;
    
     public ProveedorController() {
        em = getEntityManager();
        repo = new ProveedorJpaController(emf);
    }

    private EntityManager getEntityManager() {
        
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("AventuraSAC_OFICIALPU");
        }
        return emf.createEntityManager();
    }
    
    @RequestMapping("proveedores.htm")
    
    public ModelAndView Listar() {
        
        List<Proveedor> proveedores = new ArrayList<>();
        
        proveedores = repo.findProveedorEntities();

        ModelAndView mv = new ModelAndView();
        
        mv.addObject("proveedores", proveedores);
        
        mv.setViewName("proveedores");
        
        return mv;
    }
    
    @RequestMapping(value = "nuevoproveedor.htm", method = RequestMethod.GET)
    public ModelAndView NuevoProveedor(Model model) {
        ModelAndView mv = new ModelAndView();
        model.addAttribute("proveedor", new Proveedor());
        mv.setViewName("nuevoproveedor");
        return mv;
    }
    
    
    
    @RequestMapping(value = "nuevoproveedor.htm", method = RequestMethod.POST)
    
    public ModelAndView NuevoProveedor(@ModelAttribute("proveedor") Proveedor c) throws Exception{
        
        repo.create(c);
        
        return new ModelAndView("redirect:/proveedores.htm");
    }
    
    @RequestMapping(value = "editarproveedor.htm", method = RequestMethod.GET)
    public ModelAndView EditarProveedor(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        modelo.entities.Proveedor obj = repo.findProveedor(id);

        ModelAndView mv = new ModelAndView();
        mv.addObject("proveedor", obj);
        mv.setViewName("editarproveedor");
        return mv;
        
    }
    
    @RequestMapping(value = "editarproveedor.htm", method = RequestMethod.POST)
    public ModelAndView EditarProveedor(@ModelAttribute("proveedor") modelo.entities.Proveedor c) throws Exception {
        repo.edit(c);

        return new ModelAndView("redirect:/proveedores.htm");
    }
}

