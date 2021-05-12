package a.b.c.com.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.board.vo.BoardVO;
import a.b.c.com.common.dao.CommonDAO;


@Service
@Transactional
public class CommonServiceImpl implements CommonService {

	@Autowired
	private CommonDAO commonDAO;
	
	@Override
	public BoardVO getBoardChabun() {
		// TODO Auto-generated method stub
		BoardVO bvo = commonDAO.getBoardChabun();
		return bvo;
	}

}
