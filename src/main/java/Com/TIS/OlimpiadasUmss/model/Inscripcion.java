package Com.TIS.OlimpiadasUmss.model;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class Inscripcion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    private Estudiante estudiante;
    @ManyToOne
    private AreaCompetencia areaCompetencia;
    @ManyToOne
    private Tutor tutor;
    private String comprobantePago;
    private Date fechaInscripcion;
    @Enumerated(EnumType.STRING)
    private EstadoPago estadoPago;

    public Inscripcion() {
    }

    public Inscripcion(AreaCompetencia areaCompetencia, String comprobantePago, EstadoPago estadoPago, Estudiante estudiante, Date fechaInscripcion, Long id, Tutor tutor) {
        this.areaCompetencia = areaCompetencia;
        this.comprobantePago = comprobantePago;
        this.estadoPago = estadoPago;
        this.estudiante = estudiante;
        this.fechaInscripcion = fechaInscripcion;
        this.id = id;
        this.tutor = tutor;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Estudiante getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(Estudiante estudiante) {
        this.estudiante = estudiante;
    }

    public AreaCompetencia getAreaCompetencia() {
        return areaCompetencia;
    }

    public void setAreaCompetencia(AreaCompetencia areaCompetencia) {
        this.areaCompetencia = areaCompetencia;
    }

    public Tutor getTutor() {
        return tutor;
    }

    public void setTutor(Tutor tutor) {
        this.tutor = tutor;
    }

    public String getComprobantePago() {
        return comprobantePago;
    }

    public void setComprobantePago(String comprobantePago) {
        this.comprobantePago = comprobantePago;
    }

    public Date getFechaInscripcion() {
        return fechaInscripcion;
    }

    public void setFechaInscripcion(Date fechaInscripcion) {
        this.fechaInscripcion = fechaInscripcion;
    }

    public EstadoPago getEstadoPago() {
        return estadoPago;
    }

    public void setEstadoPago(EstadoPago estadoPago) {
        this.estadoPago = estadoPago;
    }

    
}