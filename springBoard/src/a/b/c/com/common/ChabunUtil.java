package a.b.c.com.common;

public abstract class ChabunUtil {

	public static final String BIZ_GUBUN_B = "B"; //�Խ���
	
	public static String numPad(String c) {
		
		for(int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}
		return c;
	}
	

	

	
	// �Խ��� �� ��ȣ  
	public static String getBoardChabun(String boardNum) {
		
		return BIZ_GUBUN_B.concat(ChabunUtil.numPad(boardNum));
	}
	
	
	
	
	

}
