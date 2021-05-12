package a.b.c.com.board.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.board.dao.BoardDAO;
import a.b.c.com.board.vo.BoardVO;
import a.b.c.com.board.vo.PagingVO;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {
	Logger logger = Logger.getLogger(BoardServiceImpl.class);
	
	private BoardDAO boardDAO;
	
	// 생성자에 @Autowired 어노테이션으로  DI (의존성 주입하기)
	@Autowired(required=false)
	public BoardServiceImpl(BoardDAO boardDAO){
		this.boardDAO = boardDAO;
	}
	
	@Override
	public List<BoardVO> boardSelect(BoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("BoardServiceImpl boardSelect 함수 진입 >>> : ");
		return boardDAO.boardSelect(bvo);
	}

	@Override
	public List<BoardVO> boardSelectAll(BoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("BoardServiceImpl boardSelectAll 함수 진입 >>> : ");
		return boardDAO.boardSelectAll(bvo);
	}

	@Override
	public int boardInsert(BoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("BoardServiceImpl boardInsert 함수 진입 >>> : ");
		logger.info("BoardServiceImpl bvo:" + bvo);	
		logger.info("BoardServiceImpl bvo.getSbnum():" + bvo.getSbnum());
		logger.info("BoardServiceImpl bvo.getSbpw():" + bvo.getSbpw());
		
		return boardDAO.boardInsert(bvo);
	}

	@Override
	public int boardUpdate(BoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("BoardServiceImpl boardUpdate 함수 진입 >>> : ");
		return boardDAO.boardUpdate(bvo);
	}

	@Override
	public int boardDelete(BoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("BoardServiceImpl boardSelectAll 함수 진입 >>> : ");
		return boardDAO.boardDelete(bvo);
	}
	
	
	@Override
	public int countBoard() {
		// TODO Auto-generated method stub
		return boardDAO.countBoard();
	}

	@Override
	public List<BoardVO> pselectBoard(PagingVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.pselectBoard(vo);
	}
}
