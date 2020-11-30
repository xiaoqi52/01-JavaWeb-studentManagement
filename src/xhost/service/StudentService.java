package xhost.service;

import xhost.domain.PageStudentBean;
import xhost.domain.Student;

import java.sql.SQLException;
import java.util.List;

/**
 * 这是学生的业务处理规范
 * @author 潇七
 */
public interface StudentService {
    /**
     * 查询所有学生信息
     * @return List<Student>
     */
    List<Student> findAll() throws SQLException;
    /**
     * 根据id查询单个学生对象
     * @param sid
     * @return
     * @throws SQLException
     */
    Student findStudentByid(int sid) throws  SQLException;
    /**
     * 添加学生
     * @param student 需要添加到数据库的学生对象
     * @throws SQLException
     */
    void insert(Student student) throws  SQLException;
    /**
     * 删除学生
     * @param sid
     * @throws SQLException
     */
    void delete( int sid)throws  SQLException;
    /**
     * 修改学生信息
     * @param student
     * @throws SQLException
     */
    void update(Student student) throws  SQLException;
    /**
     * 模糊查询实现
     * @param sname
     * @param gender
     * @return
     */
    List<Student> searchStudent(String sname,String gender) throws SQLException;
    /**
     * 查询当页的数据
     * @param currentPage
     * @return 集合
     * @throws SQLException
     */
      PageStudentBean findStudentByPage(int currentPage) throws SQLException;
}
