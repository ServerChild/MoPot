package com.mopot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@EnableJpaAuditing
@SpringBootApplication
public class MopotApplication {

	public static void main(String[] args) {
		SpringApplication.run(MopotApplication.class, args);
	}

}
