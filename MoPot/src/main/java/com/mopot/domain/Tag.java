package com.mopot.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import lombok.Data;
import lombok.NoArgsConstructor;

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
