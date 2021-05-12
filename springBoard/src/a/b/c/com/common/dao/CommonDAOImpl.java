package a.b.c.com.common.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.com.board.vo.BoardVO;


@Repository
public class CommonDAOImpl implements CommonDAO {

	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public BoardVO getBoardChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getChabun");
	}

}
