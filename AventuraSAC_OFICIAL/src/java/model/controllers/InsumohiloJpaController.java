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
import model.entities.Movimientoalmacen;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import model.controllers.exceptions.NonexistentEntityException;
import model.entities.Insumohilo;
import model.entities.OrdencompraDetalle;

/**
 *
 * @author Administrador
 */
public class InsumohiloJpaController implements Serializable {

    public InsumohiloJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Insumohilo insumohilo) {
        if (insumohilo.getMovimientoalmacenList() == null) {
            insumohilo.setMovimientoalmacenList(new ArrayList<Movimientoalmacen>());
        }
        if (insumohilo.getOrdencompraDetalleList() == null) {
            insumohilo.setOrdencompraDetalleList(new ArrayList<OrdencompraDetalle>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Movimientoalmacen> attachedMovimientoalmacenList = new ArrayList<Movimientoalmacen>();
            for (Movimientoalmacen movimientoalmacenListMovimientoalmacenToAttach : insumohilo.getMovimientoalmacenList()) {
                movimientoalmacenListMovimientoalmacenToAttach = em.getReference(movimientoalmacenListMovimientoalmacenToAttach.getClass(), movimientoalmacenListMovimientoalmacenToAttach.getIdMovimiento());
                attachedMovimientoalmacenList.add(movimientoalmacenListMovimientoalmacenToAttach);
            }
            insumohilo.setMovimientoalmacenList(attachedMovimientoalmacenList);
            List<OrdencompraDetalle> attachedOrdencompraDetalleList = new ArrayList<OrdencompraDetalle>();
            for (OrdencompraDetalle ordencompraDetalleListOrdencompraDetalleToAttach : insumohilo.getOrdencompraDetalleList()) {
                ordencompraDetalleListOrdencompraDetalleToAttach = em.getReference(ordencompraDetalleListOrdencompraDetalleToAttach.getClass(), ordencompraDetalleListOrdencompraDetalleToAttach.getItem());
                attachedOrdencompraDetalleList.add(ordencompraDetalleListOrdencompraDetalleToAttach);
            }
            insumohilo.setOrdencompraDetalleList(attachedOrdencompraDetalleList);
            em.persist(insumohilo);
            for (Movimientoalmacen movimientoalmacenListMovimientoalmacen : insumohilo.getMovimientoalmacenList()) {
                Insumohilo oldIdInsumoOfMovimientoalmacenListMovimientoalmacen = movimientoalmacenListMovimientoalmacen.getIdInsumo();
                movimientoalmacenListMovimientoalmacen.setIdInsumo(insumohilo);
                movimientoalmacenListMovimientoalmacen = em.merge(movimientoalmacenListMovimientoalmacen);
                if (oldIdInsumoOfMovimientoalmacenListMovimientoalmacen != null) {
                    oldIdInsumoOfMovimientoalmacenListMovimientoalmacen.getMovimientoalmacenList().remove(movimientoalmacenListMovimientoalmacen);
                    oldIdInsumoOfMovimientoalmacenListMovimientoalmacen = em.merge(oldIdInsumoOfMovimientoalmacenListMovimientoalmacen);
                }
            }
            for (OrdencompraDetalle ordencompraDetalleListOrdencompraDetalle : insumohilo.getOrdencompraDetalleList()) {
                Insumohilo oldIdInsumoOfOrdencompraDetalleListOrdencompraDetalle = ordencompraDetalleListOrdencompraDetalle.getIdInsumo();
                ordencompraDetalleListOrdencompraDetalle.setIdInsumo(insumohilo);
                ordencompraDetalleListOrdencompraDetalle = em.merge(ordencompraDetalleListOrdencompraDetalle);
                if (oldIdInsumoOfOrdencompraDetalleListOrdencompraDetalle != null) {
                    oldIdInsumoOfOrdencompraDetalleListOrdencompraDetalle.getOrdencompraDetalleList().remove(ordencompraDetalleListOrdencompraDetalle);
                    oldIdInsumoOfOrdencompraDetalleListOrdencompraDetalle = em.merge(oldIdInsumoOfOrdencompraDetalleListOrdencompraDetalle);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Insumohilo insumohilo) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Insumohilo persistentInsumohilo = em.find(Insumohilo.class, insumohilo.getIdInsumo());
            List<Movimientoalmacen> movimientoalmacenListOld = persistentInsumohilo.getMovimientoalmacenList();
            List<Movimientoalmacen> movimientoalmacenListNew = insumohilo.getMovimientoalmacenList();
            List<OrdencompraDetalle> ordencompraDetalleListOld = persistentInsumohilo.getOrdencompraDetalleList();
            List<OrdencompraDetalle> ordencompraDetalleListNew = insumohilo.getOrdencompraDetalleList();
            List<Movimientoalmacen> attachedMovimientoalmacenListNew = new ArrayList<Movimientoalmacen>();
            for (Movimientoalmacen movimientoalmacenListNewMovimientoalmacenToAttach : movimientoalmacenListNew) {
                movimientoalmacenListNewMovimientoalmacenToAttach = em.getReference(movimientoalmacenListNewMovimientoalmacenToAttach.getClass(), movimientoalmacenListNewMovimientoalmacenToAttach.getIdMovimiento());
                attachedMovimientoalmacenListNew.add(movimientoalmacenListNewMovimientoalmacenToAttach);
            }
            movimientoalmacenListNew = attachedMovimientoalmacenListNew;
            insumohilo.setMovimientoalmacenList(movimientoalmacenListNew);
            List<OrdencompraDetalle> attachedOrdencompraDetalleListNew = new ArrayList<OrdencompraDetalle>();
            for (OrdencompraDetalle ordencompraDetalleListNewOrdencompraDetalleToAttach : ordencompraDetalleListNew) {
                ordencompraDetalleListNewOrdencompraDetalleToAttach = em.getReference(ordencompraDetalleListNewOrdencompraDetalleToAttach.getClass(), ordencompraDetalleListNewOrdencompraDetalleToAttach.getItem());
                attachedOrdencompraDetalleListNew.add(ordencompraDetalleListNewOrdencompraDetalleToAttach);
            }
            ordencompraDetalleListNew = attachedOrdencompraDetalleListNew;
            insumohilo.setOrdencompraDetalleList(ordencompraDetalleListNew);
            insumohilo = em.merge(insumohilo);
            for (Movimientoalmacen movimientoalmacenListOldMovimientoalmacen : movimientoalmacenListOld) {
                if (!movimientoalmacenListNew.contains(movimientoalmacenListOldMovimientoalmacen)) {
                    movimientoalmacenListOldMovimientoalmacen.setIdInsumo(null);
                    movimientoalmacenListOldMovimientoalmacen = em.merge(movimientoalmacenListOldMovimientoalmacen);
                }
            }
            for (Movimientoalmacen movimientoalmacenListNewMovimientoalmacen : movimientoalmacenListNew) {
                if (!movimientoalmacenListOld.contains(movimientoalmacenListNewMovimientoalmacen)) {
                    Insumohilo oldIdInsumoOfMovimientoalmacenListNewMovimientoalmacen = movimientoalmacenListNewMovimientoalmacen.getIdInsumo();
                    movimientoalmacenListNewMovimientoalmacen.setIdInsumo(insumohilo);
                    movimientoalmacenListNewMovimientoalmacen = em.merge(movimientoalmacenListNewMovimientoalmacen);
                    if (oldIdInsumoOfMovimientoalmacenListNewMovimientoalmacen != null && !oldIdInsumoOfMovimientoalmacenListNewMovimientoalmacen.equals(insumohilo)) {
                        oldIdInsumoOfMovimientoalmacenListNewMovimientoalmacen.getMovimientoalmacenList().remove(movimientoalmacenListNewMovimientoalmacen);
                        oldIdInsumoOfMovimientoalmacenListNewMovimientoalmacen = em.merge(oldIdInsumoOfMovimientoalmacenListNewMovimientoalmacen);
                    }
                }
            }
            for (OrdencompraDetalle ordencompraDetalleListOldOrdencompraDetalle : ordencompraDetalleListOld) {
                if (!ordencompraDetalleListNew.contains(ordencompraDetalleListOldOrdencompraDetalle)) {
                    ordencompraDetalleListOldOrdencompraDetalle.setIdInsumo(null);
                    ordencompraDetalleListOldOrdencompraDetalle = em.merge(ordencompraDetalleListOldOrdencompraDetalle);
                }
            }
            for (OrdencompraDetalle ordencompraDetalleListNewOrdencompraDetalle : ordencompraDetalleListNew) {
                if (!ordencompraDetalleListOld.contains(ordencompraDetalleListNewOrdencompraDetalle)) {
                    Insumohilo oldIdInsumoOfOrdencompraDetalleListNewOrdencompraDetalle = ordencompraDetalleListNewOrdencompraDetalle.getIdInsumo();
                    ordencompraDetalleListNewOrdencompraDetalle.setIdInsumo(insumohilo);
                    ordencompraDetalleListNewOrdencompraDetalle = em.merge(ordencompraDetalleListNewOrdencompraDetalle);
                    if (oldIdInsumoOfOrdencompraDetalleListNewOrdencompraDetalle != null && !oldIdInsumoOfOrdencompraDetalleListNewOrdencompraDetalle.equals(insumohilo)) {
                        oldIdInsumoOfOrdencompraDetalleListNewOrdencompraDetalle.getOrdencompraDetalleList().remove(ordencompraDetalleListNewOrdencompraDetalle);
                        oldIdInsumoOfOrdencompraDetalleListNewOrdencompraDetalle = em.merge(oldIdInsumoOfOrdencompraDetalleListNewOrdencompraDetalle);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = insumohilo.getIdInsumo();
                if (findInsumohilo(id) == null) {
                    throw new NonexistentEntityException("The insumohilo with id " + id + " no longer exists.");
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
            Insumohilo insumohilo;
            try {
                insumohilo = em.getReference(Insumohilo.class, id);
                insumohilo.getIdInsumo();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The insumohilo with id " + id + " no longer exists.", enfe);
            }
            List<Movimientoalmacen> movimientoalmacenList = insumohilo.getMovimientoalmacenList();
            for (Movimientoalmacen movimientoalmacenListMovimientoalmacen : movimientoalmacenList) {
                movimientoalmacenListMovimientoalmacen.setIdInsumo(null);
                movimientoalmacenListMovimientoalmacen = em.merge(movimientoalmacenListMovimientoalmacen);
            }
            List<OrdencompraDetalle> ordencompraDetalleList = insumohilo.getOrdencompraDetalleList();
            for (OrdencompraDetalle ordencompraDetalleListOrdencompraDetalle : ordencompraDetalleList) {
                ordencompraDetalleListOrdencompraDetalle.setIdInsumo(null);
                ordencompraDetalleListOrdencompraDetalle = em.merge(ordencompraDetalleListOrdencompraDetalle);
            }
            em.remove(insumohilo);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Insumohilo> findInsumohiloEntities() {
        return findInsumohiloEntities(true, -1, -1);
    }

    public List<Insumohilo> findInsumohiloEntities(int maxResults, int firstResult) {
        return findInsumohiloEntities(false, maxResults, firstResult);
    }

    private List<Insumohilo> findInsumohiloEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Insumohilo.class));
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

    public Insumohilo findInsumohilo(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Insumohilo.class, id);
        } finally {
            em.close();
        }
    }

    public int getInsumohiloCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Insumohilo> rt = cq.from(Insumohilo.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
