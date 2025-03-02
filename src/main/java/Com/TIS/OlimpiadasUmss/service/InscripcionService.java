package Com.TIS.OlimpiadasUmss.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Com.TIS.OlimpiadasUmss.model.Inscripcion;
import Com.TIS.OlimpiadasUmss.repository.InscripcionRepository;

@Service
public class InscripcionService {

    @Autowired
    private InscripcionRepository inscripcionRepository;

    // Crear una inscripción
    public Inscripcion crearInscripcion(Inscripcion inscripcion) {
        return inscripcionRepository.save(inscripcion);
    }

    // Obtener todas las inscripciones
    public List<Inscripcion> obtenerTodasLasInscripciones() {
        return inscripcionRepository.findAll();
    }

    // Obtener una inscripción por ID
    public Optional<Inscripcion> obtenerInscripcionPorId(Long id) {
        return inscripcionRepository.findById(id);
    }

    // Actualizar una inscripción
    public Optional<Inscripcion> actualizarInscripcion(Long id, Inscripcion nuevaInscripcion) {
        return inscripcionRepository.findById(id).map(inscripcionExistente -> {
            inscripcionExistente.setEstudiante(nuevaInscripcion.getEstudiante());
            inscripcionExistente.setAreaCompetencia(nuevaInscripcion.getAreaCompetencia());
            inscripcionExistente.setTutor(nuevaInscripcion.getTutor());
            inscripcionExistente.setComprobantePago(nuevaInscripcion.getComprobantePago());
            inscripcionExistente.setFechaInscripcion(nuevaInscripcion.getFechaInscripcion());
            inscripcionExistente.setEstadoPago(nuevaInscripcion.getEstadoPago());
            return inscripcionRepository.save(inscripcionExistente);
        });
    }

    // Eliminar una inscripción
    public boolean eliminarInscripcion(Long id) {
        if (inscripcionRepository.existsById(id)) {
            inscripcionRepository.deleteById(id);
            return true;
        }
        return false;
    }
}
