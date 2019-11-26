/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author CHELLI BONITA
 */
@Entity
@Table(name = "cotizacion_detalle")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DetalleCotizaci\u00f3n.findAll", query = "SELECT d FROM DetalleCotizaci\u00f3n d")
    , @NamedQuery(name = "DetalleCotizaci\u00f3n.findByIdDetalleCotizacion", query = "SELECT d FROM DetalleCotizaci\u00f3n d WHERE d.idDetalleCotizacion = :idDetalleCotizacion")
    , @NamedQuery(name = "DetalleCotizaci\u00f3n.findByIdCotizacion", query = "SELECT d FROM DetalleCotizaci\u00f3n d WHERE d.idCotizacion = :idCotizacion")
    , @NamedQuery(name = "DetalleCotizaci\u00f3n.findByIdDetallePedido", query = "SELECT d FROM DetalleCotizaci\u00f3n d WHERE d.idDetallePedido = :idDetallePedido")
    , @NamedQuery(name = "DetalleCotizaci\u00f3n.findByPrecio", query = "SELECT d FROM DetalleCotizaci\u00f3n d WHERE d.precio = :precio")
    , @NamedQuery(name = "DetalleCotizaci\u00f3n.findBySubTotal", query = "SELECT d FROM DetalleCotizaci\u00f3n d WHERE d.subTotal = :subTotal")})
public class DetalleCotización implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idDetalleCotizacion")
    private Integer idDetalleCotizacion;
    @Column(name = "idCotizacion")
    private Integer idCotizacion;
    @Column(name = "idDetallePedido")
    private Integer idDetallePedido;
    @Basic(optional = false)
    @Column(name = "Precio")
    private double precio;
    @Basic(optional = false)
    @Column(name = "SubTotal")
    private double subTotal;

    public DetalleCotización() {
    }

    public DetalleCotización(Integer idDetalleCotizacion) {
        this.idDetalleCotizacion = idDetalleCotizacion;
    }

    public DetalleCotización(Integer idDetalleCotizacion, double precio, double subTotal) {
        this.idDetalleCotizacion = idDetalleCotizacion;
        this.precio = precio;
        this.subTotal = subTotal;
    }

    public Integer getIdDetalleCotizacion() {
        return idDetalleCotizacion;
    }

    public void setIdDetalleCotizacion(Integer idDetalleCotizacion) {
        this.idDetalleCotizacion = idDetalleCotizacion;
    }

    public Integer getIdCotizacion() {
        return idCotizacion;
    }

    public void setIdCotizacion(Integer idCotizacion) {
        this.idCotizacion = idCotizacion;
    }

    public Integer getIdDetallePedido() {
        return idDetallePedido;
    }

    public void setIdDetallePedido(Integer idDetallePedido) {
        this.idDetallePedido = idDetallePedido;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDetalleCotizacion != null ? idDetalleCotizacion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DetalleCotización)) {
            return false;
        }
        DetalleCotización other = (DetalleCotización) object;
        if ((this.idDetalleCotizacion == null && other.idDetalleCotizacion != null) || (this.idDetalleCotizacion != null && !this.idDetalleCotizacion.equals(other.idDetalleCotizacion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.entities.DetalleCotizaci\u00f3n[ idDetalleCotizacion=" + idDetalleCotizacion + " ]";
    }
    
}
