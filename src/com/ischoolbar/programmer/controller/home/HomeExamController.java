package com.ischoolbar.programmer.controller.home;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ischoolbar.programmer.entity.admin.Exam;
import com.ischoolbar.programmer.entity.admin.ExamPaper;
import com.ischoolbar.programmer.entity.admin.ExamPaperAnswer;
import com.ischoolbar.programmer.entity.admin.Question;
import com.ischoolbar.programmer.entity.admin.Student;
import com.ischoolbar.programmer.service.admin.ExamPaperAnswerService;
import com.ischoolbar.programmer.service.admin.ExamPaperService;
import com.ischoolbar.programmer.service.admin.ExamService;
import com.ischoolbar.programmer.service.admin.QuestionService;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * 前台用户考试控制器
 * @author Administrator
 *
 */
@RequestMapping("/home/exam")
@Controller
public class HomeExamController {
	
	@Autowired
	private ExamService examService;
	@Autowired
	private ExamPaperService examPaperService;
	@Autowired
	private ExamPaperAnswerService examPaperAnswerService;
	@Autowired
	private QuestionService questionService;
	/**
	 * 开始考试前检查合法性，随机生成试题
	 * @param examId
	 * @return
	 */
	@RequestMapping(value="/statr_exam",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> startExam(Long examId,HttpServletRequest request){
		Map<String, String> ret = new HashMap<String, String>();
		Exam exam = examService.findById(examId);
		if(exam == null){
			ret.put("type", "error");
			ret.put("msg", "考试信息不存在!");
			return ret;
		}
		if(exam.getEndTime().getTime() < new Date().getTime()){
			ret.put("type", "error");
			ret.put("msg", "该考试已结束!");
			return ret;
		}
		Student student = (Student)request.getSession().getAttribute("student");
		if(exam.getSubjectId().longValue() != student.getSubjectId().longValue()){
			ret.put("type", "error");
			ret.put("msg", "学科不同，无权进行考试!");
			return ret;
		}
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("examId", exam.getId());
		queryMap.put("studentId", student.getId());
		ExamPaper find = examPaperService.find(queryMap);
		if(find != null){
			if(find.getStatus() == 1){
				//表示已经考过
				ret.put("type", "error");
				ret.put("msg", "您已经考过这门考试了，不能再考!");
				return ret;
			}
			//走到这里表示试卷已经生成，但是没有提交考试，可以开始重新考试
			ret.put("type", "success");
			ret.put("msg", "可以开始考试");
			return ret;
		}
		//此时，说明符合考试条件，随机生成试卷试题
		//要做判断，看是否满足生成试卷的条件
		//获取单选题总数
		Map<String, Long> qMap = new HashMap<String, Long>();
		qMap.put("questionType", Long.valueOf(Question.QUESTION_TYPE_SINGLE));
		qMap.put("subjectId", exam.getSubjectId());
		int singleQuestionTotalNum = questionService.getQuestionNumByType(qMap);
		if(exam.getSingleQuestionNum() > singleQuestionTotalNum){
			ret.put("type", "error");
			ret.put("msg", "单选题数量超过题库单选题总数，无法生成试卷!");
			return ret;
		}
		//获取多选题总数
		qMap.put("questionType", Long.valueOf(Question.QUESTION_TYPE_MUILT));
		int muiltQuestionTotalNum = questionService.getQuestionNumByType(qMap);
		if(exam.getMuiltQuestionNum() > muiltQuestionTotalNum){
			ret.put("type", "error");
			ret.put("msg", "多选题数量超过题库多选题总数，无法生成试卷!");
			return ret;
		}
		//获取判断题总数
		qMap.put("questionType", Long.valueOf(Question.QUESTION_TYPE_CHARGE));
		int chargeQuestionTotalNum = questionService.getQuestionNumByType(qMap);
		if(exam.getChargeQuestionNum() > chargeQuestionTotalNum){
			ret.put("type", "error");
			ret.put("msg", "判断题数量超过题库判断题总数，无法生成试卷!");
			return ret;
		}
		//所有条件都满足，开始创建试卷，随机生成试题
		ExamPaper examPaper = new ExamPaper();
		examPaper.setCreateTime(new Date());
		examPaper.setExamId(examId);
		examPaper.setStatus(0);
		examPaper.setStudentId(student.getId());
		examPaper.setTotalScore(exam.getTotalScore());
		examPaper.setUseTime(0);
		if(examPaperService.add(examPaper) <= 0){
			ret.put("type", "error");
			ret.put("msg", "试卷生成失败，请联系管理员!");
			return ret;
		}
		//试卷已经正确生成，现在开始随机生成试题
		Map<String, Object> queryQuestionMap = new HashMap<String, Object>();
		queryQuestionMap.put("questionType", Question.QUESTION_TYPE_SINGLE);
		queryQuestionMap.put("subjectId", exam.getSubjectId());
		queryQuestionMap.put("offset", 0);
		queryQuestionMap.put("pageSize", 99999);
		if(exam.getSingleQuestionNum() > 0){
			//考试规定单选题数量大于0
			//获取所有的单选题
			List<Question> singleQuestionList = questionService.findList(queryQuestionMap);
			//随机选取考试规定数量的单选题，插入到数据库中
			List<Question> selectedSingleQuestionList = getRandomList(singleQuestionList, exam.getSingleQuestionNum());
			insertQuestionAnswer(selectedSingleQuestionList, examId, examPaper.getId(), student.getId());
		}
		if(exam.getMuiltQuestionNum() > 0){
			queryQuestionMap.put("questionType", Question.QUESTION_TYPE_MUILT);
			//获取所有的多选题
			List<Question> muiltQuestionList = questionService.findList(queryQuestionMap);
			//随机选取考试规定数量的多选题，插入到数据库中
			List<Question> selectedMuiltQuestionList = getRandomList(muiltQuestionList, exam.getMuiltQuestionNum());
			insertQuestionAnswer(selectedMuiltQuestionList, examId, examPaper.getId(), student.getId());
			
		}
		if(exam.getChargeQuestionNum() > 0){
			//获取所有的判断题
			queryQuestionMap.put("questionType", Question.QUESTION_TYPE_CHARGE);
			List<Question> chargeQuestionList = questionService.findList(queryQuestionMap);
			//随机选取考试规定数量的判断题，插入到数据库中
			List<Question> selectedChargeQuestionList = getRandomList(chargeQuestionList, exam.getChargeQuestionNum());
			insertQuestionAnswer(selectedChargeQuestionList, examId, examPaper.getId(), student.getId());
		}
		if(exam.getFillQuestionNum() > 0){
			//获取所有的填空题
			queryQuestionMap.put("questionType", Question.QUESTION_TYPE_FILL);
			List<Question> fillQuestionList = questionService.findList(queryQuestionMap);
			//随机选取考试规定数量的填空题，插入到数据库中
			List<Question> selectedFillQuestionList = getRandomList(fillQuestionList, exam.getFillQuestionNum());
			insertQuestionAnswer(selectedFillQuestionList, examId, examPaper.getId(), student.getId());
		}
		if(exam.getShortQuestionNum() > 0){
			//获取所有的简答题
			queryQuestionMap.put("questionType", Question.QUESTION_TYPE_SHORT);
			List<Question> shortQuestionList = questionService.findList(queryQuestionMap);
			//随机选取考试规定数量的简答题，插入到数据库中
			List<Question> selectedShortQuestionList = getRandomList(shortQuestionList, exam.getFillQuestionNum());
			insertQuestionAnswer(selectedShortQuestionList, examId, examPaper.getId(), student.getId());
		}
		exam.setPaperNum(exam.getPaperNum() + 1);
		examService.updateExam(exam);
		ret.put("type", "success");
		ret.put("msg", "试卷生成成功!");
		return ret;
	}
	
	/**
	 * 开始进行考试
	 * @param model
	 * @param examId
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/examing",method = RequestMethod.GET)
	public ModelAndView index(ModelAndView model,Long examId,HttpServletRequest request){
		Student student = (Student)request.getSession().getAttribute("student");
		Exam exam = examService.findById(examId);
		if(exam == null){
			model.setViewName("/home/exam/error");
			model.addObject("msg", "当前考试不存在!");
			return model;
		}
		if(exam.getEndTime().getTime() < new Date().getTime()){
			model.setViewName("/home/exam/error");
			model.addObject("msg", "当前考试时间已经过期!");
			return model;
		}
		if(exam.getSubjectId().longValue() != student.getSubjectId().longValue()){
			model.setViewName("/home/exam/error");
			model.addObject("msg", "您所属科目与考试科目不符合，不能进行考试!");
			return model;
		}
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("examId", examId);
		queryMap.put("studentId", student.getId());
		//根据考试信息和学生信息获取试卷
		ExamPaper examPaper = examPaperService.find(queryMap);
		if(examPaper == null){
			model.setViewName("/home/exam/error");
			model.addObject("msg", "当前考试不存在试卷");
			return model;
		}
		if(examPaper.getStatus() == 1){
			model.setViewName("/home/exam/error");
			model.addObject("msg", "您已经考过这门考试了！");
			return model;
		}
		Date now = new Date();
		
		Object attributeStartTime = request.getSession().getAttribute("startExamTime");
		if(attributeStartTime == null){
			request.getSession().setAttribute("startExamTime", now);
		}
		Date startExamTime = (Date)request.getSession().getAttribute("startExamTime");
		int passedTime = (int)(now.getTime() - startExamTime.getTime())/1000/60;
		if(passedTime >= exam.getAvaliableTime()){
			//表示时间已经耗尽，按零分处理
			examPaper.setScore(0);
			examPaper.setStartExamTime(startExamTime);
			examPaper.setStatus(1);
			examPaper.setUseTime(passedTime);
			examPaperService.submitPaper(examPaper);
			model.setViewName("/home/exam/error");
			model.addObject("msg", "当前考试时间已耗尽，还未提交试卷，做0分处理！");
			return model;
		}
		
		Integer hour = (exam.getAvaliableTime()-passedTime)/60;
		Integer minitute = (exam.getAvaliableTime()-passedTime)%60;
		Integer second = (exam.getAvaliableTime()*60-(int)(now.getTime() - startExamTime.getTime())/1000)%60;
		queryMap.put("examPaperId", examPaper.getId());
		List<ExamPaperAnswer> findListByUser = examPaperAnswerService.findListByUser(queryMap);
		model.addObject("title", exam.getName()+"-开始考试");
		model.addObject("singleQuestionList", getExamPaperAnswerList(findListByUser, Question.QUESTION_TYPE_SINGLE));
		model.addObject("muiltQuestionList", getExamPaperAnswerList(findListByUser, Question.QUESTION_TYPE_MUILT));
		model.addObject("chargeQuestionList", getExamPaperAnswerList(findListByUser, Question.QUESTION_TYPE_CHARGE));
		model.addObject("fillQuestionList", getExamPaperAnswerList(findListByUser, Question.QUESTION_TYPE_FILL));
		model.addObject("shortQuestionList", getExamPaperAnswerList(findListByUser, Question.QUESTION_TYPE_SHORT));
		
		//List<ExamPaperAnswer> singleQuestionList = getExamPaperAnswerList(findListByUser, Question.QUESTION_TYPE_FILL);
		//System.out.println("singleQuestionList是啊啊啊："+singleQuestionList.get(1)); 
		
		model.addObject("hour",hour);
		model.addObject("minitute",minitute);
		model.addObject("second",second);
		model.addObject("studentName", student.getName()); // 加入用户名
		model.addObject("trueName", student.getTrueName()); // 加入学生姓名
		model.addObject("exam", exam);
		model.addObject("examPaper", examPaper);
		model.addObject("singleScore", Question.QUESTION_TYPE_SINGLE_SCORE);
		model.addObject("muiltScore", Question.QUESTION_TYPE_MUILT_SCORE);
		model.addObject("chargeScore", Question.QUESTION_TYPE_CHARGE_SCORE);
		model.addObject("fillScore", Question.QUESTION_TYPE_FILL_SCORE);
		model.addObject("shortScore", Question.QUESTION_TYPE_SHORT_SCORE);
		model.addObject("singleQuestion", Question.QUESTION_TYPE_SINGLE);
		model.addObject("muiltQuestion", Question.QUESTION_TYPE_MUILT);
		model.addObject("chargeQuestion", Question.QUESTION_TYPE_CHARGE);
		model.addObject("fillQuestion", Question.QUESTION_TYPE_FILL);
		model.addObject("shortQuestion", Question.QUESTION_TYPE_SHORT);

		model.setViewName("/home/exam/examing");
		
		//interfaceUtil("http://127.0.0.1:8000/camera/", ""); //调用摄像头，开启监控
		camera_thread();
		
		return model;
		
	}
	
	/**
	 * 用户选择答题提交单个答案
	 * @param examPaperAnswer
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/submit_answer",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> submitAnswer(ExamPaperAnswer examPaperAnswer,HttpServletRequest request){
		Map<String, String> ret = new HashMap<String, String>();
		if(examPaperAnswer == null){
			ret.put("type", "error");
			ret.put("msg", "请正确操作!");
			return ret;
		}
		Exam exam = examService.findById(examPaperAnswer.getExamId());
		if(exam == null){
			ret.put("type", "error");
			ret.put("msg", "考试信息不存在!");
			return ret;
		}
		if(exam.getEndTime().getTime() < new Date().getTime()){
			ret.put("type", "error");
			ret.put("msg", "该考试已结束!");
			return ret;
		}
		Student student = (Student)request.getSession().getAttribute("student");
		if(exam.getSubjectId().longValue() != student.getSubjectId().longValue()){
			ret.put("type", "error");
			ret.put("msg", "学科不同，无权进行考试!");
			return ret;
		}
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("examId", exam.getId());
		queryMap.put("studentId", student.getId());
		ExamPaper findExamPaper = examPaperService.find(queryMap);
		if(findExamPaper == null){
			ret.put("type", "error");
			ret.put("msg", "不存在试卷!");
			return ret;
		}
		if(findExamPaper.getId().longValue() != examPaperAnswer.getExamPaperId().longValue()){
			ret.put("type", "error");
			ret.put("msg", "考试试卷不正确，请规范操作!");
			return ret;
		}
		Question question = questionService.findById(examPaperAnswer.getQuestionId());
		if(question == null){
			ret.put("type", "error");
			ret.put("msg", "试题不存在，请规范操作!");
			return ret;
		}
		//此时，可以将答案插入到数据库中
		examPaperAnswer.setStudentId(student.getId());
		if(question.getAnswer().equals(examPaperAnswer.getAnswer())){
			examPaperAnswer.setIsCorrect(1);} // 如果答案相等，那么设置isCorrect为1
		if(!question.getAnswer().equals(examPaperAnswer.getAnswer()))examPaperAnswer.setIsCorrect(0); //如果答案不相等，设置为0
		if(question.getAnswer().isEmpty()) {
			examPaperAnswer.setIsCorrect(2);// 如果没有答案，说明是填空题和简答题，设置为2，待批阅。
		}
		
		if(examPaperAnswerService.submitAnswer(examPaperAnswer) <= 0){
			ret.put("type", "error");
			ret.put("msg", "答题出错，请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "答题成功!");
		return ret;
	}
	
	/**
	 * 提交试卷
	 */
	@RequestMapping(value="/submit_exam",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> submitExam(Long examId,Long examPaperId,HttpServletRequest request){
		Map<String, String> ret = new HashMap<String, String>();
		Exam exam = examService.findById(examId);
		if(exam == null){
			ret.put("type", "error");
			ret.put("msg", "考试不存在，请正确操作!");
			return ret;
		}
		if(exam.getEndTime().getTime() < new Date().getTime()){
			ret.put("type", "error");
			ret.put("msg", "该考试已结束!");
			return ret;
		}
		Student student = (Student)request.getSession().getAttribute("student");
		if(exam.getSubjectId().longValue() != student.getSubjectId().longValue()){
			ret.put("type", "error");
			ret.put("msg", "学科不同，无权进行操作!");
			return ret;
		}
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("examId", exam.getId());
		queryMap.put("studentId", student.getId());
		ExamPaper findExamPaper = examPaperService.find(queryMap);
		if(findExamPaper == null){
			ret.put("type", "error");
			ret.put("msg", "不存在试卷!");
			return ret;
		}
		if(findExamPaper.getId().longValue() != examPaperId.longValue()){
			ret.put("type", "error");
			ret.put("msg", "考试试卷不正确，请规范操作!");
			return ret;
		}
		if(findExamPaper.getStatus() == 1){
			ret.put("type", "error");
			ret.put("msg", "请勿重复交卷!");
			return ret;
		}
		//此时计算考试客观题得分
		queryMap.put("examPaperId", examPaperId);
		List<ExamPaperAnswer> examPaperAnswerList = examPaperAnswerService.findListByUser(queryMap);
		//此时，可以将答案插入到数据库中
		int score = 0;
		for(ExamPaperAnswer examPaperAnswer:examPaperAnswerList){
			if(examPaperAnswer.getIsCorrect() == 1){
				score += examPaperAnswer.getQuestion().getScore();
			}
		}
		findExamPaper.setEndExamTime(new Date());
		findExamPaper.setScore(score);
		findExamPaper.setStartExamTime((Date)request.getSession().getAttribute("startExamTime"));
		findExamPaper.setStatus(1);
		findExamPaper.setUseTime((int)(findExamPaper.getEndExamTime().getTime()-findExamPaper.getStartExamTime().getTime())/1000/60);
		examPaperService.submitPaper(findExamPaper);
		//计算考试统计结果,更新考试的已考人数，及格人数
		exam.setExamedNum(exam.getExamedNum() + 1);
		if(findExamPaper.getScore() >= exam.getPassScore()){
			//说明及格
			exam.setPassNum(exam.getPassNum() + 1);
		}
		request.getSession().setAttribute("startExamTime", null);
		//更新统计结果
		examService.updateExam(exam);
		ret.put("type", "success");
		ret.put("msg", "提交成功!");
		
		//摄像头释放
		camera_off_thread();
		
		return ret;
	}
	
	
	/**
	 * 随机从给定的list中选取给定数量的元素
	 * @param questionList
	 * @param n
	 * @return
	 */
	private List<Question> getRandomList(List<Question> questionList,int n){
		if(questionList.size() <= n)return questionList;
		Map<Integer, String> selectedMap = new HashMap<Integer, String>();
		List<Question> selectedList = new ArrayList<Question>();
		while(selectedList.size() < n){
			for(Question question:questionList){
				int index = (int)(Math.random() * questionList.size());
				if(!selectedMap.containsKey(index)){
					selectedMap.put(index, "");
					selectedList.add(questionList.get(index));
					if(selectedList.size() >= n)break;
				}
			}
		}
		return selectedList;
	}
	
	/**
	 * 插入指定数量的试题到答题详情表
	 * @param questionList
	 * @param examId
	 * @param examPaperId
	 * @param studentId
	 */
	private void insertQuestionAnswer(List<Question> questionList,Long examId,Long examPaperId,Long studentId){
		for(Question question:questionList){
			ExamPaperAnswer examPaperAnswer = new ExamPaperAnswer();
			examPaperAnswer.setExamId(examId);
			examPaperAnswer.setExamPaperId(examPaperId);
			examPaperAnswer.setIsCorrect(0);
			examPaperAnswer.setQuestionId(question.getId());
			examPaperAnswer.setStudentId(studentId);
			examPaperAnswerService.add(examPaperAnswer);
		}
	}
	
	/**
	 * 返回指定类型的试题
	 * @param examPaperAnswers
	 * @param questionType
	 * @return
	 */
	private List<ExamPaperAnswer> getExamPaperAnswerList(List<ExamPaperAnswer> examPaperAnswers,int questionType){
		List<ExamPaperAnswer> newExamPaperAnswers = new ArrayList<ExamPaperAnswer>();
		for(ExamPaperAnswer examPaperAnswer:examPaperAnswers){
			if(examPaperAnswer.getQuestion().getQuestionType() == questionType){
				newExamPaperAnswers.add(examPaperAnswer);
			}
		}
		return newExamPaperAnswers;
	}
	
	/**
     * 调用对方接口方法
     * @param path 对方或第三方提供的路径
     * @param data 向对方或第三方发送的数据，大多数情况下给对方发送JSON数据让对方解析
     */
	public static void interfaceUtil(String path,String data) {
	    try {
	        URL url = new URL(path);
	        //打开和url之间的连接
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        PrintWriter out = null;
	        //请求方式
	        conn.setRequestMethod("POST");
	        //设置通用的请求属性
	        conn.setRequestProperty("accept", "*/*");
	        conn.setRequestProperty("connection", "Keep-Alive");
	        conn.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)"); 
	        //设置是否向httpUrlConnection输出，设置是否从httpUrlConnection读入，此外发送post请求必须设置这两个
	        //最常用的Http请求无非是get和post，get请求可以获取静态页面，也可以把参数放在URL字串后面，传递给servlet，
	        //post与get的 不同之处在于post的参数不是放在URL字串里面，而是放在http请求的正文内。
	        conn.setDoOutput(true);
	        conn.setDoInput(true);
	        //获取URLConnection对象对应的输出流
	        out = new PrintWriter(conn.getOutputStream());
	        //发送请求参数即数据
	        out.print(data);
	        //缓冲数据
	        out.flush();
	        //获取URLConnection对象对应的输入流
	        InputStream is = conn.getInputStream();
	        //构造一个字符流缓存
	        BufferedReader br = new BufferedReader(new InputStreamReader(is));
	        String str = "";
	        while ((str = br.readLine()) != null) {
	            System.out.println(str);
	        }
	        //关闭流
	        is.close();
	        //断开连接，最好写上，disconnect是在底层tcp socket链接空闲时才切断。如果正在被其他线程使用就不切断。
	        //固定多线程的话，如果不disconnect，链接会增多，直到收发不出信息。写上disconnect后正常一些。
	        conn.disconnect();
	        System.out.println("完整结束");
	    } catch (Exception e) {
	        e.printStackTrace();}
	    }
	
	void camera_thread()  
	{  
	  
	     Thread t = new Thread(new Runnable(){  
	            public void run(){  
	           // run方法具体重写
	            	interfaceUtil("http://127.0.0.1:8000/camera/", ""); //调用摄像头，开启监控  
	            }});  
	        t.start();  
	}
	
	void camera_off_thread()  
	{  
	  
	     Thread t = new Thread(new Runnable(){  
	            public void run(){  
	           // run方法具体重写
	            	interfaceUtil("http://127.0.0.1:8000/camera_off/", ""); //释放摄像头，关闭监控  
	            }});  
	        t.start();  
	}
	
	
}