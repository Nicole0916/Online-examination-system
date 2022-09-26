package com.ischoolbar.programmer.service.admin.impl;
/**
 * �Ծ����serviceʵ����
 */
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.dao.admin.ExamPaperAnswerDao;
import com.ischoolbar.programmer.entity.admin.ExamPaperAnswer;
import com.ischoolbar.programmer.service.admin.ExamPaperAnswerService;
@Service
public class ExamPaperAnswerServiceImpl implements ExamPaperAnswerService {

	@Autowired
	private ExamPaperAnswerDao examPaperAnswerDao;

	@Override
	public int add(ExamPaperAnswer examPaperAnswer) {
		// TODO Auto-generated method stub
		return examPaperAnswerDao.add(examPaperAnswer);
	}

	@Override
	public int edit(ExamPaperAnswer examPaperAnswer) {
		// TODO Auto-generated method stub
		return examPaperAnswerDao.edit(examPaperAnswer);
	}

	@Override
	public List<ExamPaperAnswer> findList(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return examPaperAnswerDao.findList(queryMap);
	}

	@Override
	public int delete(Long id) {
		// TODO Auto-generated method stub
		return examPaperAnswerDao.delete(id);
	}

	@Override
	public Integer getTotal(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return examPaperAnswerDao.getTotal(queryMap);
	}

	@Override
	public List<ExamPaperAnswer> findListByUser(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return examPaperAnswerDao.findListByUser(queryMap);
	}

	@Override
	public int submitAnswer(ExamPaperAnswer examPaperAnswer) {
		// TODO Auto-generated method stub
		return examPaperAnswerDao.submitAnswer(examPaperAnswer);
	}

	@Override
	public List<ExamPaperAnswer> findSubjectList(Map<String, Object> queryMap) {
		// TODO �Զ����ɵķ������
		return examPaperAnswerDao.findSubjectList(queryMap);
	}

	@Override
	public Integer getSubjectTotal(Map<String, Object> queryMap) {
		// TODO �Զ����ɵķ������
		return examPaperAnswerDao.getSubjectTotal(queryMap);
	}

	@Override
	public int editScore(ExamPaperAnswer examPaperAnswer) {
		// TODO �Զ����ɵķ������
		return examPaperAnswerDao.editScore(examPaperAnswer);
	}

	@Override
	public List<ExamPaperAnswer> findScoreListByUser(Map<String, Object> queryMap) {//����ĳ��ѧ����ѯ�Ծ����е÷���Ϣ;
		// TODO �Զ����ɵķ������
		return examPaperAnswerDao.findScoreListByUser(queryMap); 
	}

	@Override
	public ExamPaperAnswer findById(Long id) {
		// TODO �Զ����ɵķ������
		return examPaperAnswerDao.findById(id);
	}





	

	


}
