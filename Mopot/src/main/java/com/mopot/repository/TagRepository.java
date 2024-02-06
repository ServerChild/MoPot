package com.mopot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mopot.domain.Tag;

@Repository
public interface TagRepository extends JpaRepository<Tag, Long>{

}
