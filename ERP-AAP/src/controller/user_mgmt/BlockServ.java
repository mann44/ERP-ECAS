package controller.user_mgmt;

import iFaces.user_mgmt.UpdateData;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.user_mgmt.UpdateDataImp;

import bean.user_mgmt.UserMaster;

/**
 * Servlet implementation class BlockServ
 */
public class BlockServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlockServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String block_id=request.getParameter("b_id");
		UserMaster master=new UserMaster();
		master.setUser_id(Integer.parseInt(block_id));
		UpdateData u_obj= new UpdateDataImp();
		boolean flag=u_obj.blockUnblock(master);
		if(flag)
			response.sendRedirect("home.jsp?p=User Info&id="+block_id);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
