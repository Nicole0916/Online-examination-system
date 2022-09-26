package com.ischoolbar.programmer.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.XMLWriter;

public class timeUtil {
public static void toXML() throws SQLException, ClassNotFoundException{
        
		Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection=null;
        PreparedStatement statement=null;
        ResultSet rs=null;
        connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_online_exam?serverTimezone=UTC","root","123456");
        String sql="SELECT * FROM  `question`";
        
        
         Document document = DocumentHelper.createDocument();      
         Element root = document.addElement("questions");// 创建根节点     
         
        
        try {
            statement=connection.prepareStatement(sql);
            rs=statement.executeQuery();
            while(rs.next()){
                
            	Element id = root.addElement("question").addAttribute("id", rs.getString("id"));
            	//System.out.println(rs.getString("id"));
                    Element subjectId = id.addElement("subjectId");
                    subjectId.setText(rs.getString("subjectId"));
                    Element questionType = id.addElement("questionType");
                    questionType.setText(rs.getString("questionType"));
                    Element title = id.addElement("title");
                    title.setText(rs.getString("title"));
                    Element score = id.addElement("score");
                    score.setText(rs.getString("score"));
                    Element attrA = id.addElement("attrA");
                    attrA.setText(rs.getString("attrA"));
                    Element attrB = id.addElement("attrB");
                    attrB.setText(rs.getString("attrB"));
                    Element attrC = id.addElement("attrC");
                    attrC.setText(rs.getString("attrC"));
                    Element attrD = id.addElement("attrD");
                    attrD.setText(rs.getString("attrD"));
                    Element answer = id.addElement("answer");
                    answer.setText(rs.getString("answer"));
                    Element createTime = id.addElement("createTime");
                    createTime.setText(rs.getString("createTime"));
                        

            }
            XMLWriter writer=new XMLWriter(new FileWriter(new File("question.xml"))); 
            writer.write(document);
            writer.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }





public static void main(String[] args) throws SQLException, ClassNotFoundException {
    toXML();
    System.out.println("运行成功！");
}

}