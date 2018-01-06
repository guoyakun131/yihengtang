package com.yihengtang.yihengtang;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;


//MyBatis 支持
@MapperScan("com.yihengtang.yihengtang.dao")
@SpringBootApplication
public class YihengtangApplication extends SpringBootServletInitializer{

	public static void main(String[] args) {
		SpringApplication.run(YihengtangApplication.class, args);
	}
	 @Override
	    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	        return application.sources(YihengtangApplication.class);
	    }
}
