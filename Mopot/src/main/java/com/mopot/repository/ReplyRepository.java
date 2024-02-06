package com.mopot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mopot.domain.Reply;

@Repository
public interface ReplyRepository extends JpaRepository<Reply, Long>{

}
