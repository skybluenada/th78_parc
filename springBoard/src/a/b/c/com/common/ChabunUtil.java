package a.b.c.com.common;

public abstract class ChabunUtil {

	public static final String BIZ_GUBUN_B = "B"; //게시판
	
	public static String numPad(String c) {
		
		for(int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}
		return c;
	}
	

	

	
	// 게시판 글 번호  
	public static String getBoardChabun(String boardNum) {
		
		return BIZ_GUBUN_B.concat(ChabunUtil.numPad(boardNum));
	}
	
	
	
	
	

}
