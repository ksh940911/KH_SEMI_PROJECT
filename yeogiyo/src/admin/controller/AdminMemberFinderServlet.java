package admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MvcUtils;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberFindetServlet
 */
@WebServlet("/admin/memberFinder")
public class AdminMemberFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		final int numPerPage = 10;
		int cPage = 1;

		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
		}

		Map<String, String> param = new HashMap<>();
		param.put("searchType", searchType);
		param.put("searchKeyword", searchKeyword);
		param.put("start", String.valueOf((cPage - 1) * numPerPage + 1));
		param.put("end", String.valueOf(cPage * numPerPage));

		List<Member> list = memberService.searchMember(param);
		int totalContents = memberService.searchMemberCount(param);

		String url = request.getRequestURI() + "?searchType=" + searchType + "&searchKeyword=" + searchKeyword;
		String pageBar = MvcUtils.getPageBar(cPage, numPerPage, totalContents, url);

		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/WEB-INF/views/admin/memberManage.jsp").forward(request, response);
	}

}
