package com.medic.MasterEntityVO;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name ="DISCOUNT_MASTER")
public class DiscountMater {
    @Id
    @Column(name="ID")
    private  Long id;
    @Column(name="CODE")
    private String code;
    @Column(name="NAME")
    private String name;
    @ManyToOne
    @JoinColumn(name ="DISCOUNT_TYPE" ,referencedColumnName = "id",insertable=false, updatable=false)
    private DiscountType discountType;
    @ManyToOne
    @JoinColumn(name="CALCULATED_ON" ,referencedColumnName = "id" ,insertable=false, updatable=false)
    private CalculatedOn calculatedOn;
    @Column(name="PERCENTAGE")
    private BigDecimal percentage;
    @Column(name="AMOUNT")
    private BigDecimal amount;
    @Column(name="MIN_PURCHASE")
    private Boolean minimunPurchase;
    @Column(name="MIN_PURCHASE_AMT")
    private BigDecimal minimunPurchaseAmount;
    @ManyToOne
    @JoinColumn(name="APPLY_TO",referencedColumnName = "id",insertable=false, updatable=false)
    private ApplyTo applyTo;
    @Column(name="SPECIFIC_TO")
    private String specificTo;
    @Column(name="START_DATE")
    private Date startDate;
    @Column(name="END_DATE")
    private Date endDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public DiscountType getDiscountType() {
        return discountType;
    }

    public void setDiscountType(DiscountType discountType) {
        this.discountType = discountType;
    }

    public CalculatedOn getCalculatedOn() {
        return calculatedOn;
    }

    public void setCalculatedOn(CalculatedOn calculatedOn) {
        this.calculatedOn = calculatedOn;
    }

    public BigDecimal getPercentage() {
        return percentage;
    }

    public void setPercentage(BigDecimal percentage) {
        this.percentage = percentage;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Boolean getMinimunPurchase() {
        return minimunPurchase;
    }

    public void setMinimunPurchase(Boolean minimunPurchase) {
        this.minimunPurchase = minimunPurchase;
    }

    public BigDecimal getMinimunPurchaseAmount() {
        return minimunPurchaseAmount;
    }

    public void setMinimunPurchaseAmount(BigDecimal minimunPurchaseAmount) {
        this.minimunPurchaseAmount = minimunPurchaseAmount;
    }

    public ApplyTo getApplyTo() {
        return applyTo;
    }

    public void setApplyTo(ApplyTo applyTo) {
        this.applyTo = applyTo;
    }

    public String getSpecificTo() {
        return specificTo;
    }

    public void setSpecificTo(String specificTo) {
        this.specificTo = specificTo;
    }



    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
}
