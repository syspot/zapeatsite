package br.com.zapeat.site.util;

import java.io.IOException;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.context.ResponseWriter;

import com.sun.faces.renderkit.html_basic.TextRenderer;

public class InputRender extends TextRenderer {

	@Override
	protected void getEndTextToRender(FacesContext context, UIComponent component, String currentValue) throws java.io.IOException {

		String[] attributes = { "placeholder", "data-theme" };

		ResponseWriter writer = context.getResponseWriter();

		for (String attribute : attributes) {
			String value = (String) component.getAttributes().get(attribute);
			if (value != null) {
				writer.writeAttribute(attribute, value, attribute);
			}
		}

		super.getEndTextToRender(context, component, currentValue);

	}

	@Override
	public void decode(FacesContext context, UIComponent component) {
		super.decode(context, component);
	}

	@Override
	public void encodeEnd(FacesContext context, UIComponent component) throws IOException {
		super.encodeEnd(context, component);
	}

}
