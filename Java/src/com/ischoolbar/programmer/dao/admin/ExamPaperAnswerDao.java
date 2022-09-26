package com.ischoolbar.programmer.dao.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ischoolbar.programmer.entity.admin.ExamPaperAnswer;

/**
 * 试卷dao层
 * @author Administrator
 *
 */
@Repository
public interface ExamPaperAnswerDao {
	public int add(ExamPaperAnswer examPaperAnswer);
	public int edit(ExamPaperAnswer examPaperAnswer);
	public int editScore(ExamPaperAnswer examPaperAnswer);
	public List<ExamPaperAnswer> findList(Map<String, Object> queryMap);
	public int delete(Long id);
	public Integer getTotal(Map<String, Object> queryMap);
	public Integer getSubjectTotal(Map<String, Object> queryMap);
	public List<ExamPaperAnswer> findListByUser(Map<String, Object> queryMap);
	public int submitAnswer(ExamPaperAnswer examPaperAnswer);
	public List<ExamPaperAnswer> findSubjectList(Map<String, Object> queryMap); 
	public List<ExamPaperAnswer> findScoreListByUser(Map<String, Object> queryMap); //根据某个学生查询试卷所有得分信息
	public ExamPaperAnswer findById(Long id); //根据id找到答题信息
}
