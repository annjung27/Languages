package com.annie.languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.annie.languages.models.Language;
import com.annie.languages.repositories.LanguageRepo;

@Service
public class LanguageService {
	// adding the ExpenseRepository as a dependency
		@Autowired
		private LanguageRepo languageRepo;
		
		// READ ALL
		public List<Language> allLanguages() {
			return languageRepo.findAll();
		}
		
		// CREATE 
		public Language createLanguage(Language language) {
			return languageRepo.save(language);
		}
		
//		// READ ONE by id
		public Language findLanguage(Long id) {
			Optional<Language> optionalLanguage = languageRepo.findById(id);
			if(optionalLanguage.isPresent()) {
				return optionalLanguage.get();
			}else {
				return null;
			}
		}
		
		// UPDATE ONE
		public Language updateLanguage(Language language) {
			return languageRepo.save(language);
		}
		
		// DELETE ONE
		public void deleteLanguage(Long id) {
			languageRepo.deleteById(id);
		}	
}
