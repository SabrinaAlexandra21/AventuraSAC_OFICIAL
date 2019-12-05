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
import model.entities.Tipoprenda;
import model.entities.Talla;
import model.entities.Tipotela;
import model.entities.PedidoDetalle;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import model.controllers.exceptions.NonexistentEntityException;
import model.entities.Fichatecnica;

/**
 *
 * @author Administrador
 */
public class FichatecnicaJpaController implements Serializable {

    public FichatecnicaJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Fichatecnica fichatecnica) {
        if (fichatecnica.getPedidoDetalleList() == null) {
            fichatecnica.setPedidoDetalleList(new ArrayList<PedidoDetalle>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Tipoprenda idTipoPrenda = fichatecnica.getIdTipoPrenda();
            if (idTipoPrenda != null) {
                idTipoPrenda = em.getReference(idTipoPrenda.getClass(), idTipoPrenda.getIdTipoPrenda());
                fichatecnica.setIdTipoPrenda(idTipoPrenda);
            }
            Talla idTalla = fichatecnica.getIdTalla();
            if (idTalla != null) {
                idTalla = em.getReference(idTalla.getClass(), idTalla.getIdTalla());
                fichatecnica.setIdTalla(idTalla);
            }
            Tipotela idTipo = fichatecnica.getIdTipo();
            if (idTipo != null) {
                idTipo = em.getReference(idTipo.getClass(), idTipo.getIdTipo());
                fichatecnica.setIdTipo(idTipo);
            }
            List<PedidoDetalle> attachedPedidoDetalleList = new ArrayList<PedidoDetalle>();
            for (PedidoDetalle pedidoDetalleListPedidoDetalleToAttach : fichatecnica.getPedidoDetalleList()) {
                pedidoDetalleListPedidoDetalleToAttach = em.getReference(pedidoDetalleListPedidoDetalleToAttach.getClass(), pedidoDetalleListPedidoDetalleToAttach.getIdDetallePedido());
                attachedPedidoDetalleList.add(pedidoDetalleListPedidoDetalleToAttach);
            }
            fichatecnica.setPedidoDetalleList(attachedPedidoDetalleList);
            em.persist(fichatecnica);
            if (idTipoPrenda != null) {
                idTipoPrenda.getFichatecnicaList().add(fichatecnica);
                idTipoPrenda = em.merge(idTipoPrenda);
            }
            if (idTalla != null) {
                idTalla.getFichatecnicaList().add(fichatecnica);
                idTalla = em.merge(idTalla);
            }
            if (idTipo != null) {
                idTipo.getFichatecnicaList().add(fichatecnica);
                idTipo = em.merge(idTipo);
            }
            for (PedidoDetalle pedidoDetalleListPedidoDetalle : fichatecnica.getPedidoDetalleList()) {
                Fichatecnica oldIdFichaOfPedidoDetalleListPedidoDetalle = pedidoDetalleListPedidoDetalle.getIdFicha();
                pedidoDetalleListPedidoDetalle.setIdFicha(fichatecnica);
                pedidoDetalleListPedidoDetalle = em.merge(pedidoDetalleListPedidoDetalle);
                if (oldIdFichaOfPedidoDetalleListPedidoDetalle != null) {
                    oldIdFichaOfPedidoDetalleListPedidoDetalle.getPedidoDetalleList().remove(pedidoDetalleListPedidoDetalle);
                    oldIdFichaOfPedidoDetalleListPedidoDetalle = em.merge(oldIdFichaOfPedidoDetalleListPedidoDetalle);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Fichatecnica fichatecnica) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Fichatecnica persistentFichatecnica = em.find(Fichatecnica.class, fichatecnica.getIdFicha());
            Tipoprenda idTipoPrendaOld = persistentFichatecnica.getIdTipoPrenda();
            Tipoprenda idTipoPrendaNew = fichatecnica.getIdTipoPrenda();
            Talla idTallaOld = persistentFichatecnica.getIdTalla();
            Talla idTallaNew = fichatecnica.getIdTalla();
            Tipotela idTipoOld = persistentFichatecnica.getIdTipo();
            Tipotela idTipoNew = fichatecnica.getIdTipo();
            List<PedidoDetalle> pedidoDetalleListOld = persistentFichatecnica.getPedidoDetalleList();
            List<PedidoDetalle> pedidoDetalleListNew = fichatecnica.getPedidoDetalleList();
            if (idTipoPrendaNew != null) {
                idTipoPrendaNew = em.getReference(idTipoPrendaNew.getClass(), idTipoPrendaNew.getIdTipoPrenda());
                fichatecnica.setIdTipoPrenda(idTipoPrendaNew);
            }
            if (idTallaNew != null) {
                idTallaNew = em.getReference(idTallaNew.getClass(), idTallaNew.getIdTalla());
                fichatecnica.setIdTalla(idTallaNew);
            }
            if (idTipoNew != null) {
                idTipoNew = em.getReference(idTipoNew.getClass(), idTipoNew.getIdTipo());
                fichatecnica.setIdTipo(idTipoNew);
            }
            List<PedidoDetalle> attachedPedidoDetalleListNew = new ArrayList<PedidoDetalle>();
            for (PedidoDetalle pedidoDetalleListNewPedidoDetalleToAttach : pedidoDetalleListNew) {
                pedidoDetalleListNewPedidoDetalleToAttach = em.getReference(pedidoDetalleListNewPedidoDetalleToAttach.getClass(), pedidoDetalleListNewPedidoDetalleToAttach.getIdDetallePedido());
                attachedPedidoDetalleListNew.add(pedidoDetalleListNewPedidoDetalleToAttach);
            }
            pedidoDetalleListNew = attachedPedidoDetalleListNew;
            fichatecnica.setPedidoDetalleList(pedidoDetalleListNew);
            fichatecnica = em.merge(fichatecnica);
            if (idTipoPrendaOld != null && !idTipoPrendaOld.equals(idTipoPrendaNew)) {
                idTipoPrendaOld.getFichatecnicaList().remove(fichatecnica);
                idTipoPrendaOld = em.merge(idTipoPrendaOld);
            }
            if (idTipoPrendaNew != null && !idTipoPrendaNew.equals(idTipoPrendaOld)) {
                idTipoPrendaNew.getFichatecnicaList().add(fichatecnica);
                idTipoPrendaNew = em.merge(idTipoPrendaNew);
            }
            if (idTallaOld != null && !idTallaOld.equals(idTallaNew)) {
                idTallaOld.getFichatecnicaList().remove(fichatecnica);
                idTallaOld = em.merge(idTallaOld);
            }
            if (idTallaNew != null && !idTallaNew.equals(idTallaOld)) {
                idTallaNew.getFichatecnicaList().add(fichatecnica);
                idTallaNew = em.merge(idTallaNew);
            }
            if (idTipoOld != null && !idTipoOld.equals(idTipoNew)) {
                idTipoOld.getFichatecnicaList().remove(fichatecnica);
                idTipoOld = em.merge(idTipoOld);
            }
            if (idTipoNew != null && !idTipoNew.equals(idTipoOld)) {
                idTipoNew.getFichatecnicaList().add(fichatecnica);
                idTipoNew = em.merge(idTipoNew);
            }
            for (PedidoDetalle pedidoDetalleListOldPedidoDetalle : pedidoDetalleListOld) {
                if (!pedidoDetalleListNew.contains(pedidoDetalleListOldPedidoDetalle)) {
                    pedidoDetalleListOldPedidoDetalle.setIdFicha(null);
                    pedidoDetalleListOldPedidoDetalle = em.merge(pedidoDetalleListOldPedidoDetalle);
                }
            }
            for (PedidoDetalle pedidoDetalleListNewPedidoDetalle : pedidoDetalleListNew) {
                if (!pedidoDetalleListOld.contains(pedidoDetalleListNewPedidoDetalle)) {
                    Fichatecnica oldIdFichaOfPedidoDetalleListNewPedidoDetalle = pedidoDetalleListNewPedidoDetalle.getIdFicha();
                    pedidoDetalleListNewPedidoDetalle.setIdFicha(fichatecnica);
                    pedidoDetalleListNewPedidoDetalle = em.merge(pedidoDetalleListNewPedidoDetalle);
                    if (oldIdFichaOfPedidoDetalleListNewPedidoDetalle != null && !oldIdFichaOfPedidoDetalleListNewPedidoDetalle.equals(fichatecnica)) {
                        oldIdFichaOfPedidoDetalleListNewPedidoDetalle.getPedidoDetalleList().remove(pedidoDetalleListNewPedidoDetalle);
                        oldIdFichaOfPedidoDetalleListNewPedidoDetalle = em.merge(oldIdFichaOfPedidoDetalleListNewPedidoDetalle);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = fichatecnica.getIdFicha();
                if (findFichatecnica(id) == null) {
                    throw new NonexistentEntityException("The fichatecnica with id " + id + " no longer exists.");
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
            Fichatecnica fichatecnica;
            try {
                fichatecnica = em.getReference(Fichatecnica.class, id);
                fichatecnica.getIdFicha();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The fichatecnica with id " + id + " no longer exists.", enfe);
            }
            Tipoprenda idTipoPrenda = fichatecnica.getIdTipoPrenda();
            if (idTipoPrenda != null) {
                idTipoPrenda.getFichatecnicaList().remove(fichatecnica);
                idTipoPrenda = em.merge(idTipoPrenda);
            }
            Talla idTalla = fichatecnica.getIdTalla();
            if (idTalla != null) {
                idTalla.getFichatecnicaList().remove(fichatecnica);
                idTalla = em.merge(idTalla);
            }
            Tipotela idTipo = fichatecnica.getIdTipo();
            if (idTipo != null) {
                idTipo.getFichatecnicaList().remove(fichatecnica);
                idTipo = em.merge(idTipo);
            }
            List<PedidoDetalle> pedidoDetalleList = fichatecnica.getPedidoDetalleList();
            for (PedidoDetalle pedidoDetalleListPedidoDetalle : pedidoDetalleList) {
                pedidoDetalleListPedidoDetalle.setIdFicha(null);
                pedidoDetalleListPedidoDetalle = em.merge(pedidoDetalleListPedidoDetalle);
            }
            em.remove(fichatecnica);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Fichatecnica> findFichatecnicaEntities() {
        return findFichatecnicaEntities(true, -1, -1);
    }

    public List<Fichatecnica> findFichatecnicaEntities(int maxResults, int firstResult) {
        return findFichatecnicaEntities(false, maxResults, firstResult);
    }

    private List<Fichatecnica> findFichatecnicaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Fichatecnica.class));
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

    public Fichatecnica findFichatecnica(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Fichatecnica.class, id);
        } finally {
            em.close();
        }
    }

    public int getFichatecnicaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Fichatecnica> rt = cq.from(Fichatecnica.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
