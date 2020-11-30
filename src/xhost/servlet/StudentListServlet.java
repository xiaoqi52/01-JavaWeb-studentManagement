package xhost.servlet;

import xhost.dao.StudensDao;
import xhost.dao.impl.StudentDaoImpl;
import xhost.domain.Student;
import xhost.service.StudentService;
import xhost.service.impl.StudentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * 负责查询所有的学生信息，然后显示到list.jsp页面
 * @author 潇七
 */

@WebServlet(name = "StudentListServlet")
public class StudentListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
               doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            //查询出来所有的学生
            StudentService service=new StudentServiceImpl();
            List<Student> list= service.findAll();
            //把数据存到作用域
            request.setAttribute("list",list);
            //跳转页面
            request.getRequestDispatcher("list.jsp").forward(request,response);
           // response.sendRedirect("list.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
