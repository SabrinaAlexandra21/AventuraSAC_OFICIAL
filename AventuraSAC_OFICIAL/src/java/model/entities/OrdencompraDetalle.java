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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author CHELLI BONITA
 */
@Entity
@Table(name = "ordencompra_detalle")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OrdencompraDetalle.findAll", query = "SELECT o FROM OrdencompraDetalle o")
    , @NamedQuery(name = "OrdencompraDetalle.findByItem", query = "SELECT o FROM OrdencompraDetalle o WHERE o.item = :item")
    , @NamedQuery(name = "OrdencompraDetalle.findByCantidad", query = "SELECT o FROM OrdencompraDetalle o WHERE o.cantidad = :cantidad")})
public class OrdencompraDetalle implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "Item")
    private String item;
    @Column(name = "Cantidad")
    private Integer cantidad;
    @OneToMany(mappedBy = "item")
    private List<Movimientoalmacen> movimientoalmacenList;
    @JoinColumn(name = "idInsumo", referencedColumnName = "idInsumo")
    @ManyToOne
    private Insumohilo idInsumo;
    @JoinColumn(name = "idOrdenCompra", referencedColumnName = "idOrdenCompra")
    @ManyToOne
    private Ordencompra idOrdenCompra;

    public OrdencompraDetalle() {
    }

    public OrdencompraDetalle(String item) {
        this.item = item;
    }

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    @XmlTransient
    public List<Movimientoalmacen> getMovimientoalmacenList() {
        return movimientoalmacenList;
    }

    public void setMovimientoalmacenList(List<Movimientoalmacen> movimientoalmacenList) {
        this.movimientoalmacenList = movimientoalmacenList;
    }

    public Insumohilo getIdInsumo() {
        return idInsumo;
    }

    public void setIdInsumo(Insumohilo idInsumo) {
        this.idInsumo = idInsumo;
    }

    public Ordencompra getIdOrdenCompra() {
        return idOrdenCompra;
    }

    public void setIdOrdenCompra(Ordencompra idOrdenCompra) {
        this.idOrdenCompra = idOrdenCompra;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (item != null ? item.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrdencompraDetalle)) {
            return false;
        }
        OrdencompraDetalle other = (OrdencompraDetalle) object;
        if ((this.item == null && other.item != null) || (this.item != null && !this.item.equals(other.item))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.entities.OrdencompraDetalle[ item=" + item + " ]";
    }
    
}
