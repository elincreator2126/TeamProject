package com.project.test;


import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MainController {
	@Autowired
	NaverService naverService;
	@Autowired
	HHserviceImpl hhService;
	
	@RequestMapping("/postupload")
	public String uploadform() {
		return "/main/postupload";
	}
	
	@RequestMapping(value="/saveImage", method=RequestMethod.POST)
	@ResponseBody
	public String saveImage(MultipartFile file) throws IOException{
		String filename = file.getOriginalFilename();
		System.out.println(filename);
		//서버 저장 경로 설정
		String savePath="c:/upload/";
		//저장할 경로와 파일 이름 완성
		File savefile = new File(savePath + filename);
		//서버 저장
		file.transferTo(savefile);
		return "{\"data\":\"저장했습니다!\"}";
	}
	@RequestMapping(value="/saveData", method=RequestMethod.POST)
	@ResponseBody
	public String saveData(String id, String content, String image, String hashtag) {
		System.out.println(id + "|"+ content + "|"+ image + "|"+ hashtag);
		PostVO pvo = new PostVO();
		pvo.setId(id);
		pvo.setContents(content);
		pvo.setImagepath(image);
		pvo.setHashtag(hashtag);
		hhService.insertPostData(pvo);
		return "{\"data\":\"포스트 저장 완료\"}";
	}
	
	
	@RequestMapping(value="/getODjson", method=RequestMethod.POST)
	@ResponseBody
	public String uploadresult(MultipartFile file) throws IOException {
		String filename = file.getOriginalFilename();
		//서버 저장 경로 설정
		String savePath="c:/upload/";
		//저장할 경로와 파일 이름 완성
		File savefile = new File(savePath + filename);
		//서버 저장
		file.transferTo(savefile);
		
		String odResult = naverService.getObjectDetectionService(filename);
		String cfrResult = naverService.getCFRService(filename);
		System.out.println(filename +":" + odResult);
		System.out.println(cfrResult);
		
		return filename +"|" + odResult + "|" + cfrResult; 
	}
	
	@RequestMapping("/")
	public String main() {
		return "main/main";
	}

	@RequestMapping("/login")
	public String login() {
		return "login/main";
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public String loginService(String id, String password) {
		String result = "";
		UserVO user = hhService.getOneUser(id);
		if(user != null) {
			if(user.getPassword().equals(password)) {
				result = "{\"data\":\"로그인 성공!\", \"user\":\""+user.getId()+"\"}";
			}
			else {
				result = "{\"data\":\"잘못된 비밀번호 입니다!\"}";
			}
		}
		else {
			result = "{\"data\":\"없는 아이디 입니다!\"}";
		}
		
		return result;
	}
	
	@RequestMapping("/login/signup")
	public String signup() {
		return "login/signup";
	}
	@RequestMapping(value="/login/signup", method=RequestMethod.POST)
	@ResponseBody
	public String signupService(String id, String name, String email, String password, String telephone) {
		UserVO user = new UserVO();
		user.setId(id);
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setTelephone(telephone);

		hhService.insertUserData(user);
		return "{\"data\":\"유저 저장 완료\"}";
	}
	
	
	/* 프로필 */ 
	
	@RequestMapping("/profile")
	public String profile() {
		return "profile/main";
	}
	
	@RequestMapping(value="/saveProfileImage", method=RequestMethod.GET)
	public String uploadprofileimageform() {
		return "/profile/main";
	}

		@RequestMapping(value="/saveProfileImage", method=RequestMethod.POST)
		@ResponseBody
		public String saveProfileImage(MultipartFile file) throws IOException{
			String filename = file.getOriginalFilename();
			System.out.println(filename);
			//서버 저장 경로 설정
			String savePath="c:/profile/";
			//저장할 경로와 파일 이름 완성
			File savefile = new File(savePath + filename);
			//서버 저장
			file.transferTo(savefile);
			System.out.println("파일을 저장했습니다.");
			return "{\"filename\":\""+filename+"\"}";
		}
	
	@RequestMapping("/profile/editform")
	public String editform() {
		return "profile/editform";
	}

	@RequestMapping("/profile/imageform")
	public String imageform() {
		return "profile/imageform";
	}
 
	
	
	// 중복 방지를 위해 블록처리
//	@RequestMapping("/search")
//	public String search() {
//		return "search/main";
//	}

}
