import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import api from '../services/api';
import '../styles/OrderDetail.css';

const OrderDetailPage = () => {
  const { orderId } = useParams();
  const navigate = useNavigate();
  const [order, setOrder] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [cancelling, setCancelling] = useState(false);

  useEffect(() => {
    fetchOrderDetail();
  }, [orderId]);

  const fetchOrderDetail = async () => {
    try {
      setLoading(true);
      const response = await api.get(`/orders/${orderId}`);
      setOrder(response.data);
      setError(null);
    } catch (err) {
      setError(err.response?.data?.message || 'Failed to load order details');
    } finally {
      setLoading(false);
    }
  };

  const handleCancelOrder = async () => {
    if (window.confirm('Are you sure you want to cancel this order?')) {
      try {
        setCancelling(true);
        const response = await api.put(`/orders/${orderId}/cancel`);
        setOrder(response.data);
        alert('Order cancelled successfully');
      } catch (err) {
        alert(err.response?.data?.message || 'Failed to cancel order');
      } finally {
        setCancelling(false);
      }
    }
  };

  const getStatusColor = (status) => {
    const statusColors = {
      PENDING: '#FFA500',
      CONFIRMED: '#4CAF50',
      PROCESSING: '#2196F3',
      SHIPPED: '#00BCD4',
      DELIVERED: '#8BC34A',
      CANCELLED: '#F44336',
      RETURNED: '#9C27B0'
    };
    return statusColors[status] || '#999';
  };

  const getPaymentStatusBadge = (status) => {
    const statusClasses = {
      PENDING: 'badge-warning',
      PAID: 'badge-success',
      FAILED: 'badge-danger',
      REFUNDED: 'badge-info'
    };
    return statusClasses[status] || 'badge-secondary';
  };

  const getOrderStatusTimeline = () => {
    const timeline = [
      { status: 'PENDING', label: 'Order Placed', completed: true },
      { status: 'CONFIRMED', label: 'Confirmed', completed: order?.orderStatus !== 'PENDING' },
      { status: 'PROCESSING', label: 'Processing', completed: ['PROCESSING', 'SHIPPED', 'DELIVERED'].includes(order?.orderStatus) },
      { status: 'SHIPPED', label: 'Shipped', completed: ['SHIPPED', 'DELIVERED'].includes(order?.orderStatus) },
      { status: 'DELIVERED', label: 'Delivered', completed: order?.orderStatus === 'DELIVERED' }
    ];
    return timeline;
  };

  if (loading) {
    return (
      <div className="container mt-5">
        <div className="text-center">
          <div className="spinner-border" role="status">
            <span className="sr-only">Loading...</span>
          </div>
          <p className="mt-2">Loading order details...</p>
        </div>
      </div>
    );
  }

  if (error || !order) {
    return (
      <div className="container mt-5">
        <div className="alert alert-danger" role="alert">
          {error || 'Order not found'}
        </div>
        <button className="btn btn-primary" onClick={() => navigate('/orders')}>
          Back to Orders
        </button>
      </div>
    );
  }

  return (
    <div className="container mt-5">
      {/* Header */}
      <div className="order-header mb-4">
        <div className="d-flex justify-content-between align-items-center mb-3">
          <h2>Order #{order.orderNumber}</h2>
          <button 
            className="btn btn-outline-primary" 
            onClick={() => navigate('/orders')}
          >
            Back to Orders
          </button>
        </div>
        
        <div className="order-meta">
          <span className="meta-item">
            <strong>Order Date:</strong> {new Date(order.orderDate).toLocaleDateString()}
          </span>
          <span className="meta-item ms-3">
            <strong>Status:</strong> 
            <span 
              className="badge ms-2" 
              style={{ backgroundColor: getStatusColor(order.orderStatus) }}
            >
              {order.orderStatus}
            </span>
          </span>
          <span className="meta-item ms-3">
            <strong>Payment:</strong> 
            <span className={`badge ms-2 ${getPaymentStatusBadge(order.paymentStatus)}`}>
              {order.paymentStatus}
            </span>
          </span>
        </div>
      </div>

      {/* Timeline */}
      <div className="order-timeline mb-5">
        <h4 className="mb-4">Delivery Progress</h4>
        <div className="timeline">
          {getOrderStatusTimeline().map((step, index) => (
            <div key={step.status} className="timeline-item">
              <div className={`timeline-marker ${step.completed ? 'completed' : ''}`}>
                {step.completed ? '✓' : '○'}
              </div>
              <div className="timeline-content">
                <p className="timeline-label">{step.label}</p>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Tracking Information */}
      {order.trackingNumber && (
        <div className="tracking-info mb-4 p-4 border rounded bg-light">
          <h5>Tracking Information</h5>
          <div className="row mt-3">
            <div className="col-md-6">
              <p><strong>Tracking Number:</strong> <span className="text-info">{order.trackingNumber}</span></p>
            </div>
            <div className="col-md-6">
              {order.estimatedDeliveryDate && (
                <p><strong>Estimated Delivery:</strong> {new Date(order.estimatedDeliveryDate).toLocaleDateString()}</p>
              )}
            </div>
            {order.deliveredDate && (
              <div className="col-md-6">
                <p><strong>Delivered on:</strong> {new Date(order.deliveredDate).toLocaleDateString()}</p>
              </div>
            )}
          </div>
        </div>
      )}

      {/* Shipping & Billing Addresses */}
      <div className="row mb-4">
        <div className="col-md-6">
          <div className="address-card p-3 border rounded">
            <h5>Shipping Address</h5>
            <p className="mb-0">{order.shippingAddress}</p>
          </div>
        </div>
        <div className="col-md-6">
          <div className="address-card p-3 border rounded">
            <h5>Billing Address</h5>
            <p className="mb-0">{order.billingAddress}</p>
          </div>
        </div>
      </div>

      {/* Order Items */}
      <div className="order-items mb-5">
        <h4 className="mb-3">Order Items</h4>
        <div className="table-responsive">
          <table className="table table-hover">
            <thead className="table-light">
              <tr>
                <th>Product</th>
                <th>Brand</th>
                <th>Quantity</th>
                <th className="text-end">Price</th>
                <th className="text-end">Subtotal</th>
              </tr>
            </thead>
            <tbody>
              {order.items?.map((item) => (
                <tr key={item.id}>
                  <td>
                    <div className="d-flex align-items-center">
                      {item.productImage && (
                        <img 
                          src={item.productImage} 
                          alt={item.productName}
                          className="img-thumbnail me-3"
                          style={{ width: '50px', height: '50px' }}
                        />
                      )}
                      <span>{item.productName}</span>
                    </div>
                  </td>
                  <td>{item.brand}</td>
                  <td>{item.quantity}</td>
                  <td className="text-end">${item.price.toFixed(2)}</td>
                  <td className="text-end font-weight-bold">${item.subtotal.toFixed(2)}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>

      {/* Order Summary */}
      <div className="order-summary mb-5">
        <div className="row">
          <div className="col-md-6 ms-auto">
            <div className="card">
              <div className="card-body">
                <div className="d-flex justify-content-between mb-2">
                  <span>Subtotal:</span>
                  <span>${order.subtotal?.toFixed(2)}</span>
                </div>
                <div className="d-flex justify-content-between mb-2">
                  <span>Shipping:</span>
                  <span>${order.shippingCost?.toFixed(2)}</span>
                </div>
                <div className="d-flex justify-content-between mb-3 pb-3 border-bottom">
                  <span>Tax (10%):</span>
                  <span>${order.tax?.toFixed(2)}</span>
                </div>
                <div className="d-flex justify-content-between" style={{ fontSize: '1.2em', fontWeight: 'bold' }}>
                  <span>Total Amount:</span>
                  <span className="text-primary">${order.totalAmount?.toFixed(2)}</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Payment Method */}
      <div className="payment-info mb-5 p-3 border rounded bg-light">
        <h5>Payment Method</h5>
        <p className="mb-0">{order.paymentMethod}</p>
        {order.paymentTransactionId && (
          <p className="mb-0 text-muted small">Transaction ID: {order.paymentTransactionId}</p>
        )}
      </div>

      {/* Action Buttons */}
      <div className="action-buttons mb-5">
        {['PENDING', 'CONFIRMED', 'PROCESSING'].includes(order.orderStatus) && (
          <button 
            className="btn btn-danger me-2"
            onClick={handleCancelOrder}
            disabled={cancelling}
          >
            {cancelling ? 'Cancelling...' : 'Cancel Order'}
          </button>
        )}
        <button className="btn btn-outline-primary">
          Download Invoice
        </button>
        <button className="btn btn-outline-primary ms-2">
          Print Receipt
        </button>
      </div>
    </div>
  );
};

export default OrderDetailPage;
