package com.mopot.domain;

import java.time.LocalDateTime;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import jakarta.persistence.*;
import lombok.*;

@Data
@NoArgsConstructor
@Entity
@EntityListeners(AuditingEntityListener.class)
public class Member {
	@Id
	@SequenceGenerator (
			name="MemberSEQ",
			sequenceName="Member_SEQ",
			allocationSize = 1
			)
	@GeneratedValue(generator="MemberSEQ")
	@Column(name="user_no")
	private Long userNo;
	
	@NonNull
	@Column(name="user_id")
	private String userId;
	
	@NonNull
	@Column(name="user_pw")
	private String userPw;
	
	@NonNull
	@Column(name="user_name")
	private String userName;
	
	@NonNull
	@Column(name="user_email")
	private String userEmail;
	
	@Column(name="user_nick")
	private String userNick;
	
	@Column(name="user_gender")
	private String userGender;
	
	@Column(name="user_bithday")
	private String userBithday;
	
	@CreatedDate
	@Column(name="user_createdate")
	private LocalDateTime userCreate;
	
	@LastModifiedDate
	@Column(name="user_modifydate")
	private LocalDateTime userModify;

	
	public Member(@NonNull String userId, @NonNull String userPw, @NonNull String userName, String userNick,
			String userGender, String userBithday) {
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userNick = userNick;
		this.userGender = userGender;
		this.userBithday = userBithday;
	}
}
