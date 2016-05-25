package su.carinfo.model;

public class carInfoDTO {

	private int idx;
	private String id;
    private String driver;
    private String carId;
    private String carNum;
    private String carType;
    private String confirmPhoto;
    private String confirm;
    
	public carInfoDTO() {
		super();
	}
	
	

	public carInfoDTO(String id, String driver, String carId, String carNum, String carType, String confirmPhoto) {
		super();
		this.id = id;
		this.driver = driver;
		this.carId = carId;
		this.carNum = carNum;
		this.carType = carType;
		this.confirmPhoto = confirmPhoto;
	}



	public carInfoDTO(int idx, String id, String driver, String carId, String carNum, String carType,
			String confirmPhoto, String confirm) {
		super();
		this.idx = idx;
		this.id = id;
		this.driver = driver;
		this.carId = carId;
		this.carNum = carNum;
		this.carType = carType;
		this.confirmPhoto = confirmPhoto;
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
	public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	public String getCarNum() {
		return carNum;
	}
	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}
	public String getCarType() {
		return carType;
	}
	public void setCarType(String carType) {
		this.carType = carType;
	}
	public String getConfirmPhoto() {
		return confirmPhoto;
	}
	public void setConfirmPhoto(String confirmPhoto) {
		this.confirmPhoto = confirmPhoto;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	
    
}