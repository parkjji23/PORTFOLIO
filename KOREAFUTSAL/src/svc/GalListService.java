package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.BoardDAO;
import model.NoticeboardDto;
import model.TeamDto;
import vo.GalBoardDto;

public class GalListService {

	public int getListCount() throws Exception {
		System.out.println("팀게시판리스트카운트가져오기");
		int listCount = 0;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		listCount = boardDAO.selectListCount();
		close(con);
		return listCount;

	}

	public ArrayList<GalBoardDto> getArticleList(int page, int limit) throws Exception {
		ArrayList<GalBoardDto> articleList = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		articleList = boardDAO.selectArticleList(page, limit);

		close(con);
		return articleList;

	}

	public ArrayList<TeamDto> getTeamList() throws Exception {
		System.out.println("BoardListService.getArticleList(int page, int limit)");
		
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		ArrayList<TeamDto> teamList = boardDAO.selectTeamList();
		
		close(con);
		return teamList;

	}
	
	public int getListCountTeam(String t_code) throws Exception {
		System.out.println("팀게시판리스트카운트가져오기");
		int listCount = 0;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		listCount = boardDAO.selectListCountTeam(t_code);
		close(con);
		return listCount;

	}

	public ArrayList<GalBoardDto> getArticleListTeam(int page, String t_code) throws Exception {
		System.out.println("BoardListService.getArticleList(int page, int limit)");
		ArrayList<GalBoardDto> articleList = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		articleList = boardDAO.selectArticleListTeam(page, t_code);

		close(con);
		return articleList;

	}
	public static ArrayList<NoticeboardDto> getnoticelist() throws Exception{
		
		System.out.println("SELECT * FROM noticeboard_tb where N_STATE= '팀갤러리 공지사항';");
		ArrayList<NoticeboardDto> noticelist = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		noticelist = boardDAO.selectnoticelist();
		System.out.println("확인중 제발..."+noticelist);
		
		close(con);
		return noticelist;
		
	}

	
}
