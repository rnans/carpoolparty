package su.upload.model;

public class UploadDTO {

	private int idx;
	private String id;
	private String filename;
	private String filetype;
	private String filepath;
	private String poolname;
	
	public UploadDTO() {
		super();
	}

	public UploadDTO(int idx, String id, String filename, String filetype, String filepath, String poolname) {
		super();
		this.idx = idx;
		this.id = id;
		this.filename = filename;
		this.filetype = filetype;
		this.filepath = filepath;
		this.poolname = poolname;
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


	public String getFilename() {
		return filename;
	}


	public void setFilename(String filename) {
		this.filename = filename;
	}


	public String getFiletype() {
		return filetype;
	}


	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}


	public String getFilepath() {
		return filepath;
	}


	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}


	public String getPoolname() {
		return poolname;
	}


	public void setPoolname(String poolname) {
		this.poolname = poolname;
	}
	
}
