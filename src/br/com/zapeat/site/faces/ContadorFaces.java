package br.com.zapeat.site.faces;

import java.util.Calendar;

import javax.faces.bean.ManagedBean;

import br.com.topsys.web.faces.TSMainFaces;

@ManagedBean(name="contadorFaces")
public class ContadorFaces extends TSMainFaces {
	
	private String dataFormatada;
	
	public ContadorFaces() {
		this.setDataFormatada(this.getData());
		
		System.out.println(this.dataFormatada);
	}

	public String getData(){
		
		StringBuilder str = new StringBuilder();
		
		Calendar c = Calendar.getInstance();
		
		c.add(Calendar.HOUR_OF_DAY, 1);
		
		str.append(getMes(c.get(Calendar.MONTH)));
		str.append(c.get(Calendar.DAY_OF_MONTH));
		str.append(", ");
		str.append(c.get(Calendar.YEAR));
		str.append(" ");
		str.append(c.get(Calendar.HOUR_OF_DAY));
		str.append(":");
		str.append(c.get(Calendar.MINUTE));
		str.append(":");
		str.append(c.get(Calendar.SECOND));
		
		return str.toString();
		
	}
	
	private String getMes(int mes){
		
		switch (mes) {
		
		case 0: return "january ";
		
		case 1: return "february ";
		
		case 2: return "march ";
		
		case 3: return "april ";
		
		case 4: return "may ";
		
		case 5: return "june ";
		
		case 6: return "july ";
		
		case 7: return "august ";
		
		case 8: return "september ";
		
		case 9: return "october ";
		
		case 10: return "november ";
		
		case 11: return "december ";
			
		default:
			return null;
		}
	}

	public String getDataFormatada() {
		return dataFormatada;
	}

	public void setDataFormatada(String dataFormatada) {
		this.dataFormatada = dataFormatada;
	}

	
	
}
