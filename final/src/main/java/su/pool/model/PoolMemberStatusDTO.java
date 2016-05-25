package su.pool.model;

public class PoolMemberStatusDTO {

	private int idx;
	private String memberid;
	private int ownidx;
	private int aimidx;
	private String status;
	private String mans;
	
	
	
	public PoolMemberStatusDTO() {
		super();
	}
	
	
	
	public PoolMemberStatusDTO(String memberid, int aimidx) {
		super();
		this.memberid = memberid;
		this.aimidx = aimidx;
	}

	

	public PoolMemberStatusDTO(String memberid, int aimidx, String status) {
		super();
		this.memberid = memberid;
		this.aimidx = aimidx;
		this.status = status;
	}



	public PoolMemberStatusDTO(int idx, String memberid, int ownidx, int aimidx, String status, String mans) {
		super();
		this.idx = idx;
		this.memberid = memberid;
		this.ownidx = ownidx;
		this.aimidx = aimidx;
		this.status = status;
		this.mans = mans;
	}
	
	
	
	public PoolMemberStatusDTO(String memberid, int ownidx, String status, String mans) {
		super();
		this.memberid = memberid;
		this.ownidx = ownidx;
		this.status = status;
		this.mans = mans;
	}

	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public int getOwnidx() {
		return ownidx;
	}
	public void setOwnidx(int ownidx) {
		this.ownidx = ownidx;
	}
	public int getAimidx() {
		return aimidx;
	}
	public void setAimidx(int aimidx) {
		this.aimidx = aimidx;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMans() {
		return mans;
	}
	public void setMans(String mans) {
		this.mans = mans;
	}
	
	
}