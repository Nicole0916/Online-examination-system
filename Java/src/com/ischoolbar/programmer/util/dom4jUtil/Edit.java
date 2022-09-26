package com.ischoolbar.programmer.util.dom4jUtil;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.util.Iterator;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

/**
 * 编辑所选id的试题
 * @author 李才宇
 *
 */

public class Edit {
	public static void edit(String id,String subjectId, String questionType, String title, String score, String attrA, String attrB, String attrC, String attrD, String answer, String createTime) throws Exception {
        SAXReader reader = new SAXReader();  // 创建dom4j解析器
        Document document = reader.read(new File("question.xml"));  // 通过解析器读取xml文件
        //System.out.println(document.asXML());// 将其转换为默认XML文本
        Element root = document.getRootElement();  // 读取得到xml的根元素
        
        
        for(Element question:root.elements()){
            if(question.attribute("id").equals(id)) {
                //System.out.println("找到对应id的试题！");
            	Element _subjectId=question.element(subjectId);
            	Element _questionType=question.element(questionType);
            	Element _title=question.element(title);
            	Element _score=question.element(score);
            	Element _attrA=question.element(attrA);
            	Element _attrB=question.element(attrB);
            	Element _attrC=question.element(attrC);
            	Element _attrD=question.element(attrD);
            	Element _answer=question.element(answer);
            	Element _createTime=question.element(createTime);

            	_subjectId.setText(subjectId);
            	_questionType.setText(questionType);
            	_title.setText(title);
            	_score.setText(score);
            	_attrA.setText(attrA);
            	_attrB.setText(attrB);
            	_attrC.setText(attrC);
            	_attrD.setText(attrD);
            	_answer.setText(answer);
            	_createTime.setText(createTime);
                
            }
        }
                
        OutputFormat format = OutputFormat.createCompactFormat();  // 官网上搬下来的： compact意为紧凑的，袖珍的。
        format.setEncoding("UTF-8");
        XMLWriter writer = new XMLWriter(new FileOutputStream(new File("xml/News.xml")), format);
        writer.write(document);// 写入document里面（相当于更新操作）
        writer.close();
	}
	
}
