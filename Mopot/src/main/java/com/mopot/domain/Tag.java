package com.mopot.domain;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import jakarta.persistence.*;
import jakarta.persistence.Id;
import lombok.*;

@Data
@NoArgsConstructor
@Entity
public class Tag {
	@Id
	@SequenceGenerator (
			name="TagSEQ",
			sequenceName="Tag_SEQ",
			allocationSize = 1
			)
	@GeneratedValue(generator="TagSEQ")
	@Column(name="tag_no")
	private Long tagNo;
	
	@Column(name="tag_name")
	private String tagName;
}
