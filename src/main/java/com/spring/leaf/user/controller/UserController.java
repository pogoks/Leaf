package com.spring.leaf.user.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.spring.leaf.user.command.UserProfileVO;
import com.spring.leaf.user.command.UserVO;
import com.spring.leaf.user.service.IUserService;
import com.spring.leaf.util.MailService;


// 일반회원 유저 컨트롤러 : 2022-07-27 생성

@Controller
@RequestMapping("/user")
public class UserController {

	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	
	// 일반회원 유저 서비스 연결
	@Autowired
	private IUserService service;
	
	
	// 이메일 인증을 위한 서비스 연결
	@Autowired
	private MailService mailService;
	
	
	// 회원가입 페이지 이동 요청
	@GetMapping("/userRegist")
	public String userRegist() {
		logger.info("/user/userRegist : GET (회원가입 페이지 이동)");
		
		return "/register/register";
	}
	
	
	// 회원가입 처리 요청
	@PostMapping("/userRegist")
	public String userRegist(UserVO vo, RedirectAttributes ra) {
		logger.info("/user/userRegist : POST (회원가입 처리 요청)");
		
		service.userRegist(vo);
		
		ra.addFlashAttribute("msg", "성공적으로 회원가입 되었습니다.");
		
		return "redirect:/";
	}
	
	
	// 사용자 아이디 중복체크 요청
	@PostMapping("/userIDCheck")
	@ResponseBody
	public String userIDCheck(@RequestBody String userID) {
		logger.info("/user/userIDCheck : POST (회원가입 아이디 중복체크 처리 요청)");
		
		int check = service.userIDCheck(userID);
		
		if(check == 0) {
			return "checkSuccess";
		} else {
			return "checkFail";
		}
	}
	
	
	// 사용자 이메일 중복체크 요청
	@PostMapping("/userEmailCheck")
	@ResponseBody
	public String userEmailCheck(@RequestParam Map<String, Object> emails) {
		logger.info("/user/userEmailCheck : POST (이메일 중복체크 처리 요청)");
		
		int check = service.userEmailCheck(emails);
		
		if(check == 0) {
			return "emailCheckSuccess";
		} else {
			return "emailCheckFail";
		}
	}
	
	
	// 사용자 이메일 인증 요청
	@GetMapping("/userEmailAuth")
	@ResponseBody
	public String userEmailAuth(@RequestParam("email") String email) {
		logger.info("/user/userEmailAuth : GET (이메일 인증 요청)");
		
		logger.info("인증 이메일 : " + email);
		
		return mailService.joinEmail(email);
	}
	
	
	// 사용자 로그인 요청
	@PostMapping("/userLogin")
	public String userLogin(String userID, String userPW, Model model) {
		logger.info("/user/userLogin : POST (로그인 요청)");
		
		// 로그인 한 사용자의 정보를 가져온다.
		UserVO vo = service.userGetInfo(userID);
		UserProfileVO pvo = service.userProfileGet(vo.getUserNO());
		
		// 가져온 사용자 정보를 인터셉터에게 전달한다.
		model.addAttribute("userLogin", vo);
		// 기져온 사용자의 프로필사진 정보를 인터셉터에게 전달한다.
		model.addAttribute("userProfile", pvo);
		// 가져온 사용자의 비밀번호를 인터셉터에게 전달한다. (비밀번호 비교를 위해)
		model.addAttribute("userPW", userPW);
		
		/* 일반회원 로그인 인터셉터 발동 */
		
		return "home";
	}
	
	
	// 사용자 로그아웃 요청
	@PostMapping("/userLogout")
	@ResponseBody
	public String userLogout(HttpSession session) {
		logger.info("/user/userLogout : POST (사용자 로그아웃 요청)");

		// 로그아웃 시 저장된 사용자 정보와 프로필 사진 정보가 담긴 세션을 지운다.
		session.removeAttribute("user");

		return "logoutSuccess";
	}
	
	
	// 사용자 번호 구하기 요청
	@PostMapping("/userNOGet")
	@ResponseBody
	public int userNOGet() {
		logger.info("/user/userNOGet : POST (가입하고자 하는 사람의 회원 번호 구하는 요청");
		
		int userNO = service.userNOGet();
		
		return userNO;
	}
	
	
	// 사용자 프로필사진 등록 요청
	@PostMapping("/userProfile/{userNO}")
	@ResponseBody
	public String userProfile(@RequestParam("userProfile") MultipartFile profile, @PathVariable("userNO") int userNO) throws Exception {
		logger.info("/user/userProfile : POST (프로필사진 등록 요청)");
		
		// 날짜별로 폴더를 생성해서 파일을 관리한다.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		Date date = new Date();

		String location = sdf.format(date);

		// 저장할 폴더 경로
		String uploadPath = "C:\\userProfile\\" + location;

		File folder = new File(uploadPath);

		// 폴더가 존재하지 않는다면 생성한다.
		if (!folder.exists()) {
			folder.mkdirs();
		}

		// 파일명을 고유한 랜덤 문자로 생성
		UUID uuid = UUID.randomUUID();
		// 랜덤으로 생성된 문자에 있는 - 을 모두 지운다.
		String uuids = uuid.toString().replaceAll("-", "");

		// 사용자가 원래 가지고 있던 원본 파일 명
		String realName = profile.getOriginalFilename();
		// 확장자 추출
		String extention = realName.substring(realName.indexOf("."), realName.length());

		// 고유한 문자와 확장자를 합쳐 새로운 랜덤이름의 파일이름을 만들어준다.
		String name = uuids + extention;

		// 업로드한 파일을 서버 컴퓨터 내의 지정한 경로로 실제 저장
		File saveFile = new File(uploadPath + "\\" + name);

		try {
			profile.transferTo(saveFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 받은 파일의 정보를 UserProfileVO 안에 넣고 데이터베이스에 저장한다.
		UserProfileVO vo = new UserProfileVO();
		vo.setUserProfileFilename(name);
		vo.setUserProfileUploadpath(uploadPath);
		vo.setUserProfileRealname(realName);
		vo.setUserNO(userNO);

		service.userProfile(vo);
		
		
		// 파일을 로컬이 아닌 서버에도 저장한다.
		// SSH 원격접속을 위한 username, ip, port, password
		String username = "leaf";
		String host = "35.203.164.40";
		int port = 22;
		String password = "1q2w3e4r";
		
		Session session = null;
		Channel channel = null;
		
		
		try {
			// 파일을 원격서버로 보내기 위해 JSch 객체를 선언한다. (SFTP)
			JSch jsch = new JSch();
			
			// 세션 객체 생성 (JSch를 이용해 서버에 원격접속을 하기 위해서)
			session = jsch.getSession(username, host, port);
			session.setPassword(password);
			
			// ssh_config에 호스트 key 없이 접속이 가능하도록 property 설정 (이건 잘 모르겠다,. 따로 공부해야 할 듯)
			java.util.Properties config = new java.util.Properties();
			config.put("StrictHostKeyChecking", "no");
			session.setConfig(config);
			
			// 접속 시도
			session.connect();
			
			// SFTP 채널 오픈 및 연결
			channel = session.openChannel("sftp");
			
			// SFTP 접속 시도
			channel.connect();
			
			// 로컬에 저장된 파일과 동일한 파일을 서버 /home/leaf/project 디렉토리 경로로 보낸다.
			// 앞에는 로컬에서 보낼 파일, 뒤에는 서버에서 받을 디렉토리 위치 경로
			ChannelSftp channelSftp = (ChannelSftp) channel;
			channelSftp.put(uploadPath + "\\" + name, "/home/leaf/userProfile");
			
			// 이건 다운로드, 나중에 프로필사진 불러오기 할 때 참고해서 사용하자!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			// 앞에는 서버에서 받아올 파일, 뒤에는 로컬에서 받을 폴더 위치 경로
			//channelSftp.get("/home/leaf/userProfile/" + name, uploadPath + "\\");
			
		} catch(JSchException e) {
			e.printStackTrace();
		} finally {
			// 전송이 완료되면 접속 종료
			if(channel != null) {
				channel.disconnect();
			}
			
			// 전송이 완료되면 접속 종료
			if(session != null) {
				session.disconnect();
			}
		}
		
		return "YesProfile";
	} 
	
	
	// 사용자 프로필사진 없이 등록 요청
	@PostMapping("/userProfileNo/{userNO}")
	@ResponseBody
	public String userProfileNo(@PathVariable("userNO") int userNO) {
		logger.info("/user/userProfileNo : POST (프로필사진 없이 회원가입 요청)");
		
		UserProfileVO vo = new UserProfileVO();
		vo.setUserNO(userNO);
		
		service.userProfile(vo);
		
		return "NoProfile";
	}
	
	
	// 사용자 프로필사진 불러오기 요청
	@GetMapping("/userProfileGet")
	public ResponseEntity<byte[]> userProfileGet(String uploadPath, String fileName) throws Exception {
		logger.info("/user/userProfileGet : GET (프로필사진 불러오기 요청)");
		
		// 파일을 서버에서 다운로드 받아 로컬에도 저장한다.
		// SSH 원격접속을 위한 username, ip, port, password
		String username = "leaf";
		String host = "35.203.164.40";
		int port = 22;
		String password = "1q2w3e4r";
			
		Session session = null;
		Channel channel = null;
				
				
		try {
			// 파일을 원격서버로 보내기 위해 JSch 객체를 선언한다. (SFTP)
			JSch jsch = new JSch();
				
			// 세션 객체 생성 (JSch를 이용해 서버에 원격접속을 하기 위해서)
			session = jsch.getSession(username, host, port);
			session.setPassword(password);
					
			// ssh_config에 호스트 key 없이 접속이 가능하도록 property 설정 (이건 잘 모르겠다,. 따로 공부해야 할 듯)
			java.util.Properties config = new java.util.Properties();
			config.put("StrictHostKeyChecking", "no");
			session.setConfig(config);
					
			// 접속 시도
			session.connect();
				
			// SFTP 채널 오픈 및 연결
			channel = session.openChannel("sftp");
				
			// SFTP 접속 시도
			channel.connect();
			
			// 로컬에 저장된 파일과 동일한 파일을 서버 /home/leaf/project 디렉토리 경로로 보낸다.
			// 앞에는 로컬에서 보낼 파일, 뒤에는 서버에서 받을 디렉토리 위치 경로
			ChannelSftp channelSftp = (ChannelSftp) channel;
				
			// 앞에는 서버에서 받아올 파일, 뒤에는 로컬에서 받을 폴더 위치 경로
			channelSftp.get("/home/leaf/userProfile/" + fileName, uploadPath + "\\");
			
		} catch(JSchException e) {
			e.printStackTrace();
		} finally {
			// 전송이 완료되면 접속 종료
			if(channel != null) {
				channel.disconnect();
			}
				
			// 전송이 완료되면 접속 종료
			if(session != null) {
				session.disconnect();
			}
		}
		
		
		File profile = new File(uploadPath + "\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		// 응답 헤더파일에 여러가지 정보를 담아서 전송하는 것도 가능하다.
		HttpHeaders headers = new HttpHeaders();

		try {
			// probeContentType : 파라미터로 전달받은 파일의 타입을 문자열로 변환해 주는 메소드
			// 사용자에게 보여주고자 하는 데이터가 어떤 파일인지를 검사해서 응답상태 코드를 다르게 리턴할 수도 있다.
			headers.add("Content-Type", Files.probeContentType(profile.toPath()));

			// ResponseEntity<>(응답 객체에 담을 내용, 헤더에 담을 내용, 상태 메세지)
			// FileCopyUtils : 파일 및 스트림 데이터 복사를 위한 간단한 유틸리티 메소드의 집합체
			// file 객체 안에 있는 내용을 복사하여 byte 배열로 변환한 후 바디에 담아 화면에 전달한다.
			// 만약 리턴이 ResponseEntity<byte[]>가 아니라 그냥 byte[]라면 FileCopyUtils.copyToByteArray(file)만 써주면 된다.
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(profile), headers, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}
}
