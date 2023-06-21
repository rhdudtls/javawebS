package com.spring.javawebS.service;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javawebS.dao.PdsDAO;
import com.spring.javawebS.vo.PdsVO;

@Service
public class PdsServiceImpl implements PdsService {

	@Autowired
	PdsDAO pdsDAO;

	@Override
	public List<PdsVO> getPdsList(int startIndexNo, int pageSize, String part) {
		return pdsDAO.getPdsList(startIndexNo, pageSize, part);
	}

	@Override
	public void setPdsInput(PdsVO vo, MultipartHttpServletRequest mFile) {
		try {
			List<MultipartFile> fileList = mFile.getFiles("file");
			
			for(MultipartFile file : fileList) {
				String oFileName = file.getOriginalFilename();
				String sFileName = saveFileName(oFileName);
			}
			
			
			pdsDAO.setPdsInput(vo);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 화일명 중복방지를 위한 저장파일명 만들기
	private String saveFileName(String oFileName) {
		String fileName = "";
		
		Calendar cal = Calendar.getInstance();
		fileName += cal.get(Calendar.YEAR);
		fileName += cal.get(Calendar.MONTH);
		fileName += cal.get(Calendar.DATE);
		fileName += cal.get(Calendar.HOUR);
		fileName += cal.get(Calendar.MINUTE);
		fileName += cal.get(Calendar.SECOND);
		fileName += cal.get(Calendar.MILLISECOND);
		
		return fileName;
	}
	
}
