package com.ischoolbar.programmer.util.dom4jUtil;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.util.HashMap;
import java.util.Iterator;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

/**
 * 查询对应id的试题
 * @author 李才宇
 *
 */

public class Query {
	public static HashMap<String, String> query(String id) throws Exception {
		HashMap<String,String> map=new HashMap<String,String>();
        SAXReader reader = new SAXReader();  // 创建dom4j解析器
        Document document = reader.read(new File("question.xml"));  // 通过解析器读取xml文件
        //System.out.println(document.asXML());// 将其转换为默认XML文本
        Element root = document.getRootElement();  // 读取得到xml的根元素
        
        
        for(Element question:root.elements()){
            if(question.attribute("id").equals(id)) {
                //System.out.println("找到对应id的试题！");
            	map.put("subjectId",question.element("subjectId").getText());
                map.put("questionType",question.element("questionType").getText());
                map.put("title",question.element("title").getText());
                map.put("score",question.element("score").getText());
                map.put("attrA",question.element("attrA").getText());
                map.put("attrB",question.element("attrB").getText());
                map.put("attrC",question.element("attrC").getText());
                map.put("attrD",question.element("attrD").getText());
                map.put("answer",question.element("answer").getText());
                map.put("createTime",question.element("createTime").getText());
            }
        }
                
        OutputFormat format = OutputFormat.createCompactFormat();  // 官网上搬下来的： compact意为紧凑的，袖珍的。
        format.setEncoding("UTF-8");
        XMLWriter writer = new XMLWriter(new FileOutputStream(new File("question.xml")), format);
        writer.write(document);// 写入document里面（相当于更新操作）
        writer.close();
		return map;
	}
	
}
