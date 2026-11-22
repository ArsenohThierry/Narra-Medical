package main.java.controllers;

import java.util.List;

import org.springframework.context.ApplicationContext;

import main.java.models.Patient;
import main.java.service.PatientService;
import narrafw.annotation.Controller;
import narrafw.annotation.UrlMapping;
import narrafw.dto.ModelAndView;

@Controller 
public class PatientController {

    @UrlMapping(value="/patients", method = "GET")
    public ModelAndView listePatients(ApplicationContext ctx){
        List<Patient> patients = ctx.getBean(PatientService.class).findAll();

        ModelAndView model = new ModelAndView();
        model.setView("patients/listePatients");
        model.addObject("patients", patients);
        
        return model;
    }
    
}