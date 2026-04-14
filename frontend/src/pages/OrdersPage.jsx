import React, { useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import {
  Container,
  Box,
  Typography,
  Card,
  CardContent,
  Chip,
  Button,
  Grid,
  Divider,
  ToggleButton,
  ToggleButtonGroup,
  Alert,
} from '@mui/material';
import { Visibility, CancelOutlined } from '@mui/icons-material';
import api from '../services/api';
import { motion } from 'framer-motion';

const OrdersPage = () => {
  const [orders, setOrders] = useState([]);
  const [filteredOrders, setFilteredOrders] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [statusFilter, setStatusFilter] = useState('ALL');
  const [cancelling, setCancelling] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    fetchOrders();
  }, []);

  useEffect(() => {
    filterOrders();
  }, [orders, statusFilter]);

  const fetchOrders = async () => {
    try {
      setLoading(true);
      const response = await api.get('/api/orders?page=0&size=20');
      setOrders(response.data.content || []);
      setError(null);
    } catch (err) {
      setError('Failed to load orders');
      console.error('Error fetching orders:', err);
    } finally {
      setLoading(false);
    }
  };

  const filterOrders = () => {
    if (statusFilter === 'ALL') {
      setFilteredOrders(orders);
    } else {
      setFilteredOrders(orders.filter(order => order.orderStatus === statusFilter));
    }
  };

  const handleCancelOrder = async (orderId, orderNumber) => {
    if (window.confirm(`Cancel order #${orderNumber}? This action cannot be undone.`)) {
      try {
        setCancelling(orderId);
        await api.put(`/api/orders/${orderId}/cancel`);
        // Refresh orders after cancellation
        fetchOrders();
        alert('Order cancelled successfully');
      } catch (err) {
        alert(err.response?.data?.message || 'Failed to cancel order');
      } finally {
        setCancelling(null);
      }
    }
  };

  const getStatusColor = (status) => {
    const colors = {
      PENDING: 'warning',
      CONFIRMED: 'info',
      PROCESSING: 'info',
      SHIPPED: 'primary',
      DELIVERED: 'success',
      CANCELLED: 'error',
      RETURNED: 'error',
    };
    return colors[status] || 'default';
  };

  const getStatusProgress = (status) => {
    const statuses = ['PENDING', 'CONFIRMED', 'PROCESSING', 'SHIPPED', 'DELIVERED'];
    return statuses.indexOf(status) + 1;
  };

  const canCancelOrder = (status) => {
    return ['PENDING', 'CONFIRMED', 'PROCESSING'].includes(status);
  };

  if (loading) {
    return (
      <Container>
        <Box sx={{ py: 8, textAlign: 'center' }}>
          <div className="spinner-border" role="status">
            <span className="visually-hidden">Loading...</span>
          </div>
          <Typography sx={{ mt: 2 }}>Loading your orders...</Typography>
        </Box>
      </Container>
    );
  }

  if (error) {
    return (
      <Container maxWidth="md" sx={{ py: 6 }}>
        <Alert severity="error">{error}</Alert>
        <Button variant="contained" onClick={fetchOrders} sx={{ mt: 2 }}>
          Try Again
        </Button>
      </Container>
    );
  }

  if (orders.length === 0) {
    return (
      <Container maxWidth="md" sx={{ py: 8, textAlign: 'center' }}>
        <Typography variant="h4" sx={{ mb: 2 }}>
          No orders yet
        </Typography>
        <Typography variant="body1" color="text.secondary" sx={{ mb: 4 }}>
          Start shopping to see your orders here
        </Typography>
        <Button
          component={Link}
          to="/products"
          variant="contained"
          size="large"
        >
          Start Shopping
        </Button>
      </Container>
    );
  }

  return (
    <Container maxWidth="xl" sx={{ py: 6 }}>
      <Typography
        variant="h3"
        sx={{
          fontFamily: '"Playfair Display", serif',
          fontWeight: 700,
          mb: 4,
        }}
      >
        My Orders
      </Typography>

      {/* Status Filter */}
      <Box sx={{ mb: 4, p: 2, bgcolor: 'grey.50', borderRadius: 1 }}>
        <Typography variant="subtitle2" sx={{ mb: 2, fontWeight: 600 }}>
          Filter by Status:
        </Typography>
        <ToggleButtonGroup
          value={statusFilter}
          exclusive
          onChange={(e, newStatus) => {
            if (newStatus !== null) {
              setStatusFilter(newStatus);
            }
          }}
          sx={{ flexWrap: 'wrap', gap: 1 }}
        >
          <ToggleButton value="ALL" aria-label="all">
            All Orders ({orders.length})
          </ToggleButton>
          <ToggleButton value="PENDING" aria-label="pending">
            Pending ({orders.filter(o => o.orderStatus === 'PENDING').length})
          </ToggleButton>
          <ToggleButton value="CONFIRMED" aria-label="confirmed">
            Confirmed ({orders.filter(o => o.orderStatus === 'CONFIRMED').length})
          </ToggleButton>
          <ToggleButton value="PROCESSING" aria-label="processing">
            Processing ({orders.filter(o => o.orderStatus === 'PROCESSING').length})
          </ToggleButton>
          <ToggleButton value="SHIPPED" aria-label="shipped">
            Shipped ({orders.filter(o => o.orderStatus === 'SHIPPED').length})
          </ToggleButton>
          <ToggleButton value="DELIVERED" aria-label="delivered">
            Delivered ({orders.filter(o => o.orderStatus === 'DELIVERED').length})
          </ToggleButton>
        </ToggleButtonGroup>
      </Box>

      {/* Orders List */}
      <Grid container spacing={3}>
        {filteredOrders.length === 0 ? (
          <Grid item xs={12}>
            <Alert severity="info">
              No orders found with status: {statusFilter}
            </Alert>
          </Grid>
        ) : (
          filteredOrders.map((order, index) => (
            <Grid item xs={12} key={order.id}>
              <motion.div
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: index * 0.1 }}
              >
                <Card sx={{ cursor: 'pointer', transition: 'all 0.3s', '&:hover': { boxShadow: 3 } }}>
                  <CardContent>
                    {/* Header Row */}
                    <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', mb: 2 }}>
                      <Box>
                        <Typography variant="h6" sx={{ fontWeight: 600 }}>
                          Order #{order.orderNumber}
                        </Typography>
                        <Typography variant="body2" color="text.secondary">
                          Placed on {new Date(order.orderDate).toLocaleDateString()}
                        </Typography>
                      </Box>
                      <Box sx={{ display: 'flex', gap: 1, alignItems: 'center', flexWrap: 'wrap', justifyContent: 'flex-end' }}>
                        <Chip
                          label={order.orderStatus}
                          color={getStatusColor(order.orderStatus)}
                          sx={{ fontWeight: 600 }}
                        />
                        <Chip
                          label={`Payment: ${order.paymentStatus}`}
                          variant="outlined"
                          size="small"
                        />
                      </Box>
                    </Box>

                    {/* Progress Bar */}
                    <Box sx={{ mb: 3 }}>
                      <Box sx={{ display: 'flex', justifyContent: 'space-between', mb: 1, px: 1 }}>
                        <Typography variant="caption" color="text.secondary">
                          Delivery Progress
                        </Typography>
                        <Typography variant="caption" color="text.secondary">
                          {getStatusProgress(order.orderStatus)} of 5
                        </Typography>
                      </Box>
                      <Box sx={{ width: '100%', height: 8, bgcolor: 'grey.200', borderRadius: 4, overflow: 'hidden' }}>
                        <Box
                          sx={{
                            height: '100%',
                            width: `${(getStatusProgress(order.orderStatus) / 5) * 100}%`,
                            bgcolor: getStatusColor(order.orderStatus) === 'success' ? '#4caf50' : '#2196f3',
                            transition: 'width 0.3s ease',
                          }}
                        />
                      </Box>
                    </Box>

                    {/* Tracking Info */}
                    {order.trackingNumber && (
                      <Box sx={{ mb: 2, p: 2, bgcolor: 'blue.50', borderRadius: 1, borderLeft: '4px solid #2196f3' }}>
                        <Typography variant="caption" color="text.secondary">
                          Tracking Number: <strong>{order.trackingNumber}</strong>
                        </Typography>
                        {order.estimatedDeliveryDate && (
                          <>
                            <br />
                            <Typography variant="caption" color="text.secondary">
                              Est. Delivery: {new Date(order.estimatedDeliveryDate).toLocaleDateString()}
                            </Typography>
                          </>
                        )}
                      </Box>
                    )}

                    <Divider sx={{ my: 2 }} />

                    {/* Order Items Preview */}
                    <Grid container spacing={2} sx={{ mb: 2 }}>
                      {order.items?.slice(0, 3).map((item) => (
                        <Grid item xs={12} sm={6} md={4} key={item.id}>
                          <Box sx={{ display: 'flex', gap: 2 }}>
                            {item.productImage && (
                              <Box
                                component="img"
                                src={item.productImage}
                                alt={item.productName}
                                sx={{
                                  width: 60,
                                  height: 60,
                                  borderRadius: 1,
                                  objectFit: 'cover',
                                  flexShrink: 0,
                                }}
                              />
                            )}
                            <Box>
                              <Typography variant="body2" sx={{ fontWeight: 600 }}>
                                {item.productName}
                              </Typography>
                              <Typography variant="caption" color="text.secondary">
                                Qty: {item.quantity}
                              </Typography>
                              <Typography variant="body2" color="primary" sx={{ fontWeight: 600 }}>
                                ${item.price?.toFixed(2)}
                              </Typography>
                            </Box>
                          </Box>
                        </Grid>
                      ))}
                      {order.items?.length > 3 && (
                        <Grid item xs={12}>
                          <Typography variant="caption" color="text.secondary">
                            +{order.items.length - 3} more item{order.items.length - 3 > 1 ? 's' : ''}
                          </Typography>
                        </Grid>
                      )}
                    </Grid>

                    <Divider sx={{ my: 2 }} />

                    {/* Footer Row */}
                    <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                      <Box>
                        <Typography variant="body2" color="text.secondary">
                          Total Amount
                        </Typography>
                        <Typography variant="h6" color="primary" sx={{ fontWeight: 700 }}>
                          ${order.totalAmount?.toFixed(2) || '0.00'}
                        </Typography>
                      </Box>
                      <Box sx={{ display: 'flex', gap: 1 }}>
                        {canCancelOrder(order.orderStatus) && (
                          <Button
                            variant="outlined"
                            color="error"
                            size="small"
                            startIcon={<CancelOutlined />}
                            onClick={() => handleCancelOrder(order.id, order.orderNumber)}
                            disabled={cancelling === order.id}
                          >
                            {cancelling === order.id ? 'Cancelling...' : 'Cancel'}
                          </Button>
                        )}
                        <Button
                          variant="contained"
                          size="small"
                          startIcon={<Visibility />}
                          onClick={() => navigate(`/orders/${order.id}`)}
                        >
                          View Details
                        </Button>
                      </Box>
                    </Box>
                  </CardContent>
                </Card>
              </motion.div>
            </Grid>
          ))
        )}
      </Grid>
    </Container>
  );
};

export default OrdersPage;
