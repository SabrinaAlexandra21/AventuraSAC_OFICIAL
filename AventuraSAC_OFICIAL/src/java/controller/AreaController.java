/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import model.controllers.AreasJpaController;
import modelo.entities.Areas;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AreaController {
    private EntityManager em;
    private EntityManagerFactory emf;
    private AreasJpaController repo;

    public AreaController() {
        em = getEntityManager();
        repo = new AreasJpaController(emf);
    }

    private EntityManager getEntityManager() {
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("AventuraSAC_OFICIALPU");
        }
        return emf.createEntityManager();
    }
    
    @RequestMapping("nuevoempleado.htm")
    public ModelAndView MostrarFormulario() {
        List<Areas> areas =  repo.findAreasEntities();

        ModelAndView mv = new ModelAndView("nuevoempleado");
        mv.addObject("lista", areas);
        return mv;
    }
}
