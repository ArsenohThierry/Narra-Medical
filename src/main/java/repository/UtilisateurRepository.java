package main.java.repository;

import main.java.models.Utilisateur;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UtilisateurRepository extends JpaRepository<Utilisateur, Integer> {
    Optional<Utilisateur> findByLogin(String login);
    Optional<Utilisateur> findByLoginAndPassword(String login, String password);
}
