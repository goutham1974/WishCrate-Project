package com.wishcrate.dto;

public class OrderItemDTO {
    private Long id;
    private String productName;
    private String productImage;
    private Integer quantity;
    private Double price;
    private Double subtotal;
    private String brand;

    // Constructors
    public OrderItemDTO() {
    }

    public OrderItemDTO(Long id, String productName, String productImage, Integer quantity,
                        Double price, Double subtotal, String brand) {
        this.id = id;
        this.productName = productName;
        this.productImage = productImage;
        this.quantity = quantity;
        this.price = price;
        this.subtotal = subtotal;
        this.brand = brand;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }
}
