package com.mopot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mopot.repository.TagRepository;

@Service
public class TagService {
	
	@Autowired
	TagRepository tagRepository;
}
