package com.user.dao;
import org.mybatis.spring.SqlSessionTemplate;

@Repository
public class UserDaolmpl implements UserDao {
	@Transactional
	public int update_pw(User User) throws Exception{
		return sqlSession.update("UserMapper.update_pw", user);
	}
}
