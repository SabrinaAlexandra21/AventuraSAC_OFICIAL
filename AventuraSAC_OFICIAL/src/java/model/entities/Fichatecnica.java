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
 * @author Sabrina Bv
 */
@Entity
@Table(name = "fichatecnica")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Fichatecnica.findAll", query = "SELECT f FROM Fichatecnica f")
    , @NamedQuery(name = "Fichatecnica.findByIdFicha", query = "SELECT f FROM Fichatecnica f WHERE f.idFicha = :idFicha")
    , @NamedQuery(name = "Fichatecnica.findByDescripcion", query = "SELECT f FROM Fichatecnica f WHERE f.descripcion = :descripcion")
    , @NamedQuery(name = "Fichatecnica.findByModelo", query = "SELECT f FROM Fichatecnica f WHERE f.modelo = :modelo")
    , @NamedQuery(name = "Fichatecnica.findByEtiqueta", query = "SELECT f FROM Fichatecnica f WHERE f.etiqueta = :etiqueta")
    , @NamedQuery(name = "Fichatecnica.findByColores", query = "SELECT f FROM Fichatecnica f WHERE f.colores = :colores")
    , @NamedQuery(name = "Fichatecnica.findByEmpaque", query = "SELECT f FROM Fichatecnica f WHERE f.empaque = :empaque")})
public class Fichatecnica implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idFicha")
    private Integer idFicha;
    @Basic(optional = false)
    @Column(name = "Descripcion")
    private String descripcion;
    @Basic(optional = false)
    @Column(name = "Modelo")
    private String modelo;
    @Basic(optional = false)
    @Column(name = "Etiqueta")
    private String etiqueta;
    @Basic(optional = false)
    @Column(name = "Colores")
    private String colores;
    @Basic(optional = false)
    @Column(name = "Empaque")
    private String empaque;
    @JoinColumn(name = "idTipo", referencedColumnName = "idTipo")
    @ManyToOne
    private Tipotela idTipo;
    @OneToMany(mappedBy = "idFicha")
    private List<PedidoDetalle> pedidoDetalleList;

    public Fichatecnica() {
    }

    public Fichatecnica(Integer idFicha) {
        this.idFicha = idFicha;
    }

    public Fichatecnica(Integer idFicha, String descripcion, String modelo, String etiqueta, String colores, String empaque) {
        this.idFicha = idFicha;
        this.descripcion = descripcion;
        this.modelo = modelo;
        this.etiqueta = etiqueta;
        this.colores = colores;
        this.empaque = empaque;
    }

    public Integer getIdFicha() {
        return idFicha;
    }

    public void setIdFicha(Integer idFicha) {
        this.idFicha = idFicha;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getEtiqueta() {
        return etiqueta;
    }

    public void setEtiqueta(String etiqueta) {
        this.etiqueta = etiqueta;
    }

    public String getColores() {
        return colores;
    }

    public void setColores(String colores) {
        this.colores = colores;
    }

    public String getEmpaque() {
        return empaque;
    }

    public void setEmpaque(String empaque) {
        this.empaque = empaque;
    }

    public Tipotela getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(Tipotela idTipo) {
        this.idTipo = idTipo;
    }

    @XmlTransient
    public List<PedidoDetalle> getPedidoDetalleList() {
        return pedidoDetalleList;
    }

    public void setPedidoDetalleList(List<PedidoDetalle> pedidoDetalleList) {
        this.pedidoDetalleList = pedidoDetalleList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idFicha != null ? idFicha.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Fichatecnica)) {
            return false;
        }
        Fichatecnica other = (Fichatecnica) object;
        if ((this.idFicha == null && other.idFicha != null) || (this.idFicha != null && !this.idFicha.equals(other.idFicha))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.entities.Fichatecnica[ idFicha=" + idFicha + " ]";
    }
    
}
