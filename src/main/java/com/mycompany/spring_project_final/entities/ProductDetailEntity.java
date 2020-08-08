
package com.mycompany.spring_project_final.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="product_detail")
public class ProductDetailEntity {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @ManyToOne
    @JoinColumn(name="product_id")
    private ProductEntity product;
    
    @ManyToOne
    @JoinColumn(name="color_id")
    private ColorEntity color;
    
    @ManyToOne
    @JoinColumn(name="size_id")
    private SizeEntity size;

    public SizeEntity getSize() {
        return size;
    }

    public void setSize(SizeEntity size) {
        this.size = size;
    }
    public ColorEntity getColor() {
        return color;
    }

    public void setColor(ColorEntity color) {
        this.color = color;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ProductEntity getProduct() {
        return product;
    }

    public void setProduct(ProductEntity product) {
        this.product = product;
    }
    
}
