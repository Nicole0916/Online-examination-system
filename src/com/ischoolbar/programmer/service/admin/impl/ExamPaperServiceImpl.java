package com.ischoolbar.programmer.service.admin.impl;
/**
 * 试卷service实现类
 */
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.dao.admin.ExamPaperDao;
import com.ischoolbar.programmer.entity.admin.ExamPaper;
import com.ischoolbar.programmer.service.admin.ExamPaperService;
@Service
public class ExamPaperServiceImpl implements ExamPaperService {

	@Autowired
	private ExamPaperDao examPaperDao;



	@Override
	public int delete(Long id) {
		// TODO Auto-generated method stub
		return examPaperDao.delete(id);
	}

	@Override
	public Integer getTotal(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return examPaperDao.getTotal(queryMap);
	}

	@Override
	public int add(ExamPaper examPaper) {
		// TODO Auto-generated method stub
		return examPaperDao.add(examPaper);
	}

	@Override
	public int edit(ExamPaper examPaper) {
		// TODO Auto-generated method stub
		return examPaperDao.edit(examPaper);
	}

	@Override
	public List<ExamPaper> findList(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return examPaperDao.findList(queryMap);
	}

	@Override
	public List<ExamPaper> findHistory(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return examPaperDao.findHistory(queryMap);
	}

	@Override
	public Integer getHistoryTotal(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return examPaperDao.getHistoryTotal(queryMap);
	}

	@Override
	public ExamPaper find(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return examPaperDao.find(queryMap);
	}

	@Override
	public int submitPaper(ExamPaper examPaper) {
		// TODO Auto-generated method stub
		return examPaperDao.submitPaper(examPaper);
	}

	@Override
	public List<Map<String,Object>> getExamStats(Long examId) {
		// TODO Auto-generated method stub
		return examPaperDao.getExamStats(examId);
	}

	@Override
	public Map<String, Object> getStuExamDetail(Map<String, Object> queryMap) {
		return examPaperDao.getStuExamDetail(queryMap);
	}

	@Override
	public Map<String, Object> getExamCounting(Long examId) {
		return examPaperDao.getExamCounting(examId);
	}


	@Override
	public int addSubScoreTotal(Map<String, Object> addMap) {
		// TODO 自动生成的方法存根
		return examPaperDao.addSubScoreTotal(addMap);
	}

	@Override
	public ExamPaper findById(Long id) {
		// TODO 自动生成的方法存根
		return examPaperDao.findById(id);
	}

	@Override
	public int addFinalScore(Map<String, Object> addMap) {
		// TODO 自动生成的方法存根
		return examPaperDao.addFinalScore(addMap);
	}


}
