package com.mopot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mopot.domain.Reply;

@Repository
public interface ReplyRepository extends JpaRepository<Reply, Long>{
	List<Reply> findAllByRefCnoOrderByReNoDesc(Long conNo);
}
