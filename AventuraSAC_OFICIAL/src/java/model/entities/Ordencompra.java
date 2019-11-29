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
 * @author Sabrina Bv
 */
@Entity
@Table(name = "ordencompra")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ordencompra.findAll", query = "SELECT o FROM Ordencompra o")
    , @NamedQuery(name = "Ordencompra.findByIdOrdenCompra", query = "SELECT o FROM Ordencompra o WHERE o.idOrdenCompra = :idOrdenCompra")
    , @NamedQuery(name = "Ordencompra.findByFechaEmision", query = "SELECT o FROM Ordencompra o WHERE o.fechaEmision = :fechaEmision")
    , @NamedQuery(name = "Ordencompra.findByFechaEntrega", query = "SELECT o FROM Ordencompra o WHERE o.fechaEntrega = :fechaEntrega")})
public class Ordencompra implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idOrdenCompra")
    private Integer idOrdenCompra;
    @Basic(optional = false)
    @Column(name = "FechaEmision")
    private String fechaEmision;
    @Basic(optional = false)
    @Column(name = "FechaEntrega")
    private String fechaEntrega;
    @OneToMany(mappedBy = "idOrdenCompra")
    private List<OrdencompraDetalle> ordencompraDetalleList;

    public Ordencompra() {
    }

    public Ordencompra(Integer idOrdenCompra) {
        this.idOrdenCompra = idOrdenCompra;
    }

    public Ordencompra(Integer idOrdenCompra, String fechaEmision, String fechaEntrega) {
        this.idOrdenCompra = idOrdenCompra;
        this.fechaEmision = fechaEmision;
        this.fechaEntrega = fechaEntrega;
    }

    public Integer getIdOrdenCompra() {
        return idOrdenCompra;
    }

    public void setIdOrdenCompra(Integer idOrdenCompra) {
        this.idOrdenCompra = idOrdenCompra;
    }

    public String getFechaEmision() {
        return fechaEmision;
    }

    public void setFechaEmision(String fechaEmision) {
        this.fechaEmision = fechaEmision;
    }

    public String getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(String fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    @XmlTransient
    public List<OrdencompraDetalle> getOrdencompraDetalleList() {
        return ordencompraDetalleList;
    }

    public void setOrdencompraDetalleList(List<OrdencompraDetalle> ordencompraDetalleList) {
        this.ordencompraDetalleList = ordencompraDetalleList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idOrdenCompra != null ? idOrdenCompra.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ordencompra)) {
            return false;
        }
        Ordencompra other = (Ordencompra) object;
        if ((this.idOrdenCompra == null && other.idOrdenCompra != null) || (this.idOrdenCompra != null && !this.idOrdenCompra.equals(other.idOrdenCompra))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.entities.Ordencompra[ idOrdenCompra=" + idOrdenCompra + " ]";
    }
    
}
