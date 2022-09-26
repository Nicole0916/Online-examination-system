package com.ischoolbar.programmer.util.dom4jUtil;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
/**
 * 增加试题
 * @author 李才宇
 *
 */
public class Add {
	public static void add(String id,String subjectId, String questionType, String title, String score, String attrA, String attrB, String attrC, String attrD, String answer, String createTime) throws DocumentException, UnsupportedEncodingException, FileNotFoundException {
	SAXReader reader = new SAXReader();  // 创建dom4j解析器
    Document document = reader.read(new File("question.xml"));  // 通过解析器读取xml文件
    //System.out.println(document.asXML());// 将其转换为默认XML文本
    Element root = document.getRootElement();  // 读取得到xml的根元素
    
    
    Element question = root.addElement("question").addAttribute("id", id);
    question.addElement("subjectId").addText(subjectId);  // Element指标签，Text指内容。
    question.addElement("questionType").addText(questionType);
    question.addElement("title").addText(title);
    question.addElement("score").addText(score);
    question.addElement("attrA").addText(attrA);
    question.addElement("attrB").addText(attrB);
    question.addElement("attrC").addText(attrC);
    question.addElement("attrD").addText(attrD);
    question.addElement("answer").addText(answer);
    question.addElement("createTime").addText(createTime);
    
    
    OutputFormat format = OutputFormat.createCompactFormat();  // 官网上搬下来的： compact意为紧凑的，袖珍的。
    format.setEncoding("UTF-8");
    XMLWriter writer = new XMLWriter(new FileOutputStream(new File("xml/News.xml")), format);
    try {
		writer.write(document); // 写入xml.
	} catch (IOException e) {
		// TODO 自动生成的 catch 块
		e.printStackTrace();
	}// 写入document里面（相当于更新操作）
    try {
		writer.close();
	} catch (IOException e) {
		// TODO 自动生成的 catch 块
		e.printStackTrace();
	}
    }
}
