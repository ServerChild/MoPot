package com.mopot.repository;

import com.mopot.domain.PotContent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PotRepository extends JpaRepository<PotContent, Long> {

}
