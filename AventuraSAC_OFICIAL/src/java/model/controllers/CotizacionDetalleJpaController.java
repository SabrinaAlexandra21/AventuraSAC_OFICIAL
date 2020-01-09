/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.controllers;

import model.controllers.exceptions.NonexistentEntityException;
import java.io.Serializable;
import java.util.ArrayList;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import model.entities.Cotizacion;
import model.entities.CotizacionDetalle;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import model.entities.PedidoDetalle;

/**
 *
 * @author Administrador
 */
public class CotizacionDetalleJpaController implements Serializable {

    public CotizacionDetalleJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(CotizacionDetalle cotizacionDetalle) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Cotizacion idCotizacion = cotizacionDetalle.getIdCotizacion();
            if (idCotizacion != null) {
                idCotizacion = em.getReference(idCotizacion.getClass(), idCotizacion.getIdCotizacion());
                cotizacionDetalle.setIdCotizacion(idCotizacion);
            }
            em.persist(cotizacionDetalle);
            if (idCotizacion != null) {
                idCotizacion.getCotizacionDetalleList().add(cotizacionDetalle);
                idCotizacion = em.merge(idCotizacion);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(CotizacionDetalle cotizacionDetalle) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            CotizacionDetalle persistentCotizacionDetalle = em.find(CotizacionDetalle.class, cotizacionDetalle.getIdDetalleCotizacion());
            Cotizacion idCotizacionOld = persistentCotizacionDetalle.getIdCotizacion();
            Cotizacion idCotizacionNew = cotizacionDetalle.getIdCotizacion();
            if (idCotizacionNew != null) {
                idCotizacionNew = em.getReference(idCotizacionNew.getClass(), idCotizacionNew.getIdCotizacion());
                cotizacionDetalle.setIdCotizacion(idCotizacionNew);
            }
            cotizacionDetalle = em.merge(cotizacionDetalle);
            if (idCotizacionOld != null && !idCotizacionOld.equals(idCotizacionNew)) {
                idCotizacionOld.getCotizacionDetalleList().remove(cotizacionDetalle);
                idCotizacionOld = em.merge(idCotizacionOld);
            }
            if (idCotizacionNew != null && !idCotizacionNew.equals(idCotizacionOld)) {
                idCotizacionNew.getCotizacionDetalleList().add(cotizacionDetalle);
                idCotizacionNew = em.merge(idCotizacionNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = cotizacionDetalle.getIdDetalleCotizacion();
                if (findCotizacionDetalle(id) == null) {
                    throw new NonexistentEntityException("The cotizacionDetalle with id " + id + " no longer exists.");
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
            CotizacionDetalle cotizacionDetalle;
            try {
                cotizacionDetalle = em.getReference(CotizacionDetalle.class, id);
                cotizacionDetalle.getIdDetalleCotizacion();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The cotizacionDetalle with id " + id + " no longer exists.", enfe);
            }
            Cotizacion idCotizacion = cotizacionDetalle.getIdCotizacion();
            if (idCotizacion != null) {
                idCotizacion.getCotizacionDetalleList().remove(cotizacionDetalle);
                idCotizacion = em.merge(idCotizacion);
            }
            em.remove(cotizacionDetalle);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<CotizacionDetalle> findCotizacionDetalleEntities() {
        return findCotizacionDetalleEntities(true, -1, -1);
    }

    public List<CotizacionDetalle> findCotizacionDetalleEntities(int maxResults, int firstResult) {
        return findCotizacionDetalleEntities(false, maxResults, firstResult);
    }

    private List<CotizacionDetalle> findCotizacionDetalleEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(CotizacionDetalle.class));
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
    
    public List<CotizacionDetalle> listadoxpedido(int idDetallePedido) {
        EntityManager em = getEntityManager();
        List<CotizacionDetalle> lista = new ArrayList();
        try {
            Query q = em.createQuery("SELECT c FROM CotizacionDetalle c WHERE c.idDetallePedido.idDetallePedido = :idDetallePedido").setParameter("idDetallePedido",idDetallePedido);
            lista = (List<CotizacionDetalle>)q.getResultList();
            System.out.println("Listado por detalle pedido" + lista.size());
            
        //}catch(Exception e){
            
          //  System.out.println(e.getMessage());
        } 
        finally {
            em.close();
        }
        return lista;
    }


    public CotizacionDetalle findCotizacionDetalle(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(CotizacionDetalle.class, id);
        } finally {
            em.close();
        }
    }

    public int getCotizacionDetalleCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<CotizacionDetalle> rt = cq.from(CotizacionDetalle.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
