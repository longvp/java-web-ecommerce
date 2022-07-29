package com.devpro.shop14.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.entity.Contact;
import com.devpro.shop14.service.ContactService;

@Controller
public class AdminContactController extends BaseController{

	@Autowired
	ContactService contactService;

	@RequestMapping(path = "/admin/contact", method = RequestMethod.GET)
	public String Default(Model model) {
		List<Contact> contacts = contactService.findAll();
		model.addAttribute("contacts", contacts);
		return "manager/contact/contact";
	}

// ------------------------ ADD CONTACT ---------------------------------	
	@RequestMapping(path = "/admin/add-contact", method = RequestMethod.GET)
	public String DefaultAddContact(Model model) {

		Contact contact = new Contact();
		model.addAttribute("contact", contact);

		return "manager/contact/add-contact";
	}

	@RequestMapping(path = "/admin/add-contact", method = RequestMethod.POST)
	public String AddContact(Model model, @ModelAttribute("contact") Contact contact) {

		contact.setStatus(true);
		contactService.saveOrUpdate(contact);

		return "redirect:/admin/contact";
	}

// ------------------------ EDIT CONTACT ---------------------------------
	@RequestMapping(path = "/admin/edit-contact/{contactId}", method = RequestMethod.GET)
	public String editCategory(Model model, @PathVariable("contactId") int contactId) {

		Contact contact = contactService.getById(contactId);
		model.addAttribute("contact", contact);

		return "manager/contact/add-contact";
	}
	
// ------------------------ DELETE CONTACT ---------------------------------
	@RequestMapping(path = "/admin/delete-contact/{contactId}", method = RequestMethod.GET)
	public String deleteContact(Model model, @PathVariable("contactId") int contactId) {
		contactService.deleteById(contactId);

		return "redirect:/admin/contact";
	}

}
