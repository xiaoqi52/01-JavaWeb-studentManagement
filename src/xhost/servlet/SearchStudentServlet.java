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
import java.sql.SQLException;
import java.util.List;

/**
 * 模糊查询
 * @author 潇七
 */
@WebServlet(name = "SearchStudentServlet")
public class SearchStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        //获取查询条件数据

        try {
            String sname=request.getParameter("sname");
            String gender=request.getParameter("gender");

            StudentService service=new StudentServiceImpl();
            List<Student> list= service.searchStudent(sname,gender);
            request.setAttribute("list",list);
            request.getRequestDispatcher("list.jsp").forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                  doPost(request,response);
    }
}
