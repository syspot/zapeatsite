package br.com.zapeat.site.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.topsys.util.TSUtil;
import br.com.zapeat.site.dao.CarroChefeDAO;
import br.com.zapeat.site.dao.CidadeDAO;
import br.com.zapeat.site.model.CarroChefeModel;
import br.com.zapeat.site.model.CidadeModel;
import br.com.zapeat.site.util.ZapeatUtil;

/**
 * Servlet implementation class CarroChefeServlet
 */
@WebServlet("/carrochefe")
public class CarroChefeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarroChefeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Long id = ZapeatUtil.getParamFormatado(request.getParameter("id"));
		
		CarroChefeModel carroChefe = new CarroChefeDAO().obter(id, null);
		
		if(TSUtil.isEmpty(carroChefe)){
			
			request.getRequestDispatcher("/index.jsf").forward(request, response);
			
		} else{
			
			StringBuilder str = new StringBuilder("/promocao.jsf?cidade=");
			
			CidadeModel cidade = new CidadeDAO().obter(carroChefe.getFornecedorModel().getCidadeModel());
			
			str.append(cidade.getNome());
			str.append("&carroChefeId=");
			str.append(carroChefe.getId());
			str.append("&estabelecimento_id=");
			str.append(carroChefe.getFornecedorModel().getId());
			
			request.getRequestDispatcher(str.toString()).forward(request, response);
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
