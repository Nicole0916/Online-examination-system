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
 * �ɼ�ͳ�ƿ�����
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
	 * �ɼ�ͳ��ҳ��
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/exam_stats",method=RequestMethod.GET)
	public ModelAndView stats(ModelAndView model){
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("offset", 0);
		queryMap.put("pageSize", 99999);
		model.addObject("examList", examService.findList(queryMap)); // ��ѯ���� �������ݸ������б�
		model.setViewName("stats/exam_stats");
		return model;
	}

	/**
	 * ͳ��ѧ�����쳣��Ϊ������
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/illegal_action",method=RequestMethod.GET)
	public ModelAndView illegalAction(ModelAndView model, HttpServletRequest request){
		Map<String, Object> queryMap = new HashMap<String, Object>();
		// ����id ��������
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
	 * ��ѯ�������Ե�ͳ����Ϣ��Ӧ��������ʵ��������ͨ������
	 * @param examId
	 * @return
	 */
	@RequestMapping(value="/get_exam_stats",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getExamStats(Long examId){
		Map<String, Object> ret = new HashMap<String, Object>();
		if(examId == null){
			ret.put("type", "error");
			ret.put("msg", "ѡ��Ҫͳ�ƵĿ�����Ϣ��");
			return ret;
		}
		Map<String, Object> examCounting = examPaperService.getExamCounting(examId);
		ret.put("type", "success");
		ret.put("msg", "ͳ�Ƴɹ���");
		ret.put("examCounting",examCounting); // ��ѯ�õ�������ͳ����Ϣ
		return ret;
	}

	/**
	 * ���ݿ�����Ϣ��ȡ���Գɼ���
	 * @param examId
	 * @return
	 */
	@RequestMapping(value="/get_stats",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getStats(Long examId){
		Map<String, Object> ret = new HashMap<String, Object>();
		if(examId == null){
			ret.put("type", "error");
			ret.put("msg", "ѡ��Ҫͳ�ƵĿ�����Ϣ��");
			return ret;
		}
		List<Map<String, Object>> examStats = examPaperService.getExamStats(examId);
		ret.put("type", "success");
		ret.put("msg", "ͳ�Ƴɹ���");
		ret.put("studentList", getListByMap(examStats, "sname")); // ѧ������
		ret.put("studentScore", getListByMap(examStats, "finalScore")); // ѧ���÷�
		ret.put("examStats",examStats); // ��ѯ�õ�������ͳ����Ϣ
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
