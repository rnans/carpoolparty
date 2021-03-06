package su.message.model;

import java.util.List;

import su.member.model.MemberDTO;
import su.upload.model.UploadDTO;

public interface MessageDAO {

	public int messageSend(MessageDTO dto);
	public List<MessageDTO> messageShow(int cp, int ls,String sid);
	public int messageTotalCnt(String userid);
	public List<MessageDTO> messageContent(int idx);
	public int messageRewrite(MessageDTO dto);
	public int messageDel(int idx);
	public int messageReading(int idx);
	public int messageNumber(String sid);
	public MessageDTO mContent(int idx);
	public int messageAllDel(String userid);
	public int noReadDel(String userid);
	public MessageDTO messageInfo(int idx);
	public List<MessageDTO> alramView(String userid);
	public List<UploadDTO> mImage();
	public List<MemberDTO> profile(String sendid);
	public UploadDTO proImg(String sendid);
}
