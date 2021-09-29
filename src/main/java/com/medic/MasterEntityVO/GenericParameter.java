package com.medic.MasterEntityVO;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@Table(name ="Generic_Parameter")
public abstract class GenericParameter implements Serializable {

    @Id
    @Column(name ="ID")
    private Integer id;

    public String getDtype() {
        return dtype;
    }

    public void setDtype(String dtype) {
        this.dtype = dtype;
    }

    private String dtype;

    @Column(name ="APPROVAL_STATUS")
    private String approvalStatus;

    @Column(name ="CODE")
    private String Code;

    @Column(name ="VALUE")
    private String value;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public String getApprovalStatus() {
        return approvalStatus;
    }

    public void setApprovalStatus(String approvalStatus) {
        this.approvalStatus = approvalStatus;
    }

    public String getCode() {
        return Code;
    }

    public void setCode(String code) {
        Code = code;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
