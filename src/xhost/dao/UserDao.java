package xhost.dao;

import xhost.domain.Student;
import xhost.domain.User;

import java.sql.SQLException;

public interface UserDao {
    /**
     * 用户登录
     * @param username
     * @param password
     * @return
     */
    boolean login(String username,String password) throws SQLException;

    /**
     * 添加用户
     * @param user
     * @throws SQLException
     */
    void insert(User user) throws  SQLException;
}
