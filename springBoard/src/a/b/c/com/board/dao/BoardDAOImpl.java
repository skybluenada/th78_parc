package a.b.c.com.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.com.board.vo.BoardVO;
import a.b.c.com.board.vo.PagingVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	private Logger logger = Logger.getLogger(BoardDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	

	@Override
	public List<BoardVO> boardSelectAll(BoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("BoardDAOImpl boardSelectAll �Լ� ���� >>> : ");		
		return sqlSession.selectList("boardSelectAll");
	}

	@Override
	public List<BoardVO> boardSelect(BoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("BoardDAOImpl boardSelect �Լ� ���� >>> : ");		
		return sqlSession.selectList("boardSelect",bvo);
	}

	
	@Override
	public int boardInsert(BoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("BoardDAOImpl boardInsert �Լ� ���� >>> : ");		
		logger.info("BoardDAOImpl bvo.getSbnum():" + bvo.getSbnum());
		logger.info("BoardDAOImpl bvo.getSbpw():" + bvo.getSbpw());
		return sqlSession.insert("boardInsert",bvo);
	}

	@Override
	public int boardUpdate(BoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("EmpDAOImpl boardUpdate �Լ� ���� >>> : ");		
		return sqlSession.update("boardUpdate");
	}

	@Override
	public int boardDelete(BoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("EmpDAOImpl boardDelete �Լ� ���� >>> : ");		
		return sqlSession.update("boardDelete");
	}
	
	
	@Override
	public int countBoard() {
		return sqlSession.selectOne("countBoard");
	}

	@Override
	public List<BoardVO> pselectBoard(PagingVO vo) {
		return sqlSession.selectList("boardList");
	}
}
