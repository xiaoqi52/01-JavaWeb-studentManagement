package xhost.dao.impl;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import xhost.dao.StudensDao;
import xhost.domain.Student;
import xhost.util.JDBCUtil;
import xhost.util.TextUtil;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDaoImpl implements StudensDao {

    /**
     * 查询所有学生信息
     * @return
     */
    @Override
    public List<Student> findAll() throws SQLException {
        QueryRunner query=new QueryRunner(JDBCUtil.getDataSource());
        return query.query("select * from stu", new BeanListHandler<Student>(Student.class));

    }

    /**
     * 根据id查询单个学生对象
     * @param sid
     * @return
     * @throws SQLException
     */
    @Override
    public Student findStudentByid(int sid) throws SQLException {
        QueryRunner query=new QueryRunner(JDBCUtil.getDataSource());
        return query.query("select * from stu where sid=?", new BeanHandler<Student>(Student.class),sid);

    }

    /**
     *添加学生
     * @param student  需要添加到数据库的学生对象
     * @throws SQLException
     */
    @Override
    public void insert(Student student) throws SQLException {
        QueryRunner query=new QueryRunner(JDBCUtil.getDataSource());
        query.update("insert into stu values(null,?,?,?,?,?,?)",
                student.getSname(),student.getGender(),student.getPhone(),student.getBirthday(),student.getHobby(),student.getInfo());
    }

    /**
     * 删除学生
     * @param sid
     * @throws SQLException
     */
    @Override
    public void delete(int sid) throws SQLException {
        QueryRunner query=new QueryRunner(JDBCUtil.getDataSource());
        query.update("delete from stu where sid=? ",sid);
    }
    /**
     * 修改学生信息
     * @param student
     * @throws SQLException
     */
    @Override
    public void update(Student student) throws SQLException {
        QueryRunner query=new QueryRunner(JDBCUtil.getDataSource());
        query.update("update stu set sname=?,gender=?,phone=?,birthday=?,hobby=?,info=? where sid=?",
                student.getSname(),
                student.getGender(),
                student.getPhone(),
                student.getBirthday(),
                student.getHobby(),
                student.getInfo(),
                student.getSid()
                );
    }

    /**
     * 模糊查询实现
     * @param sname
     * @param gender
     * @return
     */
    @Override
    public List<Student> searchStudent(String sname, String gender) throws SQLException {
        QueryRunner query=new QueryRunner(JDBCUtil.getDataSource());
        List<String> list=new ArrayList<String>();
        /*
         * 这里要分析一下：
         * 	如果只有姓名 ，select * from stu where sname like ? ;
         * 	如果只有性别 ， select * from stu where gender = ?
         *
         * 如果两个都有 select * from stu where sname like ? and gender=?
         *
         * 如果两个都没有就查询所有。
         *
         */
        String sql="select * from stu where 1=1";
        //判断有没有姓名， 如果有，就组拼到sql语句里面
        if(!TextUtil.isEmpty(sname)){
            sql=sql+"  and sname like ?";
            list.add("%"+sname+"%");
        }
        //判断有没有性别，有的话，就组拼到sql语句里面。
        if(!TextUtil.isEmpty(gender)){
            sql=sql+"  and gender=?";
            list.add(gender);
        }

        return query.query(sql , new BeanListHandler<Student>(Student.class) ,list.toArray() );
    }

    /**
     * 分页查询实现
     * @param currentPage
     * @return
     * @throws SQLException
     */
    @Override
    public List<Student> findStudentByPage(int currentPage) throws SQLException {
        QueryRunner query=new QueryRunner(JDBCUtil.getDataSource());

        return query.query("select * from stu limit ? offset ?",new BeanListHandler<Student>(Student.class),PAGE_SIZE,(currentPage-1)*PAGE_SIZE);
    }

    /**
     * 查询总的记录数
     * @return
     * @throws SQLException
     */
    @Override
    public int findCount() throws SQLException {
        QueryRunner query=new QueryRunner(JDBCUtil.getDataSource());
       Long resule= (Long) query.query("select count(*) from stu",new ScalarHandler());
        return resule.intValue();
    }



}


