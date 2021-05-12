package a.b.c.com.board.dao;

import java.util.List;

import a.b.c.com.board.vo.BoardVO;
import a.b.c.com.board.vo.PagingVO;

public interface BoardDAO {
	public List<BoardVO> boardSelect(BoardVO bvo);
	public List<BoardVO> boardSelectAll(BoardVO bvo);
	public int boardInsert(BoardVO bvo);
	public int boardUpdate(BoardVO bvo);
	public int boardDelete(BoardVO bvo);
	
	// 게시물 총 갯수
	public int countBoard();

	// 페이징 처리 게시글 조회
	public List<BoardVO> pselectBoard(PagingVO vo);
}
