package com.ischoolbar.programmer.entity.admin;

import java.util.Date;

import org.springframework.stereotype.Component;

/**
 * 试卷信息实体
 * @author Administrator
 *
 */
@Component
public class ExamPaper {
	
	private Long id;
	private Long examId;//所属考试ID
	private Long studentId;//所属学生ID
	private int status = 0;//试卷状态：0：未考，1：已考
	private int totalScore;//试卷总分
	private int score;//客观题总得分
	private int subScoreTotal; //主观题总得分
	private int finalScore; //考试总得分
	private Date startExamTime;//开始考试时间
	private Date endExamTime;//结束考试时间
	private int useTime;//考试用时
	private Date createTime;//添加时间
	private Exam exam;//考试实体
	public int getFinalScore() {
		return finalScore;
	}
	public void setFinalScore(int finalScore) {
		this.finalScore = finalScore;
	}
	public int getSubScoreTotal() {
		return subScoreTotal;
	}
	public void setSubScoreTotal(int subScoreTotal) {
		this.subScoreTotal = subScoreTotal;
	}
	public Long getExamId() {
		return examId;
	}
	public void setExamId(Long examId) {
		this.examId = examId;
	}
	public Long getStudentId() {
		return studentId;
	}
	public void setStudentId(Long studentId) {
		this.studentId = studentId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public int getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public Date getStartExamTime() {
		return startExamTime;
	}
	public void setStartExamTime(Date startExamTime) {
		this.startExamTime = startExamTime;
	}
	public Date getEndExamTime() {
		return endExamTime;
	}
	public void setEndExamTime(Date endExamTime) {
		this.endExamTime = endExamTime;
	}
	public int getUseTime() {
		return useTime;
	}
	public void setUseTime(int useTime) {
		this.useTime = useTime;
	}
	public Exam getExam() {
		return exam;
	}
	public void setExam(Exam exam) {
		this.exam = exam;
	}
	
}
