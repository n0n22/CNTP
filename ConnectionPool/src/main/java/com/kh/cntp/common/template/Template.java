package com.kh.cntp.common.template;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class Template {
	
	
	
	// 실제 넘어온 파일의 이름을 변경해서 서버에 업로드
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		// 파일명 수정 작업 후 서버에 업로드 시키기("image.png" => 20221238123123.png)
		
		String originName = upfile.getOriginalFilename();
		
		// "20221226104530"(년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 12321 (5자리 랜덤값)
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		// 확장자 
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 변경된 파일명
		String changeName = "cntp_" + currentTime + ranNum + ext;
		
		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/upfiles/");
		
		try {
			// transferTo : 실제로 파일을 서버에 업로드해주는 메소드
			upfile.transferTo(new File(savePath + changeName)); 								
		} catch (IOException e) { // 컴파일러가 체크 : checkedException
			e.printStackTrace();
		}	
		
		return changeName;
	}
	
	
	
	
	

}
