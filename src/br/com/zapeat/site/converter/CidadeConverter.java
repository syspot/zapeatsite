package br.com.zapeat.site.converter;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;
import javax.faces.convert.FacesConverter;

import br.com.zapeat.site.dao.CidadeDAO;
import br.com.zapeat.site.model.CidadeModel;

@FacesConverter(value="cidadeConverter")
public class CidadeConverter implements Converter{

	public Object getAsObject(FacesContext facesContext, UIComponent component, String submittedValue) {  
		
        if (submittedValue.trim().equals("")) {  
            
        	return null;
        	
        } else {
        	
        	CidadeDAO cidadeDAO = new CidadeDAO();
        	
        	try {
        		
                Long id = Long.parseLong(submittedValue);  
  
                return cidadeDAO.obter(new CidadeModel(id)); 
  
            } catch(NumberFormatException exception) {  
                throw new ConverterException(new FacesMessage(FacesMessage.SEVERITY_ERROR, "Erro de Conversão", "Cidade inválida"));  
            }  
        }  
  
    }  
  
    public String getAsString(FacesContext facesContext, UIComponent component, Object value) {  
        if (value == null || value.equals("")) {  
            return "";  
        } else {  
            return String.valueOf(((CidadeModel) value).getNome());  
        }  
    }  

}
