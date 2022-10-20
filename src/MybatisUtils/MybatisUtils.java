package MybatisUtils;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisUtils {
	//��ʼ������SqlSessionFactory
	private static SqlSessionFactory sqlSessionFactory = null;
	static{
		try{
			//��ȡmybaits-config.xml�ļ�
			InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//��ȡSqlSession
	public static SqlSession getSqlSession(){
		return sqlSessionFactory.openSession();
	}
	//��ȡSqlSessionFactory
	public static SqlSessionFactory getSessionFactory(){
		return sqlSessionFactory;
	}
}

