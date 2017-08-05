package com.xuanxing.core.home.service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.xuanxing.core.home.model.City;

public interface CityService {
    City selectById(int id);

    PageList<City> queryPage(City record, PageBounds pb);
}
