package main.java.controllers;

import org.springframework.context.ApplicationContext;

import main.java.models.Utilisateur;
import main.java.service.UtilisateurService;
import narrafw.annotation.Controller;
import narrafw.annotation.UrlMapping;
import narrafw.dto.ModelAndView;
import narrafw.dto.Session;

@Controller 
public class LoginController {
    
@UrlMapping(value = "/login", method = "POST")
    public ModelAndView login(
            String login,
            String password,
            ApplicationContext ctx,
            Session s) {

        ModelAndView model = new ModelAndView();

        UtilisateurService utilisateurService =
                ctx.getBean(UtilisateurService.class);

        Utilisateur utilisateur = utilisateurService.findByLogin(login);

        if (utilisateur == null) {
            // Login incorrect
            model.addObject("erreur", "Identifiant incorrect.");
            model.setView("index");
        }
        else if (!password.equals(utilisateur.getPassword())) {
            // Mot de passe incorrect
            model.addObject("erreur", "Mot de passe incorrect.");
            model.setView("index");
        }
        else {
            // Authentification réussie
            s.set("utilisateur", utilisateur);
            s.set("login", login);
            model.setView("medecin/dashboard");
        }

        return model;
    }

    @UrlMapping(value = "/logout", method = "POST")
    public ModelAndView logout(Session s) {
        s.remove("utilisateur");
        s.remove("login");
        s.remove("role");

        ModelAndView model = new ModelAndView();
        model.setView("index");
        return model;
    }
}
