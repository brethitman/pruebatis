package Com.TIS.OlimpiadasUmss.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import Com.TIS.OlimpiadasUmss.model.Tutor;

public interface TutorRepository extends JpaRepository<Tutor, Long> {
}