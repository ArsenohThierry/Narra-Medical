package main.java.repository;

import main.java.models.Patient;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PatientRepository extends JpaRepository<Patient, String> {
    // findAll(), save(), findById(), deleteById(), count()... sont générés automatiquement

    // Bonus : requête dérivée, toujours sans SQL :
    // List<Patient> findByNom(String nom);
}