package su.Page;

public class SuPage {

	public static String makePage(String pagename,int totalCnt, int listSize, int pageSize, int cp){
		
		StringBuffer sb=new StringBuffer();
		
		int pageCnt=(totalCnt/listSize)+1; //총 페이지수
		if(totalCnt%listSize==0)pageCnt--;
		
		int userGroup=cp/pageSize;
		if(cp%pageSize==0)userGroup--;	

		if(totalCnt!=0){
			
		if (userGroup != 0) {
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup - 1) * pageSize + pageSize;
			sb.append(temp);
			sb.append("'>&lt;&lt;</a>");
		}

		for (int i = (userGroup * pageSize) + 1; i <= (userGroup * pageSize) + pageSize; i++) {
			sb.append("&nbsp&nbsp");
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>");
			if (i == pageCnt) {
				break;
			}
		}
		
		if (userGroup != (pageCnt / pageSize) - (pageCnt % pageSize == 0 ? 1 : 0)) {
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup + 1) * pageSize + 1;
			sb.append(temp);
			sb.append("'>&gt;&gt;</a>");
		}
		}else{
			sb.append(1);
		}
		return sb.toString();
	}

}
