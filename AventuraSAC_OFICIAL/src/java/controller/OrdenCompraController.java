package controller;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import model.controllers.ClienteJpaController;

/**
 *
 * @author Sabrina Bv
 */
public class OrdenCompraController  {


    private EntityManager em;
    private EntityManagerFactory emf;
    private ClienteJpaController repo;
    
    public OrdenCompraController() {
        em = getEntityManager();
        repo = new ClienteJpaController(emf);
    }

    private EntityManager getEntityManager() {
        
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("AventuraSAC_OFICIALPU");
        }
        return emf.createEntityManager();
    }
}