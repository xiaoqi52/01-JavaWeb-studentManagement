package xhost.service.impl;

import xhost.dao.StudensDao;
import xhost.dao.impl.StudentDaoImpl;
import xhost.domain.PageStudentBean;
import xhost.domain.Student;
import xhost.service.StudentService;

import java.sql.SQLException;
import java.util.List;

/**
 * 这是学生的业务实现
 * @author 潇七
 */
public class StudentServiceImpl implements StudentService {
    /**
     * 查询所有学生信息
     * @return
     * @throws SQLException
     */
    @Override
    public List<Student> findAll() throws SQLException {
        StudensDao studensDao=new StudentDaoImpl();
        return studensDao.findAll();
    }

    /**
     * 根据id查询单个学生对象
     * @param sid
     * @return
     * @throws SQLException
     */
    @Override
    public Student findStudentByid(int sid) throws SQLException {
        StudensDao studensDao=new StudentDaoImpl();
        return studensDao.findStudentByid(sid);
    }

    /**
     * 添加学生
     * @param student 需要添加到数据库的学生对象
     * @throws SQLException
     */
    @Override
    public void insert(Student student) throws SQLException {
        StudensDao studensDao=new StudentDaoImpl();
        studensDao.insert(student);
    }
    /**
     * 删除学生
     * @param sid
     * @throws SQLException
     */
    @Override
    public void delete(int sid) throws SQLException {
        StudensDao studensDao=new StudentDaoImpl();
        studensDao.delete(sid);
    }
    /**
     * 修改学生信息
     * @param student
     * @throws SQLException
     */
    @Override
    public void update(Student student) throws SQLException {
        StudensDao studensDao=new StudentDaoImpl();
        studensDao.update(student);
    }
    /**
     * 模糊查询
     * @param sname
     * @param gender
     * @return集合
     */
    @Override
    public List<Student> searchStudent(String sname, String gender) throws SQLException {
        StudensDao studensDao=new StudentDaoImpl();
        return studensDao.searchStudent(sname,gender);
    }

    /**
     * 查询当页数据
     * @param currentPage
     * @return
     * @throws SQLException
     */
    @Override
    public PageStudentBean findStudentByPage(int currentPage) throws SQLException {
        StudensDao studensDao=new StudentDaoImpl();
        PageStudentBean pageStudentBean=new PageStudentBean();
        pageStudentBean.setCurrentPage(currentPage);
        pageStudentBean.setPageSize(studensDao.PAGE_SIZE);
        List<Student> list= studensDao.findStudentByPage(currentPage);
        pageStudentBean.setList(list);
        int count=studensDao.findCount();
        pageStudentBean.setTotalSize(count);
        pageStudentBean.setTotalPage(count%10==0?count/studensDao.PAGE_SIZE:(count/studensDao.PAGE_SIZE)+1);
        return pageStudentBean ;
    }
}
