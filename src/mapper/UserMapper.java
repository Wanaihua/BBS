package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import Bean.Rootr;
import Bean.User;

public interface UserMapper {

	@Insert("insert into user(userName,userPass,userEmail,userNickname,userBirthday,sex,userPoints,userRemark) values(#{userName},#{userPass},#{userEmail},#{userNickname},#{userBirthday},#{sex},0,#{userRemark})")
	@Options(useGeneratedKeys=true,keyProperty="userId")
	int insert(User user);
	
	@Select("select * from user where userName=#{userName} and userPass=#{userPass}")
	List<User> login(User user);
	
	@Select("select * from user where userId=#{id}")
	List<User> information(Integer id);

	@Update("update user set userName=#{userName},userPass=#{userPass},userEmail=#{userEmail},userNickname=#{userNickname},userBirthday=#{userBirthday},sex=#{sex},userRemark=#{userRemark} where userId=#{userId}")
	int update(User user);

	@Select("select * from rootr where userName=#{userName} and userPass=#{userPass}")
	List<Rootr> rootLogin(User user);
	
	@Select("select * from rootr where userId=#{id}")
	List<Rootr> findRoot(Integer id);
	
	@Select("select * from user where userName=#{userName}")
	List<User> findName(User user);

	@Select("select * from user where userId!=1 order by userPoints desc; ")
	List<User> Rank();
	



	
	
}
