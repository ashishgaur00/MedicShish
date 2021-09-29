package com.medic.MainController;

import com.medic.MasterEntityVO.ApplyTo;
import com.medic.MasterEntityVO.CalculatedOn;
import com.medic.MasterEntityVO.DiscountMater;
import com.medic.MasterEntityVO.DiscountType;
import com.medic.OperationDAO.DiscountMasterDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RequestMapping("/discountMaster")
@Controller
public class DiscountMaster {

    @Autowired
    DiscountMasterDAO discountMasterDAO;

    @RequestMapping(value = "/discountMasterTable", method = RequestMethod.GET)
    public ModelAndView discountMasterTable (HttpServletRequest request, HttpServletResponse response ) {
        ModelAndView mav = null;
        mav = new ModelAndView("discountMasterTable");
        mav.addObject("message", "Username or Password is wrong!!");
        return mav;
    }


    @RequestMapping("/create")
    public ModelAndView create(){

        ModelAndView mav = new ModelAndView("discountMasterCreate");
        List<DiscountType>  listOFDiscountType = discountMasterDAO.fetchOntheBaseOfDtype("DiscountType",DiscountType.class);
        List<CalculatedOn>  listOFCalculatedOn = discountMasterDAO.fetchOntheBaseOfDtype("CalculatedOn",CalculatedOn.class);
        List<ApplyTo>  listOFApplyTo = discountMasterDAO.fetchOntheBaseOfDtype("ApplyTo",ApplyTo.class);


        mav.addObject("listOFDiscountType", listOFDiscountType);
        mav.addObject("listOFCalculatedOn", listOFCalculatedOn);
        mav.addObject("listOFApplyTo", listOFApplyTo);
        DiscountMater discountMaster =  new DiscountMater();
        mav.addObject("discountMaster",discountMaster);


        return mav;
    }
    @RequestMapping("/save")
    @ResponseBody
    public int save (@ModelAttribute  DiscountMater discountMaster,
                     BindingResult result){

        System.out.println(discountMaster.getDiscountType().getId());
        System.out.println(discountMaster.getCode());
        System.out.println(discountMaster.getCalculatedOn());
        System.out.println(discountMaster.getApplyTo());
        System.out.println(discountMaster.getMinimunPurchase());
        System.out.println(discountMaster.getMinimunPurchaseAmount());
        System.out.println(discountMaster.getStartDate());

 return 1;
    }
}
