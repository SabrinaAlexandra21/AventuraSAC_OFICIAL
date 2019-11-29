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
import model.entities.OrdencompraDetalle;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import model.controllers.exceptions.NonexistentEntityException;
import model.entities.Ordencompra;

/**
 *
 * @author Sabrina Bv
 */
public class OrdencompraJpaController implements Serializable {

    public OrdencompraJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Ordencompra ordencompra) {
        if (ordencompra.getOrdencompraDetalleList() == null) {
            ordencompra.setOrdencompraDetalleList(new ArrayList<OrdencompraDetalle>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<OrdencompraDetalle> attachedOrdencompraDetalleList = new ArrayList<OrdencompraDetalle>();
            for (OrdencompraDetalle ordencompraDetalleListOrdencompraDetalleToAttach : ordencompra.getOrdencompraDetalleList()) {
                ordencompraDetalleListOrdencompraDetalleToAttach = em.getReference(ordencompraDetalleListOrdencompraDetalleToAttach.getClass(), ordencompraDetalleListOrdencompraDetalleToAttach.getItem());
                attachedOrdencompraDetalleList.add(ordencompraDetalleListOrdencompraDetalleToAttach);
            }
            ordencompra.setOrdencompraDetalleList(attachedOrdencompraDetalleList);
            em.persist(ordencompra);
            for (OrdencompraDetalle ordencompraDetalleListOrdencompraDetalle : ordencompra.getOrdencompraDetalleList()) {
                Ordencompra oldIdOrdenCompraOfOrdencompraDetalleListOrdencompraDetalle = ordencompraDetalleListOrdencompraDetalle.getIdOrdenCompra();
                ordencompraDetalleListOrdencompraDetalle.setIdOrdenCompra(ordencompra);
                ordencompraDetalleListOrdencompraDetalle = em.merge(ordencompraDetalleListOrdencompraDetalle);
                if (oldIdOrdenCompraOfOrdencompraDetalleListOrdencompraDetalle != null) {
                    oldIdOrdenCompraOfOrdencompraDetalleListOrdencompraDetalle.getOrdencompraDetalleList().remove(ordencompraDetalleListOrdencompraDetalle);
                    oldIdOrdenCompraOfOrdencompraDetalleListOrdencompraDetalle = em.merge(oldIdOrdenCompraOfOrdencompraDetalleListOrdencompraDetalle);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Ordencompra ordencompra) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Ordencompra persistentOrdencompra = em.find(Ordencompra.class, ordencompra.getIdOrdenCompra());
            List<OrdencompraDetalle> ordencompraDetalleListOld = persistentOrdencompra.getOrdencompraDetalleList();
            List<OrdencompraDetalle> ordencompraDetalleListNew = ordencompra.getOrdencompraDetalleList();
            List<OrdencompraDetalle> attachedOrdencompraDetalleListNew = new ArrayList<OrdencompraDetalle>();
            for (OrdencompraDetalle ordencompraDetalleListNewOrdencompraDetalleToAttach : ordencompraDetalleListNew) {
                ordencompraDetalleListNewOrdencompraDetalleToAttach = em.getReference(ordencompraDetalleListNewOrdencompraDetalleToAttach.getClass(), ordencompraDetalleListNewOrdencompraDetalleToAttach.getItem());
                attachedOrdencompraDetalleListNew.add(ordencompraDetalleListNewOrdencompraDetalleToAttach);
            }
            ordencompraDetalleListNew = attachedOrdencompraDetalleListNew;
            ordencompra.setOrdencompraDetalleList(ordencompraDetalleListNew);
            ordencompra = em.merge(ordencompra);
            for (OrdencompraDetalle ordencompraDetalleListOldOrdencompraDetalle : ordencompraDetalleListOld) {
                if (!ordencompraDetalleListNew.contains(ordencompraDetalleListOldOrdencompraDetalle)) {
                    ordencompraDetalleListOldOrdencompraDetalle.setIdOrdenCompra(null);
                    ordencompraDetalleListOldOrdencompraDetalle = em.merge(ordencompraDetalleListOldOrdencompraDetalle);
                }
            }
            for (OrdencompraDetalle ordencompraDetalleListNewOrdencompraDetalle : ordencompraDetalleListNew) {
                if (!ordencompraDetalleListOld.contains(ordencompraDetalleListNewOrdencompraDetalle)) {
                    Ordencompra oldIdOrdenCompraOfOrdencompraDetalleListNewOrdencompraDetalle = ordencompraDetalleListNewOrdencompraDetalle.getIdOrdenCompra();
                    ordencompraDetalleListNewOrdencompraDetalle.setIdOrdenCompra(ordencompra);
                    ordencompraDetalleListNewOrdencompraDetalle = em.merge(ordencompraDetalleListNewOrdencompraDetalle);
                    if (oldIdOrdenCompraOfOrdencompraDetalleListNewOrdencompraDetalle != null && !oldIdOrdenCompraOfOrdencompraDetalleListNewOrdencompraDetalle.equals(ordencompra)) {
                        oldIdOrdenCompraOfOrdencompraDetalleListNewOrdencompraDetalle.getOrdencompraDetalleList().remove(ordencompraDetalleListNewOrdencompraDetalle);
                        oldIdOrdenCompraOfOrdencompraDetalleListNewOrdencompraDetalle = em.merge(oldIdOrdenCompraOfOrdencompraDetalleListNewOrdencompraDetalle);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = ordencompra.getIdOrdenCompra();
                if (findOrdencompra(id) == null) {
                    throw new NonexistentEntityException("The ordencompra with id " + id + " no longer exists.");
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
            Ordencompra ordencompra;
            try {
                ordencompra = em.getReference(Ordencompra.class, id);
                ordencompra.getIdOrdenCompra();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The ordencompra with id " + id + " no longer exists.", enfe);
            }
            List<OrdencompraDetalle> ordencompraDetalleList = ordencompra.getOrdencompraDetalleList();
            for (OrdencompraDetalle ordencompraDetalleListOrdencompraDetalle : ordencompraDetalleList) {
                ordencompraDetalleListOrdencompraDetalle.setIdOrdenCompra(null);
                ordencompraDetalleListOrdencompraDetalle = em.merge(ordencompraDetalleListOrdencompraDetalle);
            }
            em.remove(ordencompra);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Ordencompra> findOrdencompraEntities() {
        return findOrdencompraEntities(true, -1, -1);
    }

    public List<Ordencompra> findOrdencompraEntities(int maxResults, int firstResult) {
        return findOrdencompraEntities(false, maxResults, firstResult);
    }

    private List<Ordencompra> findOrdencompraEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Ordencompra.class));
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

    public Ordencompra findOrdencompra(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Ordencompra.class, id);
        } finally {
            em.close();
        }
    }

    public int getOrdencompraCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Ordencompra> rt = cq.from(Ordencompra.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
