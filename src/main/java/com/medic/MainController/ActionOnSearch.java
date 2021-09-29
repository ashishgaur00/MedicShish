package com.medic.MainController;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.medic.LoginPojo.Login;
import com.medic.LoginPojo.SearchVO;
import com.medic.OperationDAO.ActionOnSearchDAO;
import com.medic.OperationPojo.Contact;
import com.medic.OperationPojo.MedicDetail;


@RequestMapping("/actionOnSearch")
@Controller
public class ActionOnSearch {
	
	@Autowired
	ActionOnSearchDAO actionOnSearchDAO;
	
	@RequestMapping(value = "/allRelated",produces="application/json")
	@ResponseBody
	  public List <SearchVO>likedSearchAllRelated( @RequestParam("searchedWord") String searchedWord,ModelMap model,HttpServletRequest request, HttpServletResponse response) {
		System.out.println("hit came from js for modal");
		System.out.println("hit came from js for modal"+ searchedWord);

		List <SearchVO> returnedAllMedList = new ArrayList();
    /*MedicDetail	medicDetail = new MedicDetail();
    medicDetail.setId(1);
    medicDetail.setMedicName("Paracetamol");
    medicDetail.setPacketAvailable(98);
    medicDetail.setPrizePerPacket(12);;
    medicDetail.setQuantityInPacket(10);;
	Integer i =	this.actionOnSearchDAO.saveMedicDetail(medicDetail);*/
	//List <Contact> getAll =this.actionOnSearchDAO.getAll();
	List <MedicDetail> likeSerachOfMedicList =this.actionOnSearchDAO.getLikeSerachOfMedic(searchedWord);
	for(MedicDetail single :likeSerachOfMedicList){
		SearchVO searchvo = new SearchVO();
		long id =single.getId().longValue();
		searchvo.setId(id);
		searchvo.setName(single.getMedicName());
		searchvo.setTtlQuantityPresent(single.getPacketAvailable());
		searchvo.setPrize(single.getPrizePerPacket());
		returnedAllMedList.add(searchvo);
	}


	  return returnedAllMedList;
	  }
	
	@RequestMapping(value = "/search",produces="application/json")
	@ResponseBody
	  public List <SearchVO>search(  @RequestParam("searchedWord") String searchedWord, @RequestParam("prize") long prize, @RequestParam("ttlQuantityPresent") String ttlQuantityPresent,ModelMap model,HttpServletRequest request, HttpServletResponse response,
	  @ModelAttribute("login") Login login ) {
		
		System.out.println("hit came from js");
		SearchVO searchvo = new SearchVO();
		List <SearchVO> returnedMedList = new ArrayList();
		searchvo.setId(1);
		searchvo.setName(searchedWord);
		searchvo.setQuantity(1);
		searchvo.setPrize(prize);

		BigDecimal igst=new BigDecimal(1);
		BigDecimal cgst=new BigDecimal(2);
		searchvo.setIGST(igst.longValue());
		searchvo.setCGST(cgst.longValue());
		BigDecimal totalwithoutTax= (new BigDecimal(85).divide(new BigDecimal(100))).multiply(new BigDecimal(prize));
		BigDecimal discount =new BigDecimal(prize).subtract(totalwithoutTax);
		searchvo.setDiscount(discount.longValue());
		BigDecimal totalwithTax =totalwithoutTax.add(igst).add(cgst);
		searchvo.setTotal(totalwithoutTax.longValue());
		
		returnedMedList.add(searchvo);
		
			
	    return returnedMedList;
	  }
	
	
	@RequestMapping(value = "/calculate",produces="application/json")
	@ResponseBody
	  public List <SearchVO> calculation(@RequestParam("name") String name, ModelMap model,HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Hit Came to ActionOnSearch ");
		System.out.println(name);
		SearchVO searchvo = new SearchVO();
		List <SearchVO> returnedMedList = new ArrayList();
		searchvo.setId(1);
		searchvo.setName(name);
		searchvo.setQuantity(1);
		searchvo.setPrize(17);
		searchvo.setIGST(7);
		searchvo.setCGST(67);
		searchvo.setDiscount(5);
		searchvo.setTotal(15);
		
		returnedMedList.add(searchvo);
		
			
	    return returnedMedList;
		}
	
	
	
}
