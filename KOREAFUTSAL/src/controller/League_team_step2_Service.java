package controller;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.LeagueDto;
import model.League_team_step2_Action;
import model.TeamDto;

public class League_team_step2_Service implements Cominterface {
	static League_team_step2_Service impl = new League_team_step2_Service();

	public static League_team_step2_Service instance() {
		return impl;

	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String branch_name=request.getParameter("branch_name");
		branch_name= new String(branch_name.getBytes("8859_1"), "utf-8");
		int branch_no = Integer.parseInt(request.getParameter("branchNo"));
		String id = request.getParameter("id");
		League_team_step2_Action leaguemodel = League_team_step2_Action.instance();
		ArrayList<LeagueDto> leaguecode = (ArrayList<LeagueDto>) leaguemodel.getLeaguecode(branch_no);
		ArrayList<TeamDto> teamlist = (ArrayList<TeamDto>) leaguemodel.getTeamList(id);
//		League_BranchList_Action leaguebranchmodel = League_BranchList_Action.instance();
//		ArrayList<BranchDto> LeagueBranchList = (ArrayList<BranchDto>) leaguebranchmodel.getLeagueBranchList();
		System.out.println("리그코드는: "+leaguecode.get(0).getLeague_code());
		request.setAttribute("branch_name", branch_name);
		request.setAttribute("leaguecode", leaguecode);
		request.setAttribute("teamlist", teamlist);
		return "league_team_step2.jsp";

	}
}