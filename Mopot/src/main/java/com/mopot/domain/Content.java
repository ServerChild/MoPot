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
public class Content {
	@Id
	@SequenceGenerator (
			name="ContentSEQ",
			sequenceName="Content_SEQ",
			allocationSize = 1
			)
	@GeneratedValue(generator="ContentSEQ")
	@Column(name="con_no")
	private Long conNo;
	
	@Column(name="con_title")
	private String conTitle;
	
	@Column(name="con_detail")
	private String conDetail;
	
	@Column(name="con_writer")
	private String conWirter;
	
	@CreatedDate
	@Column(name="con_create_date")
	private LocalDateTime conCreate;
	
	@LastModifiedDate
	@Column(name="con_modify_date")
	private LocalDateTime conModify;
	
	@Column(name="con_tag")
	private String conTag;
	
	@Column(name="con_category")
	private String conCategory;
	
}