package com.devpro.shop14.service;

import org.springframework.stereotype.Service;

import com.devpro.shop14.entity.Contact;

@Service
public class ContactService extends BaseService<Contact>{

	@Override
	protected Class<Contact> clazz() {
		return Contact.class;
	}

}
