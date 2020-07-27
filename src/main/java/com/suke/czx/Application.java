package com.suke.czx;

import com.suke.czx.common.utils.ServerUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Slf4j
@EnableSwagger2
@SpringBootApplication
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
		log.info("==================X-SpringBoot启动成功================");
		log.info("==================当前项目目录：{}================",System.getProperty("user.dir"));
		ServerUtils.startServer();
		log.info("==================配置服务启动成功================");
	}
}
