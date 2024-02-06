package com.mopot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mopot.domain.Member;

import lombok.NonNull;

import java.util.Optional;

@Repository
public interface MemberRepository extends JpaRepository<Member, Long>{

	boolean existsByUserId(String id);

	boolean existsByUserNick(String nick);

	Optional<Member> findByUserId(@NonNull String userId);
}
