package mapper;

import java.util.List;

import pojo.Conditions;
import pojo.Student;
import pojo.User;

public interface UserMapper {
    List<Student> findAll();

    Student findOneByid(Integer id);

    void submitStu(Student student);

    void deleteStu(Integer[] ids);

    Integer login(User user);

    void addStu(Student student);

    List<Student> query(Conditions conditions);

    Integer checkUsername(User user);
}
