package a.b.c.com.board.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import a.b.c.com.board.service.BoardService;
import a.b.c.com.board.vo.BoardVO;
import a.b.c.com.board.vo.PagingVO;
import a.b.c.com.common.ChabunUtil;
import a.b.c.com.common.service.CommonService;

@Controller
public class BoardController {
	Logger logger = Logger.getLogger(BoardController.class);
		
	private BoardService boardService;
	private CommonService commonService;
	
	// 생성자 Autowired 
	@Autowired(required=false)	
	public BoardController( BoardService boardService
			               ,CommonService commonService) {
		this.boardService = boardService;
		this.commonService = commonService;
	}
	
	// 게시판 글 입력 폼
	@RequestMapping(value="boardForm", method=RequestMethod.GET)
	public String boardForm() {		
		return "board/boardForm";
	}
	
	// 글 목록 조회
	@RequestMapping(value="boardSelectAll", method=RequestMethod.GET)
	public String boardSelectAll(BoardVO bvo, Model model) {
		logger.info("BoardController boardSelectAll 함수 진입 >>> :");	
		
		List<BoardVO> listAll = boardService.boardSelectAll(bvo);
		logger.info("BoardController boardSelectAll listAll.size() >>> : " + listAll.size());
		
		if (listAll.size() > 0) { 
			model.addAttribute("listAll", listAll);
			return "board/boardSelectAll";
		}
		
		return "board/boardForm";
	}
	
	// 글 목록 조회
	@RequestMapping(value="boardSelect")
	public String boardSelect(BoardVO bvo, Model model) {
		logger.info("BoardController boardSelect 함수 진입 >>> :");	
		List<BoardVO> listAll = boardService.boardSelect(bvo);
		logger.info("BoardController boardSelectAll listAll.size() >>> : " + listAll.size());
		
		if (listAll.size() > 0) { 
			model.addAttribute("listAll", listAll);
			return "board/boardSelect";
		}
		
		return "board/boardForm";
	}
	
	// INSERT
	@RequestMapping(value="boardInsert")
	public String boardInsert(BoardVO bvo, Model model) {
		logger.info("BoardController boardInsert 함수 진입 >>> :");	
		
		String sbnum = ChabunUtil.getBoardChabun(commonService.getBoardChabun().getSbnum());
		logger.info("BoardController boardInsert() sbnum >>> : " + sbnum);
		bvo.setSbnum(sbnum);
		
		logger.info("bvo.getSbnum():" + bvo.getSbnum());
		logger.info("bvo.getSbpw():" + bvo.getSbpw());
				
		int res = boardService.boardInsert(bvo);		
		logger.info("BoardController boardInsert res >>> : " + res);
		
		
		if (res > 0) { 
			model.addAttribute("res", res);
			return "board/boardInsert";
		}
		
		return "board/boardForm";
	}
	
	// UPDATE
	@RequestMapping(value="boardUpdate")
	public String boardUpdate(BoardVO bvo, Model model) {
		logger.info("BoardController boardUpdate 함수 진입 >>> :");	
		logger.info("bvo.getSbnum():" + bvo.getSbnum());
		logger.info("bvo.getSbpw():" + bvo.getSbpw());
		
		int res = boardService.boardUpdate(bvo);		
		logger.info("BoardController boardUpdate res >>> : " + res);
		
		
		if (res > 0) { 
			model.addAttribute("res", res);
			return "board/boardUpdate";
		}
		
		return "board/boardForm";
	}
	
	// DELETE
	@RequestMapping(value="boardDelete")
	public String boardDelete(BoardVO bvo, Model model) {
		logger.info("BoardController boardDelete 함수 진입 >>> :");	
		logger.info("bvo.getSbnum():" + bvo.getSbnum());
		logger.info("bvo.getSbpw():" + bvo.getSbpw());
		
		int res = boardService.boardDelete(bvo);		
		logger.info("BoardController boardDelete res >>> : " + res);
		
		
		if (res > 0) { 
			model.addAttribute("res", res);
			return "board/boardDelete";
		}
		
		return "board/boardForm";
	}
	
	@RequestMapping(value="boardList")
	public String boardList(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		logger.info("BoardController boardList 함수 진입 >>> :");	
		int total = boardService.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("listAll", boardService.pselectBoard(vo));
		return "board/boardSelectAll";
	}
	
}
