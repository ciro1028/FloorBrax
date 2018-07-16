package com.ciroamaral.service;

import java.util.List;

import com.ciroamaral.entity.Subdivision;

public interface SubdivisionService {

	public List<Subdivision> getSubdivisions();
	public Subdivision getSubdivision(String field, String value);
	public void saveSubdivision(Subdivision subdivision);
	public void deleteSubdivision(Subdivision subdivision);
}
