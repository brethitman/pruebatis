package Com.TIS.OlimpiadasUmss.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import Com.TIS.OlimpiadasUmss.model.Inscripcion;

public interface InscripcionRepository extends JpaRepository<Inscripcion, Long> {
}