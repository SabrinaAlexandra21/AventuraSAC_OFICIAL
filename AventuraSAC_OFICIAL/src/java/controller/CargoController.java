
package controller;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import model.controllers.CargoJpaController;
import modelo.entities.Cargo;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public class CargoController {
    
     private EntityManager em;
    private EntityManagerFactory emf;
    private CargoJpaController repo;

    public CargoController() {
        em = getEntityManager();
        repo = new CargoJpaController(emf);
    }

    private EntityManager getEntityManager() {
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("AventuraSAC_OFICIALPU");
        }
        return emf.createEntityManager();
    }
    
    @RequestMapping("nuevoempleado.htm")
    public ModelAndView MostrarCargo() {
        List<Cargo> cargos =  repo.findCargoEntities();

        ModelAndView mv = new ModelAndView("nuevoempleado");
        mv.addObject("listaCargo", cargos);
        return mv;
    }
}
