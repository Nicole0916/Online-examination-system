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
 * ǰ̨�û����Կ�����
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
	 * ��ʼ����ǰ���Ϸ��ԣ������������
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
			ret.put("msg", "������Ϣ������!");
			return ret;
		}
		if(exam.getEndTime().getTime() < new Date().getTime()){
			ret.put("type", "error");
			ret.put("msg", "�ÿ����ѽ���!");
			return ret;
		}
		Student student = (Student)request.getSession().getAttribute("student");
		if(exam.getSubjectId().longValue() != student.getSubjectId().longValue()){
			ret.put("type", "error");
			ret.put("msg", "ѧ�Ʋ�ͬ����Ȩ���п���!");
			return ret;
		}
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("examId", exam.getId());
		queryMap.put("studentId", student.getId());
		ExamPaper find = examPaperService.find(queryMap);
		if(find != null){
			if(find.getStatus() == 1){
				//��ʾ�Ѿ�����
				ret.put("type", "error");
				ret.put("msg", "���Ѿ��������ſ����ˣ������ٿ�!");
				return ret;
			}
			//�ߵ������ʾ�Ծ��Ѿ����ɣ�����û���ύ���ԣ����Կ�ʼ���¿���
			ret.put("type", "success");
			ret.put("msg", "���Կ�ʼ����");
			return ret;
		}
		//��ʱ��˵�����Ͽ�����������������Ծ�����
		//Ҫ���жϣ����Ƿ����������Ծ������
		//��ȡ��ѡ������
		Map<String, Long> qMap = new HashMap<String, Long>();
		qMap.put("questionType", Long.valueOf(Question.QUESTION_TYPE_SINGLE));
		qMap.put("subjectId", exam.getSubjectId());
		int singleQuestionTotalNum = questionService.getQuestionNumByType(qMap);
		if(exam.getSingleQuestionNum() > singleQuestionTotalNum){
			ret.put("type", "error");
			ret.put("msg", "��ѡ������������ⵥѡ���������޷������Ծ�!");
			return ret;
		}
		//��ȡ��ѡ������
		qMap.put("questionType", Long.valueOf(Question.QUESTION_TYPE_MUILT));
		int muiltQuestionTotalNum = questionService.getQuestionNumByType(qMap);
		if(exam.getMuiltQuestionNum() > muiltQuestionTotalNum){
			ret.put("type", "error");
			ret.put("msg", "��ѡ��������������ѡ���������޷������Ծ�!");
			return ret;
		}
		//��ȡ�ж�������
		qMap.put("questionType", Long.valueOf(Question.QUESTION_TYPE_CHARGE));
		int chargeQuestionTotalNum = questionService.getQuestionNumByType(qMap);
		if(exam.getChargeQuestionNum() > chargeQuestionTotalNum){
			ret.put("type", "error");
			ret.put("msg", "�ж���������������ж����������޷������Ծ�!");
			return ret;
		}
		//�������������㣬��ʼ�����Ծ������������
		ExamPaper examPaper = new ExamPaper();
		examPaper.setCreateTime(new Date());
		examPaper.setExamId(examId);
		examPaper.setStatus(0);
		examPaper.setStudentId(student.getId());
		examPaper.setTotalScore(exam.getTotalScore());
		examPaper.setUseTime(0);
		if(examPaperService.add(examPaper) <= 0){
			ret.put("type", "error");
			ret.put("msg", "�Ծ�����ʧ�ܣ�����ϵ����Ա!");
			return ret;
		}
		//�Ծ��Ѿ���ȷ���ɣ����ڿ�ʼ�����������
		Map<String, Object> queryQuestionMap = new HashMap<String, Object>();
		queryQuestionMap.put("questionType", Question.QUESTION_TYPE_SINGLE);
		queryQuestionMap.put("subjectId", exam.getSubjectId());
		queryQuestionMap.put("offset", 0);
		queryQuestionMap.put("pageSize", 99999);
		if(exam.getSingleQuestionNum() > 0){
			//���Թ涨��ѡ����������0
			//��ȡ���еĵ�ѡ��
			List<Question> singleQuestionList = questionService.findList(queryQuestionMap);
			//���ѡȡ���Թ涨�����ĵ�ѡ�⣬���뵽���ݿ���
			List<Question> selectedSingleQuestionList = getRandomList(singleQuestionList, exam.getSingleQuestionNum());
			insertQuestionAnswer(selectedSingleQuestionList, examId, examPaper.getId(), student.getId());
		}
		if(exam.getMuiltQuestionNum() > 0){
			queryQuestionMap.put("questionType", Question.QUESTION_TYPE_MUILT);
			//��ȡ���еĶ�ѡ��
			List<Question> muiltQuestionList = questionService.findList(queryQuestionMap);
			//���ѡȡ���Թ涨�����Ķ�ѡ�⣬���뵽���ݿ���
			List<Question> selectedMuiltQuestionList = getRandomList(muiltQuestionList, exam.getMuiltQuestionNum());
			insertQuestionAnswer(selectedMuiltQuestionList, examId, examPaper.getId(), student.getId());
			
		}
		if(exam.getChargeQuestionNum() > 0){
			//��ȡ���е��ж���
			queryQuestionMap.put("questionType", Question.QUESTION_TYPE_CHARGE);
			List<Question> chargeQuestionList = questionService.findList(queryQuestionMap);
			//���ѡȡ���Թ涨�������ж��⣬���뵽���ݿ���
			List<Question> selectedChargeQuestionList = getRandomList(chargeQuestionList, exam.getChargeQuestionNum());
			insertQuestionAnswer(selectedChargeQuestionList, examId, examPaper.getId(), student.getId());
		}
		if(exam.getFillQuestionNum() > 0){
			//��ȡ���е������
			queryQuestionMap.put("questionType", Question.QUESTION_TYPE_FILL);
			List<Question> fillQuestionList = questionService.findList(queryQuestionMap);
			//���ѡȡ���Թ涨����������⣬���뵽���ݿ���
			List<Question> selectedFillQuestionList = getRandomList(fillQuestionList, exam.getFillQuestionNum());
			insertQuestionAnswer(selectedFillQuestionList, examId, examPaper.getId(), student.getId());
		}
		if(exam.getShortQuestionNum() > 0){
			//��ȡ���еļ����
			queryQuestionMap.put("questionType", Question.QUESTION_TYPE_SHORT);
			List<Question> shortQuestionList = questionService.findList(queryQuestionMap);
			//���ѡȡ���Թ涨�����ļ���⣬���뵽���ݿ���
			List<Question> selectedShortQuestionList = getRandomList(shortQuestionList, exam.getFillQuestionNum());
			insertQuestionAnswer(selectedShortQuestionList, examId, examPaper.getId(), student.getId());
		}
		exam.setPaperNum(exam.getPaperNum() + 1);
		examService.updateExam(exam);
		ret.put("type", "success");
		ret.put("msg", "�Ծ����ɳɹ�!");
		return ret;
	}
	
	/**
	 * ��ʼ���п���
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
			model.addObject("msg", "��ǰ���Բ�����!");
			return model;
		}
		if(exam.getEndTime().getTime() < new Date().getTime()){
			model.setViewName("/home/exam/error");
			model.addObject("msg", "��ǰ����ʱ���Ѿ�����!");
			return model;
		}
		if(exam.getSubjectId().longValue() != student.getSubjectId().longValue()){
			model.setViewName("/home/exam/error");
			model.addObject("msg", "��������Ŀ�뿼�Կ�Ŀ�����ϣ����ܽ��п���!");
			return model;
		}
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("examId", examId);
		queryMap.put("studentId", student.getId());
		//���ݿ�����Ϣ��ѧ����Ϣ��ȡ�Ծ�
		ExamPaper examPaper = examPaperService.find(queryMap);
		if(examPaper == null){
			model.setViewName("/home/exam/error");
			model.addObject("msg", "��ǰ���Բ������Ծ�");
			return model;
		}
		if(examPaper.getStatus() == 1){
			model.setViewName("/home/exam/error");
			model.addObject("msg", "���Ѿ��������ſ����ˣ�");
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
			//��ʾʱ���Ѿ��ľ�������ִ���
			examPaper.setScore(0);
			examPaper.setStartExamTime(startExamTime);
			examPaper.setStatus(1);
			examPaper.setUseTime(passedTime);
			examPaperService.submitPaper(examPaper);
			model.setViewName("/home/exam/error");
			model.addObject("msg", "��ǰ����ʱ���Ѻľ�����δ�ύ�Ծ���0�ִ���");
			return model;
		}
		
		Integer hour = (exam.getAvaliableTime()-passedTime)/60;
		Integer minitute = (exam.getAvaliableTime()-passedTime)%60;
		Integer second = (exam.getAvaliableTime()*60-(int)(now.getTime() - startExamTime.getTime())/1000)%60;
		queryMap.put("examPaperId", examPaper.getId());
		List<ExamPaperAnswer> findListByUser = examPaperAnswerService.findListByUser(queryMap);
		model.addObject("title", exam.getName()+"-��ʼ����");
		model.addObject("singleQuestionList", getExamPaperAnswerList(findListByUser, Question.QUESTION_TYPE_SINGLE));
		model.addObject("muiltQuestionList", getExamPaperAnswerList(findListByUser, Question.QUESTION_TYPE_MUILT));
		model.addObject("chargeQuestionList", getExamPaperAnswerList(findListByUser, Question.QUESTION_TYPE_CHARGE));
		model.addObject("fillQuestionList", getExamPaperAnswerList(findListByUser, Question.QUESTION_TYPE_FILL));
		model.addObject("shortQuestionList", getExamPaperAnswerList(findListByUser, Question.QUESTION_TYPE_SHORT));
		
		//List<ExamPaperAnswer> singleQuestionList = getExamPaperAnswerList(findListByUser, Question.QUESTION_TYPE_FILL);
		//System.out.println("singleQuestionList�ǰ�������"+singleQuestionList.get(1)); 
		
		model.addObject("hour",hour);
		model.addObject("minitute",minitute);
		model.addObject("second",second);
		model.addObject("studentName", student.getName()); // �����û���
		model.addObject("trueName", student.getTrueName()); // ����ѧ������
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
		
		//interfaceUtil("http://127.0.0.1:8000/camera/", ""); //��������ͷ���������
		camera_thread();
		
		return model;
		
	}
	
	/**
	 * �û�ѡ������ύ������
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
			ret.put("msg", "����ȷ����!");
			return ret;
		}
		Exam exam = examService.findById(examPaperAnswer.getExamId());
		if(exam == null){
			ret.put("type", "error");
			ret.put("msg", "������Ϣ������!");
			return ret;
		}
		if(exam.getEndTime().getTime() < new Date().getTime()){
			ret.put("type", "error");
			ret.put("msg", "�ÿ����ѽ���!");
			return ret;
		}
		Student student = (Student)request.getSession().getAttribute("student");
		if(exam.getSubjectId().longValue() != student.getSubjectId().longValue()){
			ret.put("type", "error");
			ret.put("msg", "ѧ�Ʋ�ͬ����Ȩ���п���!");
			return ret;
		}
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("examId", exam.getId());
		queryMap.put("studentId", student.getId());
		ExamPaper findExamPaper = examPaperService.find(queryMap);
		if(findExamPaper == null){
			ret.put("type", "error");
			ret.put("msg", "�������Ծ�!");
			return ret;
		}
		if(findExamPaper.getId().longValue() != examPaperAnswer.getExamPaperId().longValue()){
			ret.put("type", "error");
			ret.put("msg", "�����Ծ���ȷ����淶����!");
			return ret;
		}
		Question question = questionService.findById(examPaperAnswer.getQuestionId());
		if(question == null){
			ret.put("type", "error");
			ret.put("msg", "���ⲻ���ڣ���淶����!");
			return ret;
		}
		//��ʱ�����Խ��𰸲��뵽���ݿ���
		examPaperAnswer.setStudentId(student.getId());
		if(question.getAnswer().equals(examPaperAnswer.getAnswer())){
			examPaperAnswer.setIsCorrect(1);} // �������ȣ���ô����isCorrectΪ1
		if(!question.getAnswer().equals(examPaperAnswer.getAnswer()))examPaperAnswer.setIsCorrect(0); //����𰸲���ȣ�����Ϊ0
		if(question.getAnswer().isEmpty()) {
			examPaperAnswer.setIsCorrect(2);// ���û�д𰸣�˵���������ͼ���⣬����Ϊ2�������ġ�
		}
		
		if(examPaperAnswerService.submitAnswer(examPaperAnswer) <= 0){
			ret.put("type", "error");
			ret.put("msg", "�����������ϵ����Ա!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "����ɹ�!");
		return ret;
	}
	
	/**
	 * �ύ�Ծ�
	 */
	@RequestMapping(value="/submit_exam",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> submitExam(Long examId,Long examPaperId,HttpServletRequest request){
		Map<String, String> ret = new HashMap<String, String>();
		Exam exam = examService.findById(examId);
		if(exam == null){
			ret.put("type", "error");
			ret.put("msg", "���Բ����ڣ�����ȷ����!");
			return ret;
		}
		if(exam.getEndTime().getTime() < new Date().getTime()){
			ret.put("type", "error");
			ret.put("msg", "�ÿ����ѽ���!");
			return ret;
		}
		Student student = (Student)request.getSession().getAttribute("student");
		if(exam.getSubjectId().longValue() != student.getSubjectId().longValue()){
			ret.put("type", "error");
			ret.put("msg", "ѧ�Ʋ�ͬ����Ȩ���в���!");
			return ret;
		}
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("examId", exam.getId());
		queryMap.put("studentId", student.getId());
		ExamPaper findExamPaper = examPaperService.find(queryMap);
		if(findExamPaper == null){
			ret.put("type", "error");
			ret.put("msg", "�������Ծ�!");
			return ret;
		}
		if(findExamPaper.getId().longValue() != examPaperId.longValue()){
			ret.put("type", "error");
			ret.put("msg", "�����Ծ���ȷ����淶����!");
			return ret;
		}
		if(findExamPaper.getStatus() == 1){
			ret.put("type", "error");
			ret.put("msg", "�����ظ�����!");
			return ret;
		}
		//��ʱ���㿼�Կ͹���÷�
		queryMap.put("examPaperId", examPaperId);
		List<ExamPaperAnswer> examPaperAnswerList = examPaperAnswerService.findListByUser(queryMap);
		//��ʱ�����Խ��𰸲��뵽���ݿ���
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
		//���㿼��ͳ�ƽ��,���¿��Ե��ѿ���������������
		exam.setExamedNum(exam.getExamedNum() + 1);
		if(findExamPaper.getScore() >= exam.getPassScore()){
			//˵������
			exam.setPassNum(exam.getPassNum() + 1);
		}
		request.getSession().setAttribute("startExamTime", null);
		//����ͳ�ƽ��
		examService.updateExam(exam);
		ret.put("type", "success");
		ret.put("msg", "�ύ�ɹ�!");
		
		//����ͷ�ͷ�
		camera_off_thread();
		
		return ret;
	}
	
	
	/**
	 * ����Ӹ�����list��ѡȡ����������Ԫ��
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
	 * ����ָ�����������⵽���������
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
	 * ����ָ�����͵�����
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
     * ���öԷ��ӿڷ���
     * @param path �Է���������ṩ��·��
     * @param data ��Է�����������͵����ݣ����������¸��Է�����JSON�����öԷ�����
     */
	public static void interfaceUtil(String path,String data) {
	    try {
	        URL url = new URL(path);
	        //�򿪺�url֮�������
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        PrintWriter out = null;
	        //����ʽ
	        conn.setRequestMethod("POST");
	        //����ͨ�õ���������
	        conn.setRequestProperty("accept", "*/*");
	        conn.setRequestProperty("connection", "Keep-Alive");
	        conn.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)"); 
	        //�����Ƿ���httpUrlConnection����������Ƿ��httpUrlConnection���룬���ⷢ��post�����������������
	        //��õ�Http�����޷���get��post��get������Ի�ȡ��̬ҳ�棬Ҳ���԰Ѳ�������URL�ִ����棬���ݸ�servlet��
	        //post��get�� ��֮ͬ������post�Ĳ������Ƿ���URL�ִ����棬���Ƿ���http����������ڡ�
	        conn.setDoOutput(true);
	        conn.setDoInput(true);
	        //��ȡURLConnection�����Ӧ�������
	        out = new PrintWriter(conn.getOutputStream());
	        //�����������������
	        out.print(data);
	        //��������
	        out.flush();
	        //��ȡURLConnection�����Ӧ��������
	        InputStream is = conn.getInputStream();
	        //����һ���ַ�������
	        BufferedReader br = new BufferedReader(new InputStreamReader(is));
	        String str = "";
	        while ((str = br.readLine()) != null) {
	            System.out.println(str);
	        }
	        //�ر���
	        is.close();
	        //�Ͽ����ӣ����д�ϣ�disconnect���ڵײ�tcp socket���ӿ���ʱ���жϡ�������ڱ������߳�ʹ�þͲ��жϡ�
	        //�̶����̵߳Ļ��������disconnect�����ӻ����ֱ࣬���շ�������Ϣ��д��disconnect������һЩ��
	        conn.disconnect();
	        System.out.println("��������");
	    } catch (Exception e) {
	        e.printStackTrace();}
	    }
	
	void camera_thread()  
	{  
	  
	     Thread t = new Thread(new Runnable(){  
	            public void run(){  
	           // run����������д
	            	interfaceUtil("http://127.0.0.1:8000/camera/", ""); //��������ͷ���������  
	            }});  
	        t.start();  
	}
	
	void camera_off_thread()  
	{  
	  
	     Thread t = new Thread(new Runnable(){  
	            public void run(){  
	           // run����������д
	            	interfaceUtil("http://127.0.0.1:8000/camera_off/", ""); //�ͷ�����ͷ���رռ��  
	            }});  
	        t.start();  
	}
	
	
}