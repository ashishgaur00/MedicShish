package com.medic.OperationDAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.medic.OperationPojo.Contact;
import com.medic.OperationPojo.MedicDetail;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.SystemException;
import javax.transaction.Transactional;

@Component
public class ActionOnSearchDAO  {
    @PersistenceContext
	private EntityManager em;
	
	public EntityManager getEntityManager() {
		return this.em;
	}
	
	
	@Autowired
	HibernateTemplate hibernateTemplate;
	@Transactional
	public int save(Contact contact) {
		
		Integer i = (Integer) this.hibernateTemplate.save(contact);
		return i;
	}
	@Transactional
   public int saveMedicDetail(MedicDetail medicDetail) {
		
		Integer i = (Integer) this.hibernateTemplate.save(medicDetail);
		return i;
	}
	
	public List <Contact> getAll(){
		List<Contact> contacts =this.hibernateTemplate.loadAll(Contact.class);
		return contacts;
		}

	public List <MedicDetail> getLikeSerachOfMedic(String searchKeyword){
		TypedQuery<MedicDetail> query = getEntityManager().createQuery(" select at from MedicDetail at where lower(at.medicName) LIKE lower(:searchKeyword)",MedicDetail.class);
		query.setParameter("searchKeyword", "%"+searchKeyword+"%");
		return query.getResultList();
	}

}
