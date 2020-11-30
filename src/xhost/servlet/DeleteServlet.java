package xhost.servlet;

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
 * 删除学生
 * @author 潇七
 */
@WebServlet(name = "DeleteServlet")
public class DeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
               doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            int sid= Integer.parseInt(request.getParameter("sid"));
            StudentService service=new StudentServiceImpl();
            service.delete(sid);
            request.getRequestDispatcher("StudentListServlet").forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
