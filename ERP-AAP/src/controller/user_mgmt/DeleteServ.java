package controller.user_mgmt;

import iFaces.user_mgmt.DaoMethods;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.user_mgmt.DaoMethodsImp;

/**
 * Servlet implementation class DeleteServ
 */
public class DeleteServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String delete_id=request.getParameter("d_id");
		DaoMethods d_obj = new DaoMethodsImp();
		boolean flg=d_obj.deleteUser(Integer.parseInt(delete_id));
		if(flg){
			response.sendRedirect("home.jsp?p=View User");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
