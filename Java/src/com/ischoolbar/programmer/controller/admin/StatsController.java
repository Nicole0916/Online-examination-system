package com.ischoolbar.programmer.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ischoolbar.programmer.service.admin.ExamPaperService;
import com.ischoolbar.programmer.service.admin.ExamService;

import javax.servlet.http.HttpServletRequest;

/**
 * 成绩统计控制器
 * @author Administrator
 *
 */
@RequestMapping("/admin/stats")
@Controller
public class StatsController {

	@Autowired
	private ExamService examService;
	@Autowired
	private ExamPaperService examPaperService;
	/**
	 * 成绩统计页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/exam_stats",method=RequestMethod.GET)
	public ModelAndView stats(ModelAndView model){
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("offset", 0);
		queryMap.put("pageSize", 99999);
		model.addObject("examList", examService.findList(queryMap)); // 查询考试 返回数据给下拉列表
		model.setViewName("stats/exam_stats");
		return model;
	}

	/**
	 * 统计学生的异常行为检测情况
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/illegal_action",method=RequestMethod.GET)
	public ModelAndView illegalAction(ModelAndView model, HttpServletRequest request){
		Map<String, Object> queryMap = new HashMap<String, Object>();
		// 考试id 考生姓名
		String examId = request.getParameter("examId");
		String sname = request.getParameter("sname");
		queryMap.put("examId", examId);
		queryMap.put("sname", sname);
		Map<String, Object> detail = examPaperService.getStuExamDetail(queryMap);
		model.addObject("detail", detail);
		model.setViewName("stats/illegal_action");
		return model;
	}

	/**
	 * 查询本场考试的统计信息：应考人数、实考人数、通过人数
	 * @param examId
	 * @return
	 */
	@RequestMapping(value="/get_exam_stats",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getExamStats(Long examId){
		Map<String, Object> ret = new HashMap<String, Object>();
		if(examId == null){
			ret.put("type", "error");
			ret.put("msg", "选择要统计的考试信息！");
			return ret;
		}
		Map<String, Object> examCounting = examPaperService.getExamCounting(examId);
		ret.put("type", "success");
		ret.put("msg", "统计成功！");
		ret.put("examCounting",examCounting); // 查询得到的所有统计信息
		return ret;
	}

	/**
	 * 根据考试信息查取考试成绩单
	 * @param examId
	 * @return
	 */
	@RequestMapping(value="/get_stats",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getStats(Long examId){
		Map<String, Object> ret = new HashMap<String, Object>();
		if(examId == null){
			ret.put("type", "error");
			ret.put("msg", "选择要统计的考试信息！");
			return ret;
		}
		List<Map<String, Object>> examStats = examPaperService.getExamStats(examId);
		ret.put("type", "success");
		ret.put("msg", "统计成功！");
		ret.put("studentList", getListByMap(examStats, "sname")); // 学生姓名
		ret.put("studentScore", getListByMap(examStats, "finalScore")); // 学生得分
		ret.put("examStats",examStats); // 查询得到的所有统计信息
		return ret;
	}

	private List<Object> getListByMap(List<Map<String, Object>> mapList,String key){
		List<Object> ret = new ArrayList<Object>();
		for(Map<String, Object> map:mapList){
			ret.add(map.get(key));
		}
		return ret;
	}
}
