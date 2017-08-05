package com.xuanxing.core.home.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.xuanxing.core.home.dao.CityMapper;
import com.xuanxing.core.home.model.City;
import com.xuanxing.core.home.service.CityService;

@Service
public class CityServiceImpl implements CityService {

    @Autowired
    private CityMapper cityMapper;

    @Override
	public City selectById(int id) {
		return cityMapper.selectByPrimaryKey(id);
	}

	@Override
	public PageList<City> queryPage(City city, PageBounds pb) {
		return cityMapper.selectByPrimaryKeySelective(city,pb);
	}

}
