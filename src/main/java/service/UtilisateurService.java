package main.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import main.java.models.Utilisateur;
import main.java.repository.UtilisateurRepository;

@Service
public class UtilisateurService {

    @Autowired
    private UtilisateurRepository repository;

    public List<Utilisateur> findAll() {
        return repository.findAll();
    }

    public Utilisateur save(Utilisateur utilisateur) {
        return repository.save(utilisateur);
    }

    public Utilisateur findByLogin(String login) {
        return repository.findByLogin(login).orElse(null);
    }

    public Utilisateur findByLoginAndPassword(String login, String password) {
        return repository.findByLoginAndPassword(login, password).orElse(null);
    }

    public Utilisateur findById(int id) {
        return repository.findById(id).orElse(null);
    }
}