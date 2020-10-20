package com.antelopeh.core.freemarker;

import com.antelopeh.home.service.MenuService;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("UrlMethod")
public class UrlMethod implements TemplateMethodModelEx {

    @Autowired
    private MenuService menuService;

    @Override
    public Object exec(@SuppressWarnings("rawtypes") List arguments) throws TemplateModelException {
        try {
            if (!(arguments == null || arguments.isEmpty())){
                return menuService.selectUrlByName(arguments.get(0).toString());
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
