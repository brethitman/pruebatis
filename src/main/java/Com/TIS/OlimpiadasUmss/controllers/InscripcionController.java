package Com.TIS.OlimpiadasUmss.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import Com.TIS.OlimpiadasUmss.model.Inscripcion;
import Com.TIS.OlimpiadasUmss.service.InscripcionService;

@RestController
@RequestMapping("/inscripciones")
public class InscripcionController {

    @Autowired
    private InscripcionService inscripcionService;

    // Crear una inscripción (POST)
    @PostMapping
    public ResponseEntity<Inscripcion> crearInscripcion(@RequestBody Inscripcion inscripcion) {
        Inscripcion nuevaInscripcion = inscripcionService.crearInscripcion(inscripcion);
        return new ResponseEntity<>(nuevaInscripcion, HttpStatus.CREATED);
    }

    // Obtener todas las inscripciones (GET)
    @GetMapping
    public ResponseEntity<List<Inscripcion>> obtenerTodasLasInscripciones() {
        List<Inscripcion> inscripciones = inscripcionService.obtenerTodasLasInscripciones();
        return new ResponseEntity<>(inscripciones, HttpStatus.OK);
    }

    // Obtener una inscripción por ID (GET)
    @GetMapping("/{id}")
    public ResponseEntity<Inscripcion> obtenerInscripcionPorId(@PathVariable Long id) {
        Optional<Inscripcion> inscripcion = inscripcionService.obtenerInscripcionPorId(id);
        return inscripcion.map(value -> new ResponseEntity<>(value, HttpStatus.OK))
                          .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    // Actualizar una inscripción (PUT)
    @PutMapping("/{id}")
    public ResponseEntity<Inscripcion> actualizarInscripcion(@PathVariable Long id, @RequestBody Inscripcion inscripcion) {
        Optional<Inscripcion> inscripcionActualizada = inscripcionService.actualizarInscripcion(id, inscripcion);
        return inscripcionActualizada.map(value -> new ResponseEntity<>(value, HttpStatus.OK))
                                     .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    // Eliminar una inscripción (DELETE)
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminarInscripcion(@PathVariable Long id) {
        boolean eliminado = inscripcionService.eliminarInscripcion(id);
        return eliminado ? new ResponseEntity<>(HttpStatus.NO_CONTENT) : new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
}
