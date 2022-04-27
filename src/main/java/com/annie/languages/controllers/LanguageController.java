package com.annie.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.annie.languages.models.Language;
import com.annie.languages.services.LanguageService;

@Controller
public class LanguageController {
	@Autowired
	private LanguageService languageService;
	
	// Redirect
	@RequestMapping("/")
	public String redirect() {
		return "redirect:/languages";
	}
	
	// Display: language list and new form
	@GetMapping("/languages")
	public String languages(@ModelAttribute("language") 
							Language language, Model model) {		
		List<Language> alldaLanguages = languageService.allLanguages();
		model.addAttribute("alldaLanguages", alldaLanguages);
		
		return "index.jsp";
	}
	
	// Action: process add language
	@PostMapping("/languages")
	public String create(@Valid @ModelAttribute("language") Language language,
						BindingResult result, Model model) {
		if(result.hasErrors()) {
			List<Language> alldaLanguages = languageService.allLanguages();
			model.addAttribute("alldaLanguages", alldaLanguages);
			return "idex.jsp";
		} else {
			languageService.createLanguage(language);
			return "redirect:/languages";
		}
	}
	// Display: edit 
	@GetMapping("/languages/edit/{id}")
	public String showEdit(@PathVariable("id") Long id, Model model) {
		Language language = languageService.findLanguage(id);
		model.addAttribute("language", language);
		return "edit.jsp";
	}
	
	
	// Action: process update
	@PutMapping("/languages/{id}")
	public String update(@Valid @ModelAttribute("language") Language language,
							BindingResult result) {
		if(result.hasErrors()) {
			return "edit.jsp";
		} else {
			languageService.updateLanguage(language);
			return "redirect:/languages";
		}
	}
	// Action: Delete
	@DeleteMapping("/languages/{id}")
	public String delete(@PathVariable("id") Long id) {
		languageService.deleteLanguage(id);
		return "redirect:/languages";
	}
	
	//Display: Read One
	@GetMapping("/languages/{id}")
	public String showOne(@PathVariable("id") Long id, Model model) {
		Language language = languageService.findLanguage(id);
		model.addAttribute("language", language);
		return "showOne.jsp";
	}
	
	
	
	
	
	
	
	
	
}
