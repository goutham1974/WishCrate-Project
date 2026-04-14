package com.wishcrate.controller;

import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wishcrate.dto.OrderDTO;
import com.wishcrate.dto.OrderItemDTO;
import com.wishcrate.model.Order;
import com.wishcrate.service.OrderService;

@RestController
@RequestMapping("/api/orders")
public class OrderController {
    
    private final OrderService orderService;
    
    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }
    
    @PostMapping("/create")
    public ResponseEntity<OrderDTO> createOrder(@RequestBody Map<String, Object> body) {
        @SuppressWarnings("unchecked")
        Map<String, String> shippingAddress = (Map<String, String>) body.get("shippingAddress");
        String paymentMethod = (String) body.get("paymentMethod");
        Order.PaymentMethod method = Order.PaymentMethod.valueOf(paymentMethod);
        Order order = orderService.createOrder(shippingAddress, method);
        return ResponseEntity.ok(convertToDTO(order));
    }
    
    @GetMapping
    public ResponseEntity<Page<OrderDTO>> getUserOrders(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size) {
        
        PageRequest pageRequest = PageRequest.of(page, size);
        Page<Order> orders = orderService.getUserOrders(pageRequest);
        return ResponseEntity.ok(orders.map(this::convertToDTO));
    }
    
    @GetMapping("/{orderId}")
    public ResponseEntity<OrderDTO> getOrderById(@PathVariable Long orderId) {
        Order order = orderService.getOrderById(orderId);
        return ResponseEntity.ok(convertToDTO(order));
    }
    
    @PutMapping("/{orderId}/cancel")
    public ResponseEntity<OrderDTO> cancelOrder(@PathVariable Long orderId) {
        Order order = orderService.cancelOrder(orderId);
        return ResponseEntity.ok(convertToDTO(order));
    }
    
    @PutMapping("/{orderId}/status")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<OrderDTO> updateOrderStatus(
            @PathVariable Long orderId,
            @RequestParam Order.OrderStatus status) {
        Order order = orderService.updateOrderStatus(orderId, status);
        return ResponseEntity.ok(convertToDTO(order));
    }
    
    // Helper method to convert Order to OrderDTO
    private OrderDTO convertToDTO(Order order) {
        OrderDTO dto = new OrderDTO();
        dto.setId(order.getId());
        dto.setOrderNumber(order.getOrderNumber());
        dto.setOrderDate(order.getOrderDate());
        dto.setSubtotal(order.getSubtotal());
        dto.setTax(order.getTax());
        dto.setShippingCost(order.getShippingCost());
        dto.setTotalAmount(order.getTotalAmount());
        dto.setOrderStatus(order.getOrderStatus() != null ? order.getOrderStatus().toString() : null);
        dto.setPaymentStatus(order.getPaymentStatus() != null ? order.getPaymentStatus().toString() : null);
        dto.setPaymentMethod(order.getPaymentMethod() != null ? order.getPaymentMethod().toString() : null);
        dto.setTrackingNumber(order.getTrackingNumber());
        dto.setEstimatedDeliveryDate(order.getEstimatedDeliveryDate());
        dto.setDeliveredDate(order.getDeliveredDate());
        
        // Convert ShippingAddress to string format
        if (order.getShippingAddress() != null) {
            dto.setShippingAddress(formatAddress(order.getShippingAddress()));
        }
        
        if (order.getBillingAddress() != null) {
            dto.setBillingAddress(formatAddress(order.getBillingAddress()));
        }
        
        // Convert OrderItems to OrderItemDTOs
        if (order.getItems() != null && !order.getItems().isEmpty()) {
            dto.setItems(order.getItems().stream()
                .map(item -> new OrderItemDTO(
                    item.getId(),
                    item.getProduct().getName(),
                    item.getProduct().getImageUrl(),
                    item.getQuantity(),
                    item.getPrice(),
                    item.getSubtotal(),
                    item.getProduct().getBrand()
                ))
                .collect(Collectors.toList()));
        }
        
        return dto;
    }
    
    // Helper method to format address
    private String formatAddress(com.wishcrate.model.ShippingAddress address) {
        return String.format("%s, %s, %s, %s %s, %s",
            address.getStreet(),
            address.getCity(),
            address.getState(),
            address.getZipCode(),
            address.getCountry(),
            address.getPhoneNumber());
    }
}
