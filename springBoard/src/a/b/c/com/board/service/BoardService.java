package a.b.c.com.board.service;

import java.util.List;

import a.b.c.com.board.vo.BoardVO;
import a.b.c.com.board.vo.PagingVO;

public interface BoardService {
	public List<BoardVO> boardSelect(BoardVO bvo);
	public List<BoardVO> boardSelectAll(BoardVO bvo);
	public int boardInsert(BoardVO bvo);
	public int boardUpdate(BoardVO bvo);
	public int boardDelete(BoardVO bvo);
	
	// �Խù� �� ����
	public int countBoard();

	// ����¡ ó�� �Խñ� ��ȸ
	public List<BoardVO> pselectBoard(PagingVO vo);
}
