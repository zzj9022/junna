package com.xuanxing.admin.controller.home;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.xuanxing.core.home.model.City;
import com.xuanxing.core.home.service.CityService;

import net.sf.json.JSONObject;

@RestController
@RequestMapping("/city")
public class APIController {

    @Resource
    private CityService cityService;

    @RequestMapping("/hello/{id}")
    public JSONObject getCity(@PathVariable(value = "id",required = false)Integer id){
        JSONObject result = new JSONObject();
        if(id==null){
            result.accumulate("errMessage","请填写参数");
            return result;
        }
        City city = cityService.selectById(id);
        result.accumulate("data",city);
        return  result;
    }
    
    @RequestMapping("/list")
	public JSONObject listSystemLog(Model model, City record,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "10") int limit) {
    	JSONObject result = new JSONObject();
		PageBounds pb = new PageBounds(page, limit);
		if (page <= 0)
			page = 1;
		if (limit <= 0)
			limit = 10;
		List<City> pageList = cityService.queryPage(record, pb);
		result.accumulate("systemLogList", pageList);
		return result;
	}

}
