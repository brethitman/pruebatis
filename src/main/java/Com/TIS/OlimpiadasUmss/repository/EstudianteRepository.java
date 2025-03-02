package Com.TIS.OlimpiadasUmss.repository;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import Com.TIS.OlimpiadasUmss.model.Estudiante;

public interface EstudianteRepository extends JpaRepository<Estudiante, Long> {
    Optional<Estudiante> findByCi(String ci);
}