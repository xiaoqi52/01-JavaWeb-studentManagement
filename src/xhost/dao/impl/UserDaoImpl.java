package xhost.dao.impl;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import xhost.dao.UserDao;
import xhost.domain.User;
import xhost.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImpl implements UserDao {
    @Override
    public boolean login(String username, String password) throws SQLException {
//        QueryRunner query=new QueryRunner(JDBCUtil.getDataSource());
//        query.query("select * from t_user where username=? and password=?",new BeanListHandler<User>(User.class),username,password);
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            conn= JDBCUtil.getConn();
            // System.out.println("数据库状态："+conn.isClosed());
            String sql="select * from t_user where username=? and password=?";
            ps=conn.prepareStatement(sql);
            ps.setString(1,username);
            ps.setString(2,password);
            rs=ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            JDBCUtil.release(conn,ps,rs);
        }
        return false;

    }

    @Override
    public void insert(User user) throws SQLException {
        QueryRunner query=new QueryRunner(JDBCUtil.getDataSource());
        query.update("insert into t_user values(null,?,?)",user.getUsername(),user.getPassword());
    }
}
