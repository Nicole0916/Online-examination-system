package com.ischoolbar.programmer.entity.admin;

import java.util.Date;

import org.springframework.stereotype.Component;

/**
 * �Ծ���Ϣʵ��
 * @author Administrator
 *
 */
@Component
public class ExamPaper {
	
	private Long id;
	private Long examId;//��������ID
	private Long studentId;//����ѧ��ID
	private int status = 0;//�Ծ�״̬��0��δ����1���ѿ�
	private int totalScore;//�Ծ��ܷ�
	private int score;//�͹����ܵ÷�
	private int subScoreTotal; //�������ܵ÷�
	private int finalScore; //�����ܵ÷�
	private Date startExamTime;//��ʼ����ʱ��
	private Date endExamTime;//��������ʱ��
	private int useTime;//������ʱ
	private Date createTime;//���ʱ��
	private Exam exam;//����ʵ��
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
