package br.com.zapeat.site.faces;

import java.util.Calendar;

import javax.faces.bean.ManagedBean;

import br.com.topsys.web.faces.TSMainFaces;

@ManagedBean
public class ContadorFaces extends TSMainFaces {

	public String getData(){
		
		StringBuilder str = new StringBuilder();
		
		Calendar c = Calendar.getInstance();
		
		c.add(Calendar.HOUR_OF_DAY, 1);
		
		str.append(getMes(c.get(Calendar.MONTH)));
		str.append(c.get(Calendar.DAY_OF_MONTH));
		str.append(", ");
		str.append(c.get(Calendar.YEAR));
		str.append(", ");
		str.append(c.get(Calendar.HOUR_OF_DAY));
		str.append(":");
		str.append(c.get(Calendar.MINUTE));
		
		return str.toString();
		
	}
	
	private String getMes(int mes){
		
		switch (mes) {
		case 9: return "october";
			
		default:
			return null;
		}
	}
	
}
