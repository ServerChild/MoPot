package com.mopot.service;

import com.mopot.repository.PotRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PotService {

    @Autowired
    PotRepository potRepository;
}
