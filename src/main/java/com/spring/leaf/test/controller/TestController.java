package com.spring.leaf.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.leaf.test.service.ITestService;

// STS와 MySQL 연동 여부를 테스트 하기 위한 컨트롤러 단 입니다.
/*
	테스트 해보시는 법 :
	
	1. 옆 창에서 src/main/resources 폴더 안에 있는 mappers를 열어본다.
	2. TestMapper.xml 파일을 연다.
	3. INSERT INTO test(test_msg)
	   VALUES('.......');
	      쿼리에서 '........' 부분을 본인이 작성할 아무 메시지로 바꿔서 저장한다.
	4. 프로젝트를 우클릭 한 후, Run on Server를 실행하면
	      뜨는 브라우저에서 주소창에 localhost/test 라고 작성한다.
	5. 완료되었다는 페이지가 뜬다.
	6. STS로 돌아와서 콘솔창을 살펴본다.
	7. INFO : jdbc.sqlonly - INSERT INTO test(test_msg) VALUES('OOO'); 라는 문구가 떠있다면 성공
	8. MySQL Workbench 를 실행해서 조장이 저장해둔 서버 MySQL로 접속한다.
	9. SELECT * FROM test; 쿼리를 사용하여 테이블 안에 정보가 정상적으로 저장되었는지 확인해본다.
    10. 모두 화이팅입니다!!
*/

@Controller
public class TestController {

	@Autowired
	private ITestService service;
	
	@GetMapping("/test")
	public String InsertTest() {
		service.InsertTest();
		
		return "/test/test";
	}
	
}
