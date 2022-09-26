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
 * 删除所选id的试题
 * @author 李才宇
 *
 */

public class Delete {
	public static void delete(String id) throws Exception {
        SAXReader reader = new SAXReader();  // 创建dom4j解析器
        Document document = reader.read(new File("question.xml"));  // 通过解析器读取xml文件
        //System.out.println(document.asXML());// 将其转换为默认XML文本
        Element root = document.getRootElement();  // 读取得到xml的根元素
        
        
        for(Element question:root.elements()){
            if(question.attribute("id").equals(id)) {
                //System.out.println("找到对应id的试题！");
                root.remove(question);
            }
        }
                
        OutputFormat format = OutputFormat.createCompactFormat();  // 官网上搬下来的： compact意为紧凑的，袖珍的。
        format.setEncoding("UTF-8");
        XMLWriter writer = new XMLWriter(new FileOutputStream(new File("xml/News.xml")), format);
        writer.write(document);// 写入document里面（相当于更新操作）
        writer.close();
	}
	
}
