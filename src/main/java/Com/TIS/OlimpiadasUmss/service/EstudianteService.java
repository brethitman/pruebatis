package Com.TIS.OlimpiadasUmss.service;

import org.springframework.beans.factory.annotation.Autowired;
import  org.springframework.stereotype.Service;

import Com.TIS.OlimpiadasUmss.model.Estudiante;
import Com.TIS.OlimpiadasUmss.repository.EstudianteRepository;

@Service
public class EstudianteService {

    @Autowired
    private EstudianteRepository estudianteRepository;

    public Estudiante crearEstudiante(Estudiante estudiante) {
        return estudianteRepository.save(estudiante);
    }
}