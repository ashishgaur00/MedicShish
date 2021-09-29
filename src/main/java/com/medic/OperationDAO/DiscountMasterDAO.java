package com.medic.OperationDAO;

import com.medic.MasterEntityVO.GenericParameter;
import com.medic.OperationPojo.MedicDetail;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

@Component
public class DiscountMasterDAO {

    @PersistenceContext
    private EntityManager em;

    public EntityManager getEntityManager() {
        return this.em;
    }

  public <k> List fetchOntheBaseOfDtype( String Dtype ,Class<k> className ){

      String query = "FROM " + className.getSimpleName() + " s where s.dtype = :dtype";
      TypedQuery<k> qry =getEntityManager().createQuery(query,className);
      qry.setParameter("dtype" ,Dtype);
      return qry.getResultList();
  }


}
