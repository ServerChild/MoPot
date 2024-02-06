package com.mopot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mopot.domain.PotContent;

@Repository
public interface PotRepository extends JpaRepository<PotContent, Long> {

}
