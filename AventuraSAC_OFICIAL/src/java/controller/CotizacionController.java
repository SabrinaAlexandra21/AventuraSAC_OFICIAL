package controller;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import model.controller.ClienteJpaController;
import model.controller.CotizacionJpaController;
import model.controller.PedidoJpaController;


/**
 *
 * @author Sabrina Bv
 */
public class CotizacionController {


    private EntityManager em;
    private EntityManagerFactory emf;
    private ClienteJpaController repo;
    private PedidoJpaController repo;
    private CotizacionJpaController repo;
    private DetalleJpaController repo;
    
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
}