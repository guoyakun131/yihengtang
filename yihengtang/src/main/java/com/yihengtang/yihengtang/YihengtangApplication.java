package com.yihengtang.yihengtang;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


//MyBatis 支持
@MapperScan("com.yihengtang.yihengtang.dao")
@SpringBootApplication
public class YihengtangApplication {

	public static void main(String[] args) {
		SpringApplication.run(YihengtangApplication.class, args);
	}
	
}
