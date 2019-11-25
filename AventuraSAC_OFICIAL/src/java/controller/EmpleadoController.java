
package controller;

import model.controllers.EmpleadoJpaController;
import modelo.entities.Empleado;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import model.controllers.EmpleadoJpaController;
import modelo.entities.Empleado;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmpleadoController {
   
    private EntityManager em;
    private EntityManagerFactory emf;
    private EmpleadoJpaController repo;
    
     public EmpleadoController() {
        em = getEntityManager();
        repo = new EmpleadoJpaController(emf);
    }

    private EntityManager getEntityManager() {
        
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("AventuraSAC_OFICIALPU");
        }
        return emf.createEntityManager();
    }
    
    @RequestMapping("empleados.htm")
    
    public ModelAndView Listar() {
        
        List<Empleado> empleados = new ArrayList<>();
        
        empleados = repo.findEmpleadoEntities();

        ModelAndView mv = new ModelAndView();
        
        mv.addObject("empleados", empleados);
        
        mv.setViewName("empleados");
        
        return mv;
    }
    
    @RequestMapping(value = "nuevoempleado.htm", method = RequestMethod.GET)
    public ModelAndView NuevoEmpleado(Model model) {
        ModelAndView mv = new ModelAndView();
        model.addAttribute("empleado", new Empleado());
        mv.setViewName("nuevoempleado");
        return mv;
    }
    
    
    
    @RequestMapping(value = "nuevoempleado.htm", method = RequestMethod.POST)
    
    public ModelAndView NuevoEmpleado(@ModelAttribute("empleado") Empleado c) throws Exception{
        
        repo.create(c);
        
        return new ModelAndView("redirect:/empleados.htm");
    }
    
    @RequestMapping(value = "editarempleado.htm", method = RequestMethod.GET)
    public ModelAndView EditarEmpleado(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        modelo.entities.Empleado obj = repo.findEmpleado(id);

        ModelAndView mv = new ModelAndView();
        mv.addObject("empleado", obj);
        mv.setViewName("editarempleado");
        return mv;
        
    }
    
    @RequestMapping(value = "editarempleado.htm", method = RequestMethod.POST)
    public ModelAndView EditarEmpleado(@ModelAttribute("empleado") modelo.entities.Empleado c) throws Exception {
        repo.edit(c);

        return new ModelAndView("redirect:/empleados.htm");
    }
}