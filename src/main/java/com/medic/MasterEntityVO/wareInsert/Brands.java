package com.medic.MasterEntityVO.wareInsert;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name ="BRANDS")
public class Brands {

    @Id
    @Column(name="ID")
    private  Long id;

    @Column(name="CODE")
    private String code;

    @Column(name="NAME")
    private String name;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn ( name ="BRAND_ID" ,referencedColumnName = "id")
    private List< ProductsMapping > productsMapping;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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


    public List<ProductsMapping> getProductsMapping() {
        return productsMapping;
    }

    public void setProductsMapping(List<ProductsMapping> productsMapping) {
        this.productsMapping = productsMapping;
    }
}
