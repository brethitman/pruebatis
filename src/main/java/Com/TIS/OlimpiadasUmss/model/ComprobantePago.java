package Com.TIS.OlimpiadasUmss.model;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;

@Entity
public class ComprobantePago {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String numeroComprobante;
    private String nombrePagador;
    private Date fechaPago;
    @OneToOne
    private Inscripcion inscripcion;

    public ComprobantePago() {
    }

    public ComprobantePago(Date fechaPago, Long id, Inscripcion inscripcion, String nombrePagador, String numeroComprobante) {
        this.fechaPago = fechaPago;
        this.id = id;
        this.inscripcion = inscripcion;
        this.nombrePagador = nombrePagador;
        this.numeroComprobante = numeroComprobante;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNumeroComprobante() {
        return numeroComprobante;
    }

    public void setNumeroComprobante(String numeroComprobante) {
        this.numeroComprobante = numeroComprobante;
    }

    public String getNombrePagador() {
        return nombrePagador;
    }

    public void setNombrePagador(String nombrePagador) {
        this.nombrePagador = nombrePagador;
    }

    public Date getFechaPago() {
        return fechaPago;
    }

    public void setFechaPago(Date fechaPago) {
        this.fechaPago = fechaPago;
    }

    public Inscripcion getInscripcion() {
        return inscripcion;
    }

    public void setInscripcion(Inscripcion inscripcion) {
        this.inscripcion = inscripcion;
    }

   
    
}