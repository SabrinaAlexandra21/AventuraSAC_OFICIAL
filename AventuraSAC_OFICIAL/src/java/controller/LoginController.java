package controller;

import java.util.List;
import javafx.scene.control.Alert;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.controllers.ClienteJpaController;
import model.controllers.EmpleadoJpaController;
import model.controllers.exceptions.NonexistentEntityException;
import model.entities.Cliente;
import model.entities.Empleado;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    private EntityManager em;
    private EntityManagerFactory emf;
    private ClienteJpaController repo;
    private EmpleadoJpaController repo1;

    public LoginController() {
        em = getEntityManager();
        repo = new ClienteJpaController(emf);
        repo1 = new EmpleadoJpaController(emf);
    }

    private EntityManager getEntityManager() {

        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("AventuraSAC_OFICIALPU");
        }
        return emf.createEntityManager();
    }

    @RequestMapping("login.htm")

    public ModelAndView Login() {
        
        ModelAndView mv = new ModelAndView();
        
        mv.setViewName("login");
        
        return mv;
    }

    @RequestMapping("menu.htm")

    public ModelAndView Menu() {
        
        ModelAndView mv = new ModelAndView();
        
        mv.setViewName("MenuTrabajador");
        
        return mv;
    }

    @RequestMapping(value = "validar.htm", method = RequestMethod.POST)

    public ModelAndView getValidaLogin(HttpServletRequest request, HttpServletResponse response) {
        
        ModelAndView mv = new ModelAndView();

        String usuario = request.getParameter("txtusuario");
        String clave = request.getParameter("txtclave");

        List<Empleado> lista = repo1.findEmpleadoEntities();
        List<Cliente> lista1 = repo.findClienteEntities();

        boolean encontrado = false;

        for (Empleado e : lista) {
            if (e.getUsuario().equals(usuario) && e.getClave().equals(clave)) {
                encontrado = true;
                mv.addObject("usuario", e);
                mv.setViewName("MenuTrabajador");
                break;
            }
        }
        if (encontrado == false) {
            for (Cliente c : lista1) {
                if (c.getUsuario().equals(usuario) && c.getClave().equals(clave)) {
                    mv.addObject("usuario", c);
                    mv.setViewName("MenuCliente");
                    break;
                }
            }
        }
        
        if (encontrado == false) {
            request.setAttribute("mensaje", "No se encuentran los datos");
            mv.setViewName("login");
        }
        else 
        {
            
        }

        return mv;
    }
}
