package com.ischoolbar.programmer.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.entity.admin.ExamPaper;

/**
 * �Ծ�service��
 * @author Administrator
 *
 */
@Service
public interface ExamPaperService {
	public int add(ExamPaper examPaper);
	public int edit(ExamPaper examPaper);
	public List<ExamPaper> findList(Map<String, Object> queryMap);
	public int delete(Long id);
	public Integer getTotal(Map<String, Object> queryMap);
	public List<ExamPaper> findHistory(Map<String, Object> queryMap);
	public Integer getHistoryTotal(Map<String, Object> queryMap);
	public ExamPaper find(Map<String, Object> queryMap);
	public int submitPaper(ExamPaper examPaper);
	public List<Map<String,Object>> getExamStats(Long examId); // ���ݿ���id���ؿ��Գɼ�����Ϣ
	public Map<String,Object> getStuExamDetail(Map<String, Object> queryMap); // ��ȡѧ�����Ե���ϸ��Ϣ
	public Map<String,Object> getExamCounting(Long examId); // �������Ե�ͳ����Ϣ
	public int addSubScoreTotal(Map<String, Object> addMap);
	public ExamPaper findById(Long id);
	public int addFinalScore(Map<String, Object> addMap);
}