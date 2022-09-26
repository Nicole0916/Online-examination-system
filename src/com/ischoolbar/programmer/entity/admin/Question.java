package com.ischoolbar.programmer.entity.admin;

import java.util.Date;

import org.springframework.stereotype.Component;

/**
 * ����ʵ����
 * @author Administrator
 *
 */
@Component
public class Question {
	
	//�������Ͷ���
	public static int QUESTION_TYPE_SINGLE = 0;//��ѡ����
	public static int QUESTION_TYPE_MUILT = 1;//��ѡ����
	public static int QUESTION_TYPE_CHARGE = 2;//�ж�����
	public static int QUESTION_TYPE_FILL = 3;//�������
	public static int QUESTION_TYPE_SHORT = 4;//�������
	//�����ֵ���壬�����������Ͷ����ֵ
	public static int QUESTION_TYPE_SINGLE_SCORE = 2;//��ѡ���ͣ�ÿ��2��
	public static int QUESTION_TYPE_MUILT_SCORE = 4;//��ѡ����,ÿ��4��
	public static int QUESTION_TYPE_CHARGE_SCORE = 2;//�ж�����,ÿ��2��
	public static int QUESTION_TYPE_FILL_SCORE = 2;//�������
	public static int QUESTION_TYPE_SHORT_SCORE = 10;//�������
	
	private Long id;
	private Long subjectId;//ѧ��רҵ����
	private int questionType;//��������
	private String title;//��Ŀ
	private int score;//��ֵ
	private String attrA;//ѡ��A
	private String attrB;//ѡ��B
	private String attrC;//ѡ��C
	private String attrD;//ѡ��D
	private String answer;//��ȷ��
	private String studentAnswer;//ѧ�������Ĵ�
	private Date createTime;//���ʱ��
	
	
	public String getStudentAnswer() {
		return studentAnswer;
	}
	public void setStudentAnswer(String studentAnswer) {
		this.studentAnswer = studentAnswer;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public int getQuestionType() {
		return questionType;
	}
	public void setQuestionType(int questionType) {
		this.questionType = questionType;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAttrA() {
		return attrA;
	}
	public void setAttrA(String attrA) {
		this.attrA = attrA;
	}
	public String getAttrB() {
		return attrB;
	}
	public void setAttrB(String attrB) {
		this.attrB = attrB;
	}
	public String getAttrC() {
		return attrC;
	}
	public void setAttrC(String attrC) {
		this.attrC = attrC;
	}
	public String getAttrD() {
		return attrD;
	}
	public void setAttrD(String attrD) {
		this.attrD = attrD;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public Long getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(Long subjectId) {
		this.subjectId = subjectId;
	}
	/**
	 * ���������������÷�ֵ
	 */
	public void setScoreByType(){
		if(questionType == QUESTION_TYPE_SINGLE)score = QUESTION_TYPE_SINGLE_SCORE; //��ѡ
		if(questionType == QUESTION_TYPE_MUILT)score = QUESTION_TYPE_MUILT_SCORE;  //��ѡ
		if(questionType == QUESTION_TYPE_CHARGE)score = QUESTION_TYPE_CHARGE_SCORE;  //�ж�
		if(questionType == QUESTION_TYPE_FILL)score = QUESTION_TYPE_FILL_SCORE;  //���
		if(questionType == QUESTION_TYPE_SHORT)score = QUESTION_TYPE_SHORT_SCORE;  //���
	}
}
