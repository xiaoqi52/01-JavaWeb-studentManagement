package xhost.servlet;

import xhost.dao.UserDao;
import xhost.dao.impl.UserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
//            HttpSession httpSession=request.getSession()
            UserDao dao=new UserDaoImpl();
            boolean flag=dao.login(username,password);
            if (flag){
                request.getRequestDispatcher("StudentListPageServlet?currentPage=1").forward(request,response);
//            request.getRequestDispatcher("list_page.jsp").forward(request,response);
            }else{
              response.getWriter().print("<script language='javascript'>alert('账号或者密码错误');window.location.href='index.jsp';</script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request,response);
    }
}
