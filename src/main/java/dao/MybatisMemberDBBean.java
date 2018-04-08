package dao;   

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.MemberDataBean;

import org.apache.ibatis.session.SqlSession;

public class MybatisMemberDBBean extends MybatisConnector{
	private final String namespace = "ldg.member";
	private static MybatisMemberDBBean instance=new MybatisMemberDBBean();
	SqlSession sqlSession;

	public static MybatisMemberDBBean getInstance(){
		return instance;
	}

	public int confirmId(String id) {
		sqlSession=sqlSession();  
		System.out.println("confirmId:");
		try{
			HashMap map=new HashMap();
			map.put("id", id); 
			
			

			return sqlSession.selectOne(namespace+".confirmId",map);

		}finally{
			sqlSession.close();
		}
	}

	public void insertMember(MemberDataBean member) {
		sqlSession=sqlSession(); 
		System.out.println(member);
		try{ 
			HashMap map=new HashMap();
			map.put("member", member);

			System.out.println("insertMember:");
			int result =sqlSession.insert(namespace+".insertMember", map); 
			System.out.println("insert    Ok:"+result);
		}catch (Exception e){ 
			e.printStackTrace();
		}finally{
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public int userCheck(String id, String passwd) {

		sqlSession=sqlSession(); 
		int x=-1;
		try{
			HashMap map=new HashMap();
			map.put("id", id);
			System.out.println("userCheck:");

			String dbPasswd =  sqlSession.selectOne(namespace+".userCheck",map);
			if(dbPasswd != null){
				if(dbPasswd.equals(passwd)){
					x = 1;
				}else{
					x = 0;
				}
			}else{
				x = -1;
			}
			System.out.println("dd"+dbPasswd);
		}catch(Exception ex){ex.printStackTrace();
		}finally {

			sqlSession.commit();
			sqlSession.close();
			return x;

		}
	
		}

	public String Password(String id, String name, String birth)
	         throws Exception {
	      System.out.println("password:");
	      sqlSession = sqlSession();
	      String password = null;
	      HashMap map = new HashMap();
	      map.put("id", id);
	      map.put("name", name);
	      map.put("birth", birth);
	      String result = "";
	      System.out.println(id + "/" + name +"/"+ birth);
	      try {
	         password = (String) sqlSession.selectOne(namespace + ".Password",map);
	         if(password != null) {
	            System.out.println("MybatisMemberDBBean Password res : " + password);
	         } else { 
	            System.out.println("null��");
	            password = "";
	         }
	      } finally {
	            sqlSession.close();
	      }
	      System.out.println("mybatisMemberDbBean password return res : " + password);
	      return password;
	      

	   }

	public String Id(String name, MemberDataBean member) {
		
		 System.out.println("id:");
	      sqlSession = sqlSession();
	      String id = null;
	      HashMap map = new HashMap();
	      map.put("name", name);
	      map.put("mobile", member.getMobile());
	      String result = ""; 
	      System.out.println( name + "/" + member);
	      try {
	    	  id = (String) sqlSession.selectOne(namespace + ".id",map);
	         if(id != null) {
	            System.out.println("MybatisMemberDBBean id res : " + id);
	         } else { 
	            System.out.println("null��");
	            id = "";
	         }
	      } finally {
	            sqlSession.close();
	      }
	      System.out.println("mybatisMemberDBBean id return res : " + id);
	      return id;
		
	}
	public MemberDataBean getMember(String id) {
		sqlSession=sqlSession();
		HashMap map=new HashMap();
		map.put("id", id);
		MemberDataBean article=new MemberDataBean();

		try{ 
			return sqlSession.selectOne(namespace+".getMember",map);

		}finally{sqlSession.commit();
		sqlSession.close();
		return article;
		}
	}

	public MemberDataBean getArticle(String id) throws Exception {
        sqlSession = sqlSession();
        Map map = new HashMap();
        map.put("id", id);
       MemberDataBean article = new MemberDataBean();
        try {
           article = (MemberDataBean) sqlSession.selectOne(namespace + ".getArticle", map);
        } finally {
           // TODO: handle finally clause
           sqlSession.commit();
           sqlSession.close();
           return article;
        }
     }

	public int updateArticle(MemberDataBean article) {
		
		sqlSession = sqlSession();
        HashMap map = new HashMap();
        map.put("id", article.getId());
        int x = -1;
        try {
           
           //String dbpasswd = (String) sqlSession.selectOne(namespace + ".updateArticle", map);
              x = sqlSession.update(namespace + ".update_update", article);     
           
        } finally {
           sqlSession.commit();
           sqlSession.close();
        }
        return x;
     }

	
	public int deleteArticle(String id, String passwd) throws Exception {
        sqlSession = sqlSession();
        HashMap map = new HashMap();
        map.put("id", id);
        int x = -1;
        try {
           String dbpasswd = (String) sqlSession.selectOne(namespace + ".update_passwd", map);
           if (dbpasswd.equals(passwd)) {
              x = sqlSession.delete(namespace + ".delete", map);
           }
        } finally {
           sqlSession.commit();
           sqlSession.close();
        }
        return x;
     }
	
public int updateArticle1(MemberDataBean article) {
		
		sqlSession = sqlSession();
        HashMap map = new HashMap();
        map.put("id", article.getId());
        int x = -1;
        try {
           
           //String dbpasswd = (String) sqlSession.selectOne(namespace + ".updateArticle", map);
              x = sqlSession.update(namespace + ".update_update1", article);     
           
        } finally {
           sqlSession.commit();
           sqlSession.close();
        }
        return x;
     }

	public List wishListInfo(String id) {
		
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("id", id);
		List li = null;
		try {
			li = sqlSession.selectList(namespace+".wishListInfo", map);
			return li;
		} finally {
			sqlSession.close();
		}
	}
	//복기
		public String getFavoriteList(String memberID) {
			String memID=memberID;  
			if(memID==null||memID==""){
				memID="bokki";
			}
			sqlSession = sqlSession();
			HashMap map = new HashMap();
			map.put("memberID", memID);
			try {
				return sqlSession.selectOne(namespace + ".getFavoriteList",map);
			} finally {
				sqlSession.close();
			}
		}
		public List getTheaterList() {

			sqlSession = sqlSession();
			
			List li = null;
			try {
				li = sqlSession.selectList(namespace+".getTheaterList");
				return li;
			} finally {
				sqlSession.close();
			}
		}

}


