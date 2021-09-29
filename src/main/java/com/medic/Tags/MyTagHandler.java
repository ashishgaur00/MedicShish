package com.medic.Tags;

import org.springframework.web.servlet.tags.form.InputTag;
import org.springframework.web.servlet.tags.form.TagWriter;

import javax.servlet.jsp.JspException;


public class MyTagHandler extends InputTag {
    private static final long serialVersionUID = 1L;
    private boolean render;

    public boolean isRender() {
        return render;
    }

    public void setRender(boolean render) {
        this.render = render;
    }

    protected int writeTagContent(TagWriter tagWriter) throws JspException {

            super.writeTagContent(tagWriter);
            return SKIP_BODY;

    }
}