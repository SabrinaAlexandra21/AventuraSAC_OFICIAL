package controller;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import model.controllers.ClienteJpaController;
import model.controllers.CotizacionJpaController;
import model.controllers.PedidoJpaController;
import model.controllers.CotizacionDetalleJpaController;
import model.controllers.PedidoDetalleJpaController;


/**
 *
 * @author Sabrina Bv
 */
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
    }

    private EntityManager getEntityManager() {
        
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("AventuraSAC_OFICIALPU");
        }
        return emf.createEntityManager();
    }
}