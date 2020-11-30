package xhost.servlet;

import xhost.domain.PageStudentBean;
import xhost.service.StudentService;
import xhost.service.impl.StudentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * 这是分页显示学生信息的servlet
 * @author  潇七
 */
@WebServlet(name = "StudentListPageServlet")
public class StudentListPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            //获取需要显示页码数
            int currentPage=Integer.parseInt(request.getParameter("currentPage"));
            //根据指定的页数，去获取该页的数据回来
            StudentService service=new StudentServiceImpl();
            PageStudentBean pageBean= service.findStudentByPage(currentPage);
            request.setAttribute("pageBean",pageBean);
            request.getRequestDispatcher("list_page.jsp").forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     doPost(request,response);
    }
}
