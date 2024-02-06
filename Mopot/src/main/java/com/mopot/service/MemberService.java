package com.mopot.service;

import java.util.List;
import java.util.Optional;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mopot.domain.Member;
import com.mopot.repository.MemberRepository;

import lombok.NonNull;

@Service
public class MemberService {

	@Autowired
	MemberRepository memberRepository;

	// 회원가입 - 회원 등록
	public Member InsertMember(Member member) {
		return memberRepository.save(member);
	}

	// ID 중복 체크
	public boolean idCheck(String id) {
		return memberRepository.existsByUserId(id);
	}

	// 로그인
	public Member loginMember(Member member) {
		Optional<Member> loginUser = memberRepository.findByUserId(member.getUserId());
		
		if(loginUser.isPresent()) {
			return loginUser.get();
		} else {
			return loginUser.orElse(null);
		}
	}


	// 마이 페이지 - 회원 정보 수정
	@Transactional
	public Member updateMyPage(Member member) {
		Optional<Member> rMember = memberRepository.findByUserId(member.getUserId());



		return memberRepository.save(member);
	}

	// 마이 페이지 - 닉네임 중복 체크
	public boolean nickCheck(String nick) {
		return memberRepository.existsByUserNick(nick);
	}

	// 마이 페이지 - loginUser 정보 가져오기
	public List<Member> loginUserInfo(String userId) {
		return memberRepository.findAll();
	}
}
