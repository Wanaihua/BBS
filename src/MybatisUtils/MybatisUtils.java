package MybatisUtils;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisUtils {
	//初始化创建SqlSessionFactory
	private static SqlSessionFactory sqlSessionFactory = null;
	static{
		try{
			//读取mybaits-config.xml文件
			InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//获取SqlSession
	public static SqlSession getSqlSession(){
		return sqlSessionFactory.openSession();
	}
	//获取SqlSessionFactory
	public static SqlSessionFactory getSessionFactory(){
		return sqlSessionFactory;
	}
}

