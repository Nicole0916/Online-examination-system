package com.ischoolbar.programmer.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ischoolbar.programmer.entity.admin.ExamPaper;
import com.ischoolbar.programmer.entity.admin.ExamPaperAnswer;
import com.ischoolbar.programmer.page.admin.Page;
import com.ischoolbar.programmer.service.admin.ExamPaperAnswerService;
import com.ischoolbar.programmer.service.admin.ExamPaperService;
import com.ischoolbar.programmer.service.admin.ExamService;
import com.ischoolbar.programmer.service.admin.QuestionService;
import com.ischoolbar.programmer.service.admin.StudentService;

/**
 * 试卷评分管理后台控制器
 * @author Administrator
 *
 */
@RequestMapping("/admin/examMarkPaper")
@Controller
public class ExamMarkPaper {
	
	@Autowired
	private ExamPaperAnswerService examPaperAnswerService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private ExamService examService;
	@Autowired
	private QuestionService questionService;
	@Autowired
	private ExamPaperService examPaperService;
	
	/**
	 * 试卷主观题列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("offset", 0);
		queryMap.put("pageSize", 99999);
		queryMap.put("subject", 2);
		model.addObject("examList", examService.findList(queryMap));
		model.addObject("studentList", studentService.findList(queryMap));
		model.addObject("questionList", questionService.findSubjectList(queryMap));
		model.setViewName("examMarkPaper/list");
		return model;
	}
	
	/**
	 * 模糊搜索分页显示列表查询
	 * @param name
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(name="examId",required=false) Long examId,
			@RequestParam(name="studentId",required=false) Long studentId,
			@RequestParam(name="questionId",required=false) Long questionId,
			Page page
			){
		Map<String, Object> ret = new HashMap<String, Object>();
		Map<String, Object> queryMap = new HashMap<String, Object>();
		if(examId != null){
			queryMap.put("examId", examId);
		}
		if(studentId != null){
			queryMap.put("studentId", studentId);
		}
		if(questionId != null){
			queryMap.put("questionId", questionId);
		}
		queryMap.put("isCorrect",2);
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		
		ret.put("rows", examPaperAnswerService.findSubjectList(queryMap));
		ret.put("total", examPaperAnswerService.getSubjectTotal(queryMap));
		
		return ret;
	}
	
	/**
	 * 主观题评分
	 * @param examPaper
	 * @return
	 */
	@RequestMapping(value="editScore",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> editScore(ExamPaperAnswer examPaperAnswer){
		Map<String, String> ret = new HashMap<String, String>();
		
		if(examPaperAnswer == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的评分信息!");
			return ret;
		}
		if(examPaperAnswer.getSubScore() == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的评分!");
			return ret;
		}
		if((examPaperAnswer.getSubScore()>10)|(examPaperAnswer.getSubScore()<0)){
			ret.put("type", "error");
			ret.put("msg", "请给出正确的分数！");
			return ret;
		}if(examPaperAnswerService.editScore(examPaperAnswer) <= 0){
			ret.put("type", "error");
			ret.put("msg", "编辑失败，请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "评分成功!");
		
		System.out.println("id是："+examPaperAnswer.getId());
		ExamPaperAnswer findById = examPaperAnswerService.findById(examPaperAnswer.getId()); //从数据库中拿到这一行记录
		
		//此时，更新subScoreTotal的分数
		Map<String, Object> queryMap = new HashMap<String, Object>();
		Map<String, Object> addMap = new HashMap<String, Object>();
		queryMap.put("examId", findById.getExamId());
		queryMap.put("studentId", findById.getStudentId());
		
		//System.out.println("examId："+ findById.getExamId());//测试
		//System.out.println("studentId："+ findById.getStudentId());//测试
		
		List<ExamPaperAnswer> findScoreListByUser = examPaperAnswerService.findScoreListByUser(queryMap); //拿到这个学生的所有答题信息
		Long subScoreTotal = 0l;
		for(ExamPaperAnswer item:findScoreListByUser) {
			if(item.getIsCorrect()==2) { //如果是主观题
				if(item.getSubScore()!=null) { // 且如果主观题有分数的话
					//System.out.println("该题得分："+ item.getSubScore());
					subScoreTotal = subScoreTotal + item.getSubScore(); // 将主观题分数相加
				}
			}
		}
		//System.out.println("主观题得分为："+subScoreTotal);
		//System.out.println("试卷id为："+findById.getExamPaperId());
		addMap.put("subScoreTotal",subScoreTotal);
		addMap.put("id",findById.getExamPaperId());
		
		ExamPaper examPaper = examPaperService.findById(findById.getExamPaperId());
		
		addMap.put("finalScore", subScoreTotal+examPaper.getScore());  // 计算总得分
		examPaperService.addSubScoreTotal(addMap);
		examPaperService.addFinalScore(addMap);
		//calSubScore(examPaperAnswerService,examPaperAnswer.getExamId(),examPaperAnswer.getStudentId(),examPaperAnswer.getExamPaperId());
		return ret;
	}
	
	
	
	
	
	/**
	 * 主观题计算总分
	 * @param examPaper
	 * @return
	 */
//	private void calSubScore(ExamPaperAnswerService examPaperAnswerService,Long examId,Long studentId,Long id){
//		Map<String, Object> queryMap = new HashMap<String, Object>();
//		Map<String, Object> addMap = new HashMap<String, Object>();
//		queryMap.put("examId", examId);
//		queryMap.put("studentId", studentId);
//		List<ExamPaperAnswer> findScoreListByUser = examPaperAnswerService.findScoreListByUser(queryMap);
//		int subScoreTotal = 0;
//		for(ExamPaperAnswer item:findScoreListByUser) {
//			if(item.getIsCorrect()==2) { //如果是主观题
//				if(item.getSubScore()!=null) { // 且如果主观题有分数的话
//					subScoreTotal += item.getSubScore(); // 将主观题分数相加
//				}
//			}
//		}
//		addMap.put("id",id);
//		addMap.put("subScoreTotal",subScoreTotal);
//		examPaperService.addSubScoreTotal(addMap);
//		
//		}
	
	
	
}
