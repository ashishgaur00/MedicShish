package com.medic.MasterEntityVO.wareInsert;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name ="PRODUCTS_MAPPING")
public class ProductsMapping {

    @Id
    @Column(name="ID")
    private  Long id;

    @Column(name="CODE")
    private String code;

    @Column(name="NAME")
    private String name;

    @ManyToOne
    @JoinColumn(name ="Brand" ,referencedColumnName = "id",insertable=false, updatable=false)
    private Brands brand;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Brands getBrand() {
        return brand;
    }

    public void setBrand(Brands brand) {
        this.brand = brand;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
