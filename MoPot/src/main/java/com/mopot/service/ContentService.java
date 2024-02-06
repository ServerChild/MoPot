package com.mopot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mopot.repository.ContentRepository;

@Service
public class ContentService {
	
	@Autowired
	ContentRepository contentRepository;
}
