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
import model.entities.Pedido;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import model.controllers.exceptions.IllegalOrphanException;
import model.controllers.exceptions.NonexistentEntityException;
import model.entities.Estado;
import model.entities.Fichatecnica;

/**
 *
 * @author CHELLI BONITA
 */
public class EstadoJpaController implements Serializable {

    public EstadoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Estado estado) {
        if (estado.getPedidoList() == null) {
            estado.setPedidoList(new ArrayList<Pedido>());
        }
        if (estado.getFichatecnicaList() == null) {
            estado.setFichatecnicaList(new ArrayList<Fichatecnica>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Pedido> attachedPedidoList = new ArrayList<Pedido>();
            for (Pedido pedidoListPedidoToAttach : estado.getPedidoList()) {
                pedidoListPedidoToAttach = em.getReference(pedidoListPedidoToAttach.getClass(), pedidoListPedidoToAttach.getIdPedido());
                attachedPedidoList.add(pedidoListPedidoToAttach);
            }
            estado.setPedidoList(attachedPedidoList);
            List<Fichatecnica> attachedFichatecnicaList = new ArrayList<Fichatecnica>();
            for (Fichatecnica fichatecnicaListFichatecnicaToAttach : estado.getFichatecnicaList()) {
                fichatecnicaListFichatecnicaToAttach = em.getReference(fichatecnicaListFichatecnicaToAttach.getClass(), fichatecnicaListFichatecnicaToAttach.getIdFicha());
                attachedFichatecnicaList.add(fichatecnicaListFichatecnicaToAttach);
            }
            estado.setFichatecnicaList(attachedFichatecnicaList);
            em.persist(estado);
            for (Pedido pedidoListPedido : estado.getPedidoList()) {
                Estado oldIdEstadoOfPedidoListPedido = pedidoListPedido.getIdEstado();
                pedidoListPedido.setIdEstado(estado);
                pedidoListPedido = em.merge(pedidoListPedido);
                if (oldIdEstadoOfPedidoListPedido != null) {
                    oldIdEstadoOfPedidoListPedido.getPedidoList().remove(pedidoListPedido);
                    oldIdEstadoOfPedidoListPedido = em.merge(oldIdEstadoOfPedidoListPedido);
                }
            }
            for (Fichatecnica fichatecnicaListFichatecnica : estado.getFichatecnicaList()) {
                Estado oldIdEstadoOfFichatecnicaListFichatecnica = fichatecnicaListFichatecnica.getIdEstado();
                fichatecnicaListFichatecnica.setIdEstado(estado);
                fichatecnicaListFichatecnica = em.merge(fichatecnicaListFichatecnica);
                if (oldIdEstadoOfFichatecnicaListFichatecnica != null) {
                    oldIdEstadoOfFichatecnicaListFichatecnica.getFichatecnicaList().remove(fichatecnicaListFichatecnica);
                    oldIdEstadoOfFichatecnicaListFichatecnica = em.merge(oldIdEstadoOfFichatecnicaListFichatecnica);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Estado estado) throws IllegalOrphanException, NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Estado persistentEstado = em.find(Estado.class, estado.getIdEstado());
            List<Pedido> pedidoListOld = persistentEstado.getPedidoList();
            List<Pedido> pedidoListNew = estado.getPedidoList();
            List<Fichatecnica> fichatecnicaListOld = persistentEstado.getFichatecnicaList();
            List<Fichatecnica> fichatecnicaListNew = estado.getFichatecnicaList();
            List<String> illegalOrphanMessages = null;
            for (Pedido pedidoListOldPedido : pedidoListOld) {
                if (!pedidoListNew.contains(pedidoListOldPedido)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Pedido " + pedidoListOldPedido + " since its idEstado field is not nullable.");
                }
            }
            for (Fichatecnica fichatecnicaListOldFichatecnica : fichatecnicaListOld) {
                if (!fichatecnicaListNew.contains(fichatecnicaListOldFichatecnica)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Fichatecnica " + fichatecnicaListOldFichatecnica + " since its idEstado field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            List<Pedido> attachedPedidoListNew = new ArrayList<Pedido>();
            for (Pedido pedidoListNewPedidoToAttach : pedidoListNew) {
                pedidoListNewPedidoToAttach = em.getReference(pedidoListNewPedidoToAttach.getClass(), pedidoListNewPedidoToAttach.getIdPedido());
                attachedPedidoListNew.add(pedidoListNewPedidoToAttach);
            }
            pedidoListNew = attachedPedidoListNew;
            estado.setPedidoList(pedidoListNew);
            List<Fichatecnica> attachedFichatecnicaListNew = new ArrayList<Fichatecnica>();
            for (Fichatecnica fichatecnicaListNewFichatecnicaToAttach : fichatecnicaListNew) {
                fichatecnicaListNewFichatecnicaToAttach = em.getReference(fichatecnicaListNewFichatecnicaToAttach.getClass(), fichatecnicaListNewFichatecnicaToAttach.getIdFicha());
                attachedFichatecnicaListNew.add(fichatecnicaListNewFichatecnicaToAttach);
            }
            fichatecnicaListNew = attachedFichatecnicaListNew;
            estado.setFichatecnicaList(fichatecnicaListNew);
            estado = em.merge(estado);
            for (Pedido pedidoListNewPedido : pedidoListNew) {
                if (!pedidoListOld.contains(pedidoListNewPedido)) {
                    Estado oldIdEstadoOfPedidoListNewPedido = pedidoListNewPedido.getIdEstado();
                    pedidoListNewPedido.setIdEstado(estado);
                    pedidoListNewPedido = em.merge(pedidoListNewPedido);
                    if (oldIdEstadoOfPedidoListNewPedido != null && !oldIdEstadoOfPedidoListNewPedido.equals(estado)) {
                        oldIdEstadoOfPedidoListNewPedido.getPedidoList().remove(pedidoListNewPedido);
                        oldIdEstadoOfPedidoListNewPedido = em.merge(oldIdEstadoOfPedidoListNewPedido);
                    }
                }
            }
            for (Fichatecnica fichatecnicaListNewFichatecnica : fichatecnicaListNew) {
                if (!fichatecnicaListOld.contains(fichatecnicaListNewFichatecnica)) {
                    Estado oldIdEstadoOfFichatecnicaListNewFichatecnica = fichatecnicaListNewFichatecnica.getIdEstado();
                    fichatecnicaListNewFichatecnica.setIdEstado(estado);
                    fichatecnicaListNewFichatecnica = em.merge(fichatecnicaListNewFichatecnica);
                    if (oldIdEstadoOfFichatecnicaListNewFichatecnica != null && !oldIdEstadoOfFichatecnicaListNewFichatecnica.equals(estado)) {
                        oldIdEstadoOfFichatecnicaListNewFichatecnica.getFichatecnicaList().remove(fichatecnicaListNewFichatecnica);
                        oldIdEstadoOfFichatecnicaListNewFichatecnica = em.merge(oldIdEstadoOfFichatecnicaListNewFichatecnica);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = estado.getIdEstado();
                if (findEstado(id) == null) {
                    throw new NonexistentEntityException("The estado with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws IllegalOrphanException, NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Estado estado;
            try {
                estado = em.getReference(Estado.class, id);
                estado.getIdEstado();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The estado with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<Pedido> pedidoListOrphanCheck = estado.getPedidoList();
            for (Pedido pedidoListOrphanCheckPedido : pedidoListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Estado (" + estado + ") cannot be destroyed since the Pedido " + pedidoListOrphanCheckPedido + " in its pedidoList field has a non-nullable idEstado field.");
            }
            List<Fichatecnica> fichatecnicaListOrphanCheck = estado.getFichatecnicaList();
            for (Fichatecnica fichatecnicaListOrphanCheckFichatecnica : fichatecnicaListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Estado (" + estado + ") cannot be destroyed since the Fichatecnica " + fichatecnicaListOrphanCheckFichatecnica + " in its fichatecnicaList field has a non-nullable idEstado field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            em.remove(estado);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Estado> findEstadoEntities() {
        return findEstadoEntities(true, -1, -1);
    }

    public List<Estado> findEstadoEntities(int maxResults, int firstResult) {
        return findEstadoEntities(false, maxResults, firstResult);
    }

    private List<Estado> findEstadoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Estado.class));
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

    public Estado findEstado(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Estado.class, id);
        } finally {
            em.close();
        }
    }

    public int getEstadoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Estado> rt = cq.from(Estado.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
