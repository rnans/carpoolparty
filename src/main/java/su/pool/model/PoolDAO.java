package su.pool.model;

import java.util.*;
import su.member.model.*;

public interface PoolDAO 
{
	public int poolMemberShortAdd(PoolDTO dto);
	
	public int poolMemberLongAdd(PoolDTO dto);
	
	public int poolMasterShortAdd(PoolDTO dto);
	
	public int poolMasterLongAdd(PoolDTO dto);
	
	public MemberDTO getAllUserInfo(String userid);
	
	public int getTotalCnt();
	
	public int getShortTotalCnt();
	
	public int getLongTotalCnt();
	
	public int getMasterTotalCnt();
	
	public int getMemberTotalCnt();
	
	public int getMasterIdx(String poolname);
	
	public List viewAllList(int cp, int listSize);
	
	public List viewShortList(int cp, int listSize);
	
	public List viewLongList(int cp, int listSize);
	
	public List viewMemberList(int cp, int ls);
	
	public List viewMasterList(int cp, int ls);
	
	public PoolDTO viewEachContent(int idx);
	
	public int poolShortEdit(PoolDTO dto);
	
	public int poolLongEdit(PoolDTO dto);
	
	public int poolDel(int idx);
	
	
}
