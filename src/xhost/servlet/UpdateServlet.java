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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

/**
 * 修改学生信息
 * @author 潇七
 */
@WebServlet(name = "UpdateServlet")
public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            request.setCharacterEncoding("UTF-8");
            //获取客户端提交的数据
            int sid=Integer.parseInt(request.getParameter("sid"));
            String sname=request.getParameter("sname");
            String gender=request.getParameter("gender");
            String phone=request.getParameter("phone");
            String birthday=request.getParameter("birthday");
            String info=request.getParameter("info");
            String h[]=request.getParameterValues("hobby");
            String hobby= Arrays.toString(h);
            hobby= hobby.substring(1,hobby.length()-1);
            Date date = null;
            date = new SimpleDateFormat("yyyy-MM-dd").parse(birthday);
            //更新数据库信息
            Student student=new Student(sid,sname,gender,phone,date,hobby,info);
            StudentService service=new StudentServiceImpl();
            service.update(student);
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
