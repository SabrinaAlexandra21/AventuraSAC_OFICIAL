/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Administrador
 */
@Entity
@Table(name = "tipoprenda")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tipoprenda.findAll", query = "SELECT t FROM Tipoprenda t")
    , @NamedQuery(name = "Tipoprenda.findByIdTipoPrenda", query = "SELECT t FROM Tipoprenda t WHERE t.idTipoPrenda = :idTipoPrenda")
    , @NamedQuery(name = "Tipoprenda.findByNombre", query = "SELECT t FROM Tipoprenda t WHERE t.nombre = :nombre")})
public class Tipoprenda implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idTipoPrenda")
    private Integer idTipoPrenda;
    @Basic(optional = false)
    @Column(name = "Nombre")
    private String nombre;
    @OneToMany(mappedBy = "idTipoPrenda")
    private List<Fichatecnica> fichatecnicaList;

    public Tipoprenda() {
    }

    public Tipoprenda(Integer idTipoPrenda) {
        this.idTipoPrenda = idTipoPrenda;
    }

    public Tipoprenda(Integer idTipoPrenda, String nombre) {
        this.idTipoPrenda = idTipoPrenda;
        this.nombre = nombre;
    }

    public Integer getIdTipoPrenda() {
        return idTipoPrenda;
    }

    public void setIdTipoPrenda(Integer idTipoPrenda) {
        this.idTipoPrenda = idTipoPrenda;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @XmlTransient
    public List<Fichatecnica> getFichatecnicaList() {
        return fichatecnicaList;
    }

    public void setFichatecnicaList(List<Fichatecnica> fichatecnicaList) {
        this.fichatecnicaList = fichatecnicaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipoPrenda != null ? idTipoPrenda.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tipoprenda)) {
            return false;
        }
        Tipoprenda other = (Tipoprenda) object;
        if ((this.idTipoPrenda == null && other.idTipoPrenda != null) || (this.idTipoPrenda != null && !this.idTipoPrenda.equals(other.idTipoPrenda))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.entities.Tipoprenda[ idTipoPrenda=" + idTipoPrenda + " ]";
    }
    
}
