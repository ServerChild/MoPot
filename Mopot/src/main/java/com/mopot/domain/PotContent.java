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
public class PotContent {
	@Id
	@SequenceGenerator (
			name="PotContentSEQ",
			sequenceName="PotContent_SEQ",
			allocationSize = 1
			)
	@GeneratedValue(generator="PotContentSEQ")
	@Column(name="pot_no")
	private Long potNo;
	
	@Column(name="pot_title")
	private String potTitle;
	
	@Column(name="pot_detail")
	private String potDetail;
	
	@Column(name="pot_writer")
	private String potWirter;
	
	@CreatedDate
	@Column(name="pot_create_date")
	private LocalDateTime potCreate;
	
	@LastModifiedDate
	@Column(name="pot_modify_date")
	private LocalDateTime potModify;
	
	@Column(name="pot_tag")
	private String potTag;
	
	@Column(name="pot_category")
	private String potCategory;
	
	@Column(name="pot_status")
	private int potStatus;
	
}
