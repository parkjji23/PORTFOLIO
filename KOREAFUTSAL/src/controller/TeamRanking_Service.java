package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LeagueDto;
import model.LeagueResultDto;
import model.LeagueResult_Action;


public class TeamRanking_Service implements Cominterface {
	static TeamRanking_Service impl = new TeamRanking_Service();

	public static TeamRanking_Service instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("TeamRanking_Service.java 접근");
		request.setCharacterEncoding("UTF-8");
		int t_code = Integer.parseInt(request.getParameter("teamcode"));
		LeagueResultDto leagueresult = new LeagueResultDto();
		
			
		
		leagueresult.setT_code(t_code);
		
		System.out.println("팀 코드 "+t_code);
		
		LeagueResult_Action teamranking = LeagueResult_Action.instance();
		
		ArrayList<LeagueResultDto> LeagueResult = (ArrayList<LeagueResultDto>) teamranking.getLeagueResult(leagueresult);
		ArrayList<LeagueResultDto> LeaguePoint = (ArrayList<LeagueResultDto>) teamranking.getLeaguePoint(leagueresult);
		ArrayList<LeagueDto> League = (ArrayList<LeagueDto>) teamranking.getLeague(leagueresult);
		
		request.setAttribute("LeagueResult", LeagueResult);
		request.setAttribute("LeaguePoint", LeaguePoint);
		request.setAttribute("League", League);
		System.out.println("LeagueResult에 입력 성공");
		return "team_ranking.jsp";

	}
}
