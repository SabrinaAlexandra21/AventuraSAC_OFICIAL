/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.controllers;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import model.entities.Cliente;
import model.entities.Cotizacion;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import model.controllers.exceptions.NonexistentEntityException;
import model.entities.Pedido;
import model.entities.PedidoDetalle;

/**
 *
 * @author Sabrina Bv
 */
public class PedidoJpaController implements Serializable {

    public PedidoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Pedido pedido) {
        if (pedido.getCotizacionList() == null) {
            pedido.setCotizacionList(new ArrayList<Cotizacion>());
        }
        if (pedido.getPedidoDetalleList() == null) {
            pedido.setPedidoDetalleList(new ArrayList<PedidoDetalle>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Cliente idCliente = pedido.getIdCliente();
            if (idCliente != null) {
                idCliente = em.getReference(idCliente.getClass(), idCliente.getIdCliente());
                pedido.setIdCliente(idCliente);
            }
            List<Cotizacion> attachedCotizacionList = new ArrayList<Cotizacion>();
            for (Cotizacion cotizacionListCotizacionToAttach : pedido.getCotizacionList()) {
                cotizacionListCotizacionToAttach = em.getReference(cotizacionListCotizacionToAttach.getClass(), cotizacionListCotizacionToAttach.getIdCotizacion());
                attachedCotizacionList.add(cotizacionListCotizacionToAttach);
            }
            pedido.setCotizacionList(attachedCotizacionList);
            List<PedidoDetalle> attachedPedidoDetalleList = new ArrayList<PedidoDetalle>();
            for (PedidoDetalle pedidoDetalleListPedidoDetalleToAttach : pedido.getPedidoDetalleList()) {
                pedidoDetalleListPedidoDetalleToAttach = em.getReference(pedidoDetalleListPedidoDetalleToAttach.getClass(), pedidoDetalleListPedidoDetalleToAttach.getIdDetallePedido());
                attachedPedidoDetalleList.add(pedidoDetalleListPedidoDetalleToAttach);
            }
            pedido.setPedidoDetalleList(attachedPedidoDetalleList);
            em.persist(pedido);
            if (idCliente != null) {
                idCliente.getPedidoList().add(pedido);
                idCliente = em.merge(idCliente);
            }
            for (Cotizacion cotizacionListCotizacion : pedido.getCotizacionList()) {
                Pedido oldIdPedidoOfCotizacionListCotizacion = cotizacionListCotizacion.getIdPedido();
                cotizacionListCotizacion.setIdPedido(pedido);
                cotizacionListCotizacion = em.merge(cotizacionListCotizacion);
                if (oldIdPedidoOfCotizacionListCotizacion != null) {
                    oldIdPedidoOfCotizacionListCotizacion.getCotizacionList().remove(cotizacionListCotizacion);
                    oldIdPedidoOfCotizacionListCotizacion = em.merge(oldIdPedidoOfCotizacionListCotizacion);
                }
            }
            for (PedidoDetalle pedidoDetalleListPedidoDetalle : pedido.getPedidoDetalleList()) {
                Pedido oldIdPedidoOfPedidoDetalleListPedidoDetalle = pedidoDetalleListPedidoDetalle.getIdPedido();
                pedidoDetalleListPedidoDetalle.setIdPedido(pedido);
                pedidoDetalleListPedidoDetalle = em.merge(pedidoDetalleListPedidoDetalle);
                if (oldIdPedidoOfPedidoDetalleListPedidoDetalle != null) {
                    oldIdPedidoOfPedidoDetalleListPedidoDetalle.getPedidoDetalleList().remove(pedidoDetalleListPedidoDetalle);
                    oldIdPedidoOfPedidoDetalleListPedidoDetalle = em.merge(oldIdPedidoOfPedidoDetalleListPedidoDetalle);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Pedido pedido) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Pedido persistentPedido = em.find(Pedido.class, pedido.getIdPedido());
            Cliente idClienteOld = persistentPedido.getIdCliente();
            Cliente idClienteNew = pedido.getIdCliente();
            List<Cotizacion> cotizacionListOld = persistentPedido.getCotizacionList();
            List<Cotizacion> cotizacionListNew = pedido.getCotizacionList();
            List<PedidoDetalle> pedidoDetalleListOld = persistentPedido.getPedidoDetalleList();
            List<PedidoDetalle> pedidoDetalleListNew = pedido.getPedidoDetalleList();
            if (idClienteNew != null) {
                idClienteNew = em.getReference(idClienteNew.getClass(), idClienteNew.getIdCliente());
                pedido.setIdCliente(idClienteNew);
            }
            List<Cotizacion> attachedCotizacionListNew = new ArrayList<Cotizacion>();
            for (Cotizacion cotizacionListNewCotizacionToAttach : cotizacionListNew) {
                cotizacionListNewCotizacionToAttach = em.getReference(cotizacionListNewCotizacionToAttach.getClass(), cotizacionListNewCotizacionToAttach.getIdCotizacion());
                attachedCotizacionListNew.add(cotizacionListNewCotizacionToAttach);
            }
            cotizacionListNew = attachedCotizacionListNew;
            pedido.setCotizacionList(cotizacionListNew);
            List<PedidoDetalle> attachedPedidoDetalleListNew = new ArrayList<PedidoDetalle>();
            for (PedidoDetalle pedidoDetalleListNewPedidoDetalleToAttach : pedidoDetalleListNew) {
                pedidoDetalleListNewPedidoDetalleToAttach = em.getReference(pedidoDetalleListNewPedidoDetalleToAttach.getClass(), pedidoDetalleListNewPedidoDetalleToAttach.getIdDetallePedido());
                attachedPedidoDetalleListNew.add(pedidoDetalleListNewPedidoDetalleToAttach);
            }
            pedidoDetalleListNew = attachedPedidoDetalleListNew;
            pedido.setPedidoDetalleList(pedidoDetalleListNew);
            pedido = em.merge(pedido);
            if (idClienteOld != null && !idClienteOld.equals(idClienteNew)) {
                idClienteOld.getPedidoList().remove(pedido);
                idClienteOld = em.merge(idClienteOld);
            }
            if (idClienteNew != null && !idClienteNew.equals(idClienteOld)) {
                idClienteNew.getPedidoList().add(pedido);
                idClienteNew = em.merge(idClienteNew);
            }
            for (Cotizacion cotizacionListOldCotizacion : cotizacionListOld) {
                if (!cotizacionListNew.contains(cotizacionListOldCotizacion)) {
                    cotizacionListOldCotizacion.setIdPedido(null);
                    cotizacionListOldCotizacion = em.merge(cotizacionListOldCotizacion);
                }
            }
            for (Cotizacion cotizacionListNewCotizacion : cotizacionListNew) {
                if (!cotizacionListOld.contains(cotizacionListNewCotizacion)) {
                    Pedido oldIdPedidoOfCotizacionListNewCotizacion = cotizacionListNewCotizacion.getIdPedido();
                    cotizacionListNewCotizacion.setIdPedido(pedido);
                    cotizacionListNewCotizacion = em.merge(cotizacionListNewCotizacion);
                    if (oldIdPedidoOfCotizacionListNewCotizacion != null && !oldIdPedidoOfCotizacionListNewCotizacion.equals(pedido)) {
                        oldIdPedidoOfCotizacionListNewCotizacion.getCotizacionList().remove(cotizacionListNewCotizacion);
                        oldIdPedidoOfCotizacionListNewCotizacion = em.merge(oldIdPedidoOfCotizacionListNewCotizacion);
                    }
                }
            }
            for (PedidoDetalle pedidoDetalleListOldPedidoDetalle : pedidoDetalleListOld) {
                if (!pedidoDetalleListNew.contains(pedidoDetalleListOldPedidoDetalle)) {
                    pedidoDetalleListOldPedidoDetalle.setIdPedido(null);
                    pedidoDetalleListOldPedidoDetalle = em.merge(pedidoDetalleListOldPedidoDetalle);
                }
            }
            for (PedidoDetalle pedidoDetalleListNewPedidoDetalle : pedidoDetalleListNew) {
                if (!pedidoDetalleListOld.contains(pedidoDetalleListNewPedidoDetalle)) {
                    Pedido oldIdPedidoOfPedidoDetalleListNewPedidoDetalle = pedidoDetalleListNewPedidoDetalle.getIdPedido();
                    pedidoDetalleListNewPedidoDetalle.setIdPedido(pedido);
                    pedidoDetalleListNewPedidoDetalle = em.merge(pedidoDetalleListNewPedidoDetalle);
                    if (oldIdPedidoOfPedidoDetalleListNewPedidoDetalle != null && !oldIdPedidoOfPedidoDetalleListNewPedidoDetalle.equals(pedido)) {
                        oldIdPedidoOfPedidoDetalleListNewPedidoDetalle.getPedidoDetalleList().remove(pedidoDetalleListNewPedidoDetalle);
                        oldIdPedidoOfPedidoDetalleListNewPedidoDetalle = em.merge(oldIdPedidoOfPedidoDetalleListNewPedidoDetalle);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = pedido.getIdPedido();
                if (findPedido(id) == null) {
                    throw new NonexistentEntityException("The pedido with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Pedido pedido;
            try {
                pedido = em.getReference(Pedido.class, id);
                pedido.getIdPedido();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The pedido with id " + id + " no longer exists.", enfe);
            }
            Cliente idCliente = pedido.getIdCliente();
            if (idCliente != null) {
                idCliente.getPedidoList().remove(pedido);
                idCliente = em.merge(idCliente);
            }
            List<Cotizacion> cotizacionList = pedido.getCotizacionList();
            for (Cotizacion cotizacionListCotizacion : cotizacionList) {
                cotizacionListCotizacion.setIdPedido(null);
                cotizacionListCotizacion = em.merge(cotizacionListCotizacion);
            }
            List<PedidoDetalle> pedidoDetalleList = pedido.getPedidoDetalleList();
            for (PedidoDetalle pedidoDetalleListPedidoDetalle : pedidoDetalleList) {
                pedidoDetalleListPedidoDetalle.setIdPedido(null);
                pedidoDetalleListPedidoDetalle = em.merge(pedidoDetalleListPedidoDetalle);
            }
            em.remove(pedido);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Pedido> findPedidoEntities() {
        return findPedidoEntities(true, -1, -1);
    }

    public List<Pedido> findPedidoEntities(int maxResults, int firstResult) {
        return findPedidoEntities(false, maxResults, firstResult);
    }

    private List<Pedido> findPedidoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Pedido.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Pedido findPedido(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Pedido.class, id);
        } finally {
            em.close();
        }
    }

    public int getPedidoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Pedido> rt = cq.from(Pedido.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
