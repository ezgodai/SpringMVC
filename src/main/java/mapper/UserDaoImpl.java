package mapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pojo.Conditions;
import pojo.Student;
import pojo.User;

@Service
public class UserDaoImpl implements UserMapper {

	@Autowired
	private UserMapper userMapper;

	@Override
	public List<Student> findAll() {
		// TODO Auto-generated method stub
		// List<Student> all = userMapper.FindAll();
		return userMapper.findAll();
	}

	@Override
	public Student findOneByid(Integer id) {
		// TODO Auto-generated method stub

		return userMapper.findOneByid(id);
	}

	@Override
	public void submitStu(Student student) {
		// TODO Auto-generated method stub
		userMapper.submitStu(student);
	}

	@Override
	public void deleteStu(Integer[] ids) {
		// TODO Auto-generated method stub
		userMapper.deleteStu(ids);
	}

	@Override
	public Integer login(User user) {
		return userMapper.login(user);
	}

	@Override
	public void addStu(Student student) {
		// TODO Auto-generated method stub
		userMapper.addStu(student);
	}

	@Override
	public List<Student> query(Conditions conditions) {
		// TODO Auto-generated method stub
		return userMapper.query(conditions);
	}

	@Override
	public Integer checkUsername(User user) {
		// TODO Auto-generated method stub

		return userMapper.checkUsername(user);
	}

}
