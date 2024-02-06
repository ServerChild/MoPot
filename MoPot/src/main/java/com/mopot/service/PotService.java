package com.mopot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mopot.repository.PotRepository;

@Service
public class PotService {
	
	@Autowired
	PotRepository potRepository;
}
