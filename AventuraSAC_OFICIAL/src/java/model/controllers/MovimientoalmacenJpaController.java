/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.controllers;

import model.controllers.exceptions.NonexistentEntityException;
import model.entities.Movimientoalmacen;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import model.entities.OrdencompraDetalle;
import model.entities.Ordencompra;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author Administrador
 */
public class MovimientoalmacenJpaController implements Serializable {

    public MovimientoalmacenJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Movimientoalmacen movimientoalmacen) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            OrdencompraDetalle item = movimientoalmacen.getItem();
            if (item != null) {
                item = em.getReference(item.getClass(), item.getItem());
                movimientoalmacen.setItem(item);
            }
            Ordencompra idOrdenCompra = movimientoalmacen.getIdOrdenCompra();
            if (idOrdenCompra != null) {
                idOrdenCompra = em.getReference(idOrdenCompra.getClass(), idOrdenCompra.getIdOrdenCompra());
                movimientoalmacen.setIdOrdenCompra(idOrdenCompra);
            }
            em.persist(movimientoalmacen);
            if (item != null) {
                item.getMovimientoalmacenList().add(movimientoalmacen);
                item = em.merge(item);
            }
            if (idOrdenCompra != null) {
                idOrdenCompra.getMovimientoalmacenList().add(movimientoalmacen);
                idOrdenCompra = em.merge(idOrdenCompra);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Movimientoalmacen movimientoalmacen) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Movimientoalmacen persistentMovimientoalmacen = em.find(Movimientoalmacen.class, movimientoalmacen.getIdMovimiento());
            OrdencompraDetalle itemOld = persistentMovimientoalmacen.getItem();
            OrdencompraDetalle itemNew = movimientoalmacen.getItem();
            Ordencompra idOrdenCompraOld = persistentMovimientoalmacen.getIdOrdenCompra();
            Ordencompra idOrdenCompraNew = movimientoalmacen.getIdOrdenCompra();
            if (itemNew != null) {
                itemNew = em.getReference(itemNew.getClass(), itemNew.getItem());
                movimientoalmacen.setItem(itemNew);
            }
            if (idOrdenCompraNew != null) {
                idOrdenCompraNew = em.getReference(idOrdenCompraNew.getClass(), idOrdenCompraNew.getIdOrdenCompra());
                movimientoalmacen.setIdOrdenCompra(idOrdenCompraNew);
            }
            movimientoalmacen = em.merge(movimientoalmacen);
            if (itemOld != null && !itemOld.equals(itemNew)) {
                itemOld.getMovimientoalmacenList().remove(movimientoalmacen);
                itemOld = em.merge(itemOld);
            }
            if (itemNew != null && !itemNew.equals(itemOld)) {
                itemNew.getMovimientoalmacenList().add(movimientoalmacen);
                itemNew = em.merge(itemNew);
            }
            if (idOrdenCompraOld != null && !idOrdenCompraOld.equals(idOrdenCompraNew)) {
                idOrdenCompraOld.getMovimientoalmacenList().remove(movimientoalmacen);
                idOrdenCompraOld = em.merge(idOrdenCompraOld);
            }
            if (idOrdenCompraNew != null && !idOrdenCompraNew.equals(idOrdenCompraOld)) {
                idOrdenCompraNew.getMovimientoalmacenList().add(movimientoalmacen);
                idOrdenCompraNew = em.merge(idOrdenCompraNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = movimientoalmacen.getIdMovimiento();
                if (findMovimientoalmacen(id) == null) {
                    throw new NonexistentEntityException("The movimientoalmacen with id " + id + " no longer exists.");
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
            Movimientoalmacen movimientoalmacen;
            try {
                movimientoalmacen = em.getReference(Movimientoalmacen.class, id);
                movimientoalmacen.getIdMovimiento();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The movimientoalmacen with id " + id + " no longer exists.", enfe);
            }
            OrdencompraDetalle item = movimientoalmacen.getItem();
            if (item != null) {
                item.getMovimientoalmacenList().remove(movimientoalmacen);
                item = em.merge(item);
            }
            Ordencompra idOrdenCompra = movimientoalmacen.getIdOrdenCompra();
            if (idOrdenCompra != null) {
                idOrdenCompra.getMovimientoalmacenList().remove(movimientoalmacen);
                idOrdenCompra = em.merge(idOrdenCompra);
            }
            em.remove(movimientoalmacen);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Movimientoalmacen> findMovimientoalmacenEntities() {
        return findMovimientoalmacenEntities(true, -1, -1);
    }

    public List<Movimientoalmacen> findMovimientoalmacenEntities(int maxResults, int firstResult) {
        return findMovimientoalmacenEntities(false, maxResults, firstResult);
    }

    private List<Movimientoalmacen> findMovimientoalmacenEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Movimientoalmacen.class));
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

    public Movimientoalmacen findMovimientoalmacen(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Movimientoalmacen.class, id);
        } finally {
            em.close();
        }
    }

    public int getMovimientoalmacenCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Movimientoalmacen> rt = cq.from(Movimientoalmacen.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
