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
import model.entities.Fichatecnica;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import model.controllers.exceptions.NonexistentEntityException;
import model.entities.Tipoprenda;

/**
 *
 * @author Administrador
 */
public class TipoprendaJpaController implements Serializable {

    public TipoprendaJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Tipoprenda tipoprenda) {
        if (tipoprenda.getFichatecnicaList() == null) {
            tipoprenda.setFichatecnicaList(new ArrayList<Fichatecnica>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Fichatecnica> attachedFichatecnicaList = new ArrayList<Fichatecnica>();
            for (Fichatecnica fichatecnicaListFichatecnicaToAttach : tipoprenda.getFichatecnicaList()) {
                fichatecnicaListFichatecnicaToAttach = em.getReference(fichatecnicaListFichatecnicaToAttach.getClass(), fichatecnicaListFichatecnicaToAttach.getIdFicha());
                attachedFichatecnicaList.add(fichatecnicaListFichatecnicaToAttach);
            }
            tipoprenda.setFichatecnicaList(attachedFichatecnicaList);
            em.persist(tipoprenda);
            for (Fichatecnica fichatecnicaListFichatecnica : tipoprenda.getFichatecnicaList()) {
                Tipoprenda oldIdTipoPrendaOfFichatecnicaListFichatecnica = fichatecnicaListFichatecnica.getIdTipoPrenda();
                fichatecnicaListFichatecnica.setIdTipoPrenda(tipoprenda);
                fichatecnicaListFichatecnica = em.merge(fichatecnicaListFichatecnica);
                if (oldIdTipoPrendaOfFichatecnicaListFichatecnica != null) {
                    oldIdTipoPrendaOfFichatecnicaListFichatecnica.getFichatecnicaList().remove(fichatecnicaListFichatecnica);
                    oldIdTipoPrendaOfFichatecnicaListFichatecnica = em.merge(oldIdTipoPrendaOfFichatecnicaListFichatecnica);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Tipoprenda tipoprenda) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Tipoprenda persistentTipoprenda = em.find(Tipoprenda.class, tipoprenda.getIdTipoPrenda());
            List<Fichatecnica> fichatecnicaListOld = persistentTipoprenda.getFichatecnicaList();
            List<Fichatecnica> fichatecnicaListNew = tipoprenda.getFichatecnicaList();
            List<Fichatecnica> attachedFichatecnicaListNew = new ArrayList<Fichatecnica>();
            for (Fichatecnica fichatecnicaListNewFichatecnicaToAttach : fichatecnicaListNew) {
                fichatecnicaListNewFichatecnicaToAttach = em.getReference(fichatecnicaListNewFichatecnicaToAttach.getClass(), fichatecnicaListNewFichatecnicaToAttach.getIdFicha());
                attachedFichatecnicaListNew.add(fichatecnicaListNewFichatecnicaToAttach);
            }
            fichatecnicaListNew = attachedFichatecnicaListNew;
            tipoprenda.setFichatecnicaList(fichatecnicaListNew);
            tipoprenda = em.merge(tipoprenda);
            for (Fichatecnica fichatecnicaListOldFichatecnica : fichatecnicaListOld) {
                if (!fichatecnicaListNew.contains(fichatecnicaListOldFichatecnica)) {
                    fichatecnicaListOldFichatecnica.setIdTipoPrenda(null);
                    fichatecnicaListOldFichatecnica = em.merge(fichatecnicaListOldFichatecnica);
                }
            }
            for (Fichatecnica fichatecnicaListNewFichatecnica : fichatecnicaListNew) {
                if (!fichatecnicaListOld.contains(fichatecnicaListNewFichatecnica)) {
                    Tipoprenda oldIdTipoPrendaOfFichatecnicaListNewFichatecnica = fichatecnicaListNewFichatecnica.getIdTipoPrenda();
                    fichatecnicaListNewFichatecnica.setIdTipoPrenda(tipoprenda);
                    fichatecnicaListNewFichatecnica = em.merge(fichatecnicaListNewFichatecnica);
                    if (oldIdTipoPrendaOfFichatecnicaListNewFichatecnica != null && !oldIdTipoPrendaOfFichatecnicaListNewFichatecnica.equals(tipoprenda)) {
                        oldIdTipoPrendaOfFichatecnicaListNewFichatecnica.getFichatecnicaList().remove(fichatecnicaListNewFichatecnica);
                        oldIdTipoPrendaOfFichatecnicaListNewFichatecnica = em.merge(oldIdTipoPrendaOfFichatecnicaListNewFichatecnica);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = tipoprenda.getIdTipoPrenda();
                if (findTipoprenda(id) == null) {
                    throw new NonexistentEntityException("The tipoprenda with id " + id + " no longer exists.");
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
            Tipoprenda tipoprenda;
            try {
                tipoprenda = em.getReference(Tipoprenda.class, id);
                tipoprenda.getIdTipoPrenda();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The tipoprenda with id " + id + " no longer exists.", enfe);
            }
            List<Fichatecnica> fichatecnicaList = tipoprenda.getFichatecnicaList();
            for (Fichatecnica fichatecnicaListFichatecnica : fichatecnicaList) {
                fichatecnicaListFichatecnica.setIdTipoPrenda(null);
                fichatecnicaListFichatecnica = em.merge(fichatecnicaListFichatecnica);
            }
            em.remove(tipoprenda);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Tipoprenda> findTipoprendaEntities() {
        return findTipoprendaEntities(true, -1, -1);
    }

    public List<Tipoprenda> findTipoprendaEntities(int maxResults, int firstResult) {
        return findTipoprendaEntities(false, maxResults, firstResult);
    }

    private List<Tipoprenda> findTipoprendaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Tipoprenda.class));
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

    public Tipoprenda findTipoprenda(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Tipoprenda.class, id);
        } finally {
            em.close();
        }
    }

    public int getTipoprendaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Tipoprenda> rt = cq.from(Tipoprenda.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
