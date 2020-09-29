package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TeamPageDto;
import model.Yonglist_Action;
import vo.PageInfo;
import vo.YonglistDto;

public class Yonglist_Service implements Cominterface {
	static Yonglist_Service impl = new Yonglist_Service();

	public static Yonglist_Service instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		int page=1;
		int limit=10;
		int listCount=1;
		ArrayList<YonglistDto> yonglist = new ArrayList<YonglistDto>();
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		if(request.getParameter("page")==null){
			page=1;
		}
		int startrow = (page - 1) * 9;
		//���� �� �������� �Ѿ���� ���ڵ��̴�. �ش� ���� �۸� select�ϱ����� �����´�.
		
		
		String searchType = request.getParameter("searchtype");
		String search = request.getParameter("search");
		if(search!=null)
			search= new String(search.getBytes("8859_1"), "utf-8");
		
		Yonglist_Action yonglist_Action = Yonglist_Action.instance();
		
		TeamPageDto teamPageDto = new TeamPageDto();
		teamPageDto.setPage(startrow);
		teamPageDto.setKeyword(search);
		teamPageDto.setSearchType(searchType);

		System.out.println("---------�����������������Դϴ�---------");
		System.out.println(teamPageDto.getPage());
		System.out.println(teamPageDto.getKeyword());
		System.out.println(teamPageDto.getSearchType());
		System.out.println("--------------------------------");
		
		
		yonglist = (ArrayList<YonglistDto>) yonglist_Action.getYongList(teamPageDto);
		listCount = yonglist_Action.getListCount(teamPageDto);

		//�� ������ ��.
   		int maxPage=(int)((double)listCount/limit+0.95); //0.95�� ���ؼ� �ø� ó��.
   		//���� �������� ������ ���� ������ ��(1, 11, 21 ��...)
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		//���� �������� ������ ������ ������ ��.(10, 20, 30 ��...)
   	        int endPage = startPage+10-1;

   		if (endPage> maxPage) endPage= maxPage;
   		
   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("yonglist", yonglist);
		return "yonglist.jsp";

	}

}