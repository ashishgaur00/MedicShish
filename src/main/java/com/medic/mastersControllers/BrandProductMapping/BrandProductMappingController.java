package com.medic.mastersControllers.BrandProductMapping;



import com.medic.MasterEntityVO.wareInsert.Brands;
import com.medic.MasterEntityVO.wareInsert.ProductsMapping;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/brandProductMappingController")
public class BrandProductMappingController {

    @RequestMapping("/create")
    public ModelAndView create(){

        ModelAndView returnedPage = new ModelAndView("productMappingCreate");
        returnedPage.addObject("brand", new Brands());
        returnedPage.addObject("productsMapping", new ProductsMapping());

        return returnedPage;

    }

    @RequestMapping("/view")
    public ModelAndView view(){

        ModelAndView returnedPage = new ModelAndView("productMappingCreate");
        return returnedPage;

    }
    @RequestMapping("/save")
    public ModelAndView save(@ModelAttribute Brands Brand,
                             BindingResult result , String productJson){

        ModelAndView returnedPage = new ModelAndView("wareInsertDatatable");
        return returnedPage;

    }

    @RequestMapping("/update")
    public ModelAndView update(){

        ModelAndView returnedPage = new ModelAndView("productMappingCreate");
        return returnedPage;

    }
}
