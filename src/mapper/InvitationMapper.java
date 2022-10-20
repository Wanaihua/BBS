package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import Bean.Invitation;

public interface InvitationMapper {

	@Insert("insert into invitation(userId,topic,matter,postTime,author) values(#{userId},#{topic},#{matter},#{postTime},#{author})")
	@Options(useGeneratedKeys=true,keyProperty="postId")
	public int release(Invitation invitation);
	
	
	@Select("select * from invitation where userId=#{id}")
	public List<Invitation> look(Integer id);

	@Delete("delete from invitation where postId=#{id}")
	public int deletePost(Integer id);

	@Update("update invitation set topic=#{topic},matter=#{matter} where postId=#{postId}")
	public int updatePost(Invitation invitation);

	@Select("select * from invitation where postId=#{id}")
	public List<Invitation> findPost(int id);

	@Select("select * from invitation")
	public List<Invitation> findAll();

	@Select("select * from invitation LIMIT #{id},1")
	public List<Invitation> lookOne(Integer id);

	@Update("update user set userPoints=#{0} where userId=#{1}")
	public int refreshPoint(int i, int j);

	@Select("select userId from invitation where postId=#{id}")
	public int selectUseIdFromId(Integer id);


}
