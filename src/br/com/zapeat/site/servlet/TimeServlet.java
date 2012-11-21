package br.com.zapeat.site.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TimeServlet
 */
@WebServlet("/TimeServlet")
public class TimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TimeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
    	       throws ServletException, IOException { 
		response.setHeader("Cache-Control", "no-cache, must-revalidate"); // HTTP/1.1
		response.setHeader("Expires", "Fri, 1 Jan 2010 00:00:00 GMT"); // Date
																		// in
																		// the
																		// past
		response.setHeader("Content-type", "text/plain; charset=utf-8"); // MIME
																			// type
		String datetime = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss Z").format(new Date());
		response.setHeader("Content-length", String.valueOf(datetime.length()));
		response.getOutputStream().write(datetime.getBytes());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
