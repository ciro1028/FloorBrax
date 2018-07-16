package com.ciroamaral.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ciroamaral.dao.SubdivisionDAO;
import com.ciroamaral.entity.Subdivision;

@Service
public class SubdivisionServiceImpl implements SubdivisionService {

	@Autowired
	private SubdivisionDAO subdivisionDAO;
	
	@Override
	@Transactional
	public List<Subdivision> getSubdivisions() {
		
		return subdivisionDAO.getSubdivisions();
	}

	@Override
	@Transactional
	public Subdivision getSubdivision(String field, String value) {

		return subdivisionDAO.getSubdivision(field, value);
	}

	@Override
	@Transactional
	public void saveSubdivision(Subdivision subdivision) {
		subdivisionDAO.saveSubdivision(subdivision);

	}

	@Override
	@Transactional
	public void deleteSubdivision(Subdivision subdivision) {
		subdivisionDAO.deleteSubdivision(subdivision);
	}

}
