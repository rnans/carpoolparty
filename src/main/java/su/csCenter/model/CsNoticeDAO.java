package su.csCenter.model;

import java.util.List;

public interface CsNoticeDAO {

	public List<CsNoticeDTO> noticeList(int cp,int ls);
	 public int noticeTotalCnt();
	 public List<CsNoticeDTO> noticeContent(int idx);
	  public int noticeReadnum(int idx);
	  public int noticeAdd(CsNoticeDTO dto);
	  public int noticeUpdate(CsNoticeDTO dto);
	  public int noticeDelete(int idx);
	  public int newNoticeIdx();
	  public String newNoticeDate(int idx);
	  public String newNoticeSubject(int idx);
}
