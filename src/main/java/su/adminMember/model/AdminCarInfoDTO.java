package su.adminMember.model;

public class AdminCarInfoDTO {

	private int idx;
	private String id;
    private String driver;
    private String carid;
    private String carnum;
    private String cartype;
    private String confirmphoto;
    private String confirm;
	
    public AdminCarInfoDTO() {
		super();
	}

	public AdminCarInfoDTO(int idx, String id, String driver, String carid, String carnum, String cartype,
			String confirmphoto, String confirm) {
		super();
		this.idx = idx;
		this.id = id;
		this.driver = driver;
		this.carid = carid;
		this.carnum = carnum;
		this.cartype = cartype;
		this.confirmphoto = confirmphoto;
		this.confirm = confirm;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public String getCarid() {
		return carid;
	}

	public void setCarid(String carid) {
		this.carid = carid;
	}

	public String getCarnum() {
		return carnum;
	}

	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}

	public String getCartype() {
		return cartype;
	}

	public void setCartype(String cartype) {
		this.cartype = cartype;
	}

	public String getConfirmphoto() {
		return confirmphoto;
	}

	public void setConfirmphoto(String confirmphoto) {
		this.confirmphoto = confirmphoto;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	
    
}
