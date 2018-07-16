package com.ciroamaral.service;

import java.io.InputStream;

import org.springframework.stereotype.Service;

import com.ciroamaral.entity.HandleFiles;

@Service
public class UploadFileServiceImpl implements UploadFileService {
	
	@Override
	public void uploadFile(String name, InputStream file) {
		
		try {

			HandleFiles hf = new HandleFiles();
			hf.uploadFile(name, file);
			
		} catch (Exception e){
			System.err.println(e.getMessage());
		}
		

	}

}
