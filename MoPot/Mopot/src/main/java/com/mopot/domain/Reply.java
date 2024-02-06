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
public class Reply {
	@Id
	@SequenceGenerator (
			name="ReplySEQ",
			sequenceName="Reply_SEQ",
			allocationSize = 1
			)
	@GeneratedValue(generator="ReplySEQ")
	@Column(name="re_no")
	private Long reNo;
	
	@Column(name="re_detail")
	@NonNull
	private String reDetail;
	
	@CreatedDate
	@Column(name="re_create")
	@NonNull
	private LocalDateTime reCreate;
	
	@LastModifiedDate
	@Column(name="re_modify")
	@NonNull
	private LocalDateTime reModify;
	
}
