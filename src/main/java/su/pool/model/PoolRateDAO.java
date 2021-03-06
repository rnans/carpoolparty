package su.pool.model;

import java.util.*;

public interface PoolRateDAO {

	public PoolRateAvgDTO getAvrRateByAimid(String aimid);
	
	public int rateWrite(PoolRateDTO dto);
	
	public List getListByUserid(String id);
	
	public List getListByAimid(String aimid);
	
	public int rateDel(int idx);
	
	public int rateEdit(PoolRateDTO dto);
	
	public List checkRate(String id, String aimid);
}
