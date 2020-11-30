package xhost.servlet;

import xhost.domain.Student;
import xhost.service.StudentService;
import xhost.service.impl.StudentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Array;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

/**
 * 用于处理学生的添加请求
 * @author 潇七
 */
@WebServlet(name = "AddServlet")
public class AddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
               request.setCharacterEncoding("UTF-8");
               //获取客户端提交的数据
               String sname=request.getParameter("sname");
               String gender=request.getParameter("gender");
               String phone=request.getParameter("phone");
               String birthday=request.getParameter("birthday");
             //  String hobby=request.getParameter("hobby");
               String info=request.getParameter("info");
               String h[]=request.getParameterValues("hobby");
               String hobby= Arrays.toString(h);
               hobby= hobby.substring(1,hobby.length()-1);

               //添加信息到数据库
        Date date= null;
        try {
            date = new SimpleDateFormat("yyyy-MM-dd").parse(birthday);
            Student student=new Student(sname,gender,phone,date,hobby,info);
            StudentService service=new StudentServiceImpl();
            service.insert(student);
            //跳转页面
            request.getRequestDispatcher("StudentListServlet").forward(request,response);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             doPost(request,response);
    }
}
