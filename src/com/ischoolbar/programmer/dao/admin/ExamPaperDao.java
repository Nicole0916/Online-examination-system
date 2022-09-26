package com.ischoolbar.programmer.dao.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ischoolbar.programmer.entity.admin.ExamPaper;

/**
 * 试卷dao层
 * @author Administrator
 *
 */
@Repository
public interface ExamPaperDao {
	public int add(ExamPaper examPaper);
	public int edit(ExamPaper examPaper);
	public List<ExamPaper> findList(Map<String, Object> queryMap);
	public int delete(Long id);
	public Integer getTotal(Map<String, Object> queryMap);
	public List<ExamPaper> findHistory(Map<String, Object> queryMap);
	public Integer getHistoryTotal(Map<String, Object> queryMap);
	public ExamPaper find(Map<String, Object> queryMap);
	public int submitPaper(ExamPaper examPaper);
	public List<Map<String,Object>> getExamStats(Long examId);
	public Map<String,Object> getStuExamDetail(Map<String, Object> queryMap); // 获取学生考试的详细信息
	public Map<String, Object> getExamCounting(Long examId); // 获取考试的统计信息
	public int addSubScoreTotal(Map<String, Object> addMap);
	public ExamPaper findById(Long id);
	public int addFinalScore(Map<String, Object> addMap);
}
