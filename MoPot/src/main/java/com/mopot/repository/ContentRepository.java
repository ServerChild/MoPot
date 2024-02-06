package com.mopot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mopot.domain.Content;

@Repository
public interface ContentRepository extends JpaRepository<Content, Long> {

}
