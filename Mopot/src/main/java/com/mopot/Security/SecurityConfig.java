package com.mopot.Security;

import org.springframework.context.annotation.Bean;
/*import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfiguration {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/myPageInfo").authenticated() // /myPage URL은 인증된 사용자만 접근 허용
                .anyRequest().permitAll() // 다른 모든 요청은 누구나 접근 허용
                .and()
                .formLogin()
                .loginPage("/loginMember") // 로그인 페이지 URL
                .defaultSuccessUrl("/myPageInfo") // 로그인 성공 시 이동할 페이지
                .permitAll()
                .and()
                .logout()
                .logoutUrl("/logout") // 로그아웃 URL
                .logoutSuccessUrl("/")
                .permitAll();
    }
}*/

