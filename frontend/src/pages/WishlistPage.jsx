import React, { useEffect, useState } from 'react';
import api from '../services/api';
import ProductCard from '../components/ProductCard/ProductCard';
import '../styles/WishlistPage.css';

export default function WishlistPage() {
  const [wishlist, setWishlist] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetchWishlist();
  }, []);

  const fetchWishlist = async () => {
    try {
      setLoading(true);
      const response = await api.get('/wishlist');
      setWishlist(response.data);
      setError(null);
    } catch (err) {
      setError('Failed to load wishlist');
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  const removeFromWishlist = async (productId) => {
    try {
      await api.delete(`/wishlist/${productId}`);
      setWishlist(wishlist.filter(p => p.id !== productId));
    } catch (err) {
      console.error('Failed to remove from wishlist', err);
    }
  };

  if (loading) {
    return <div className="wishlist-container"><p>Loading...</p></div>;
  }

  return (
    <div className="wishlist-container">
      <h1>My Wishlist</h1>
      {error && <div className="error-message">{error}</div>}
      
      {wishlist.length === 0 ? (
        <div className="empty-wishlist">
          <p>Your wishlist is empty</p>
        </div>
      ) : (
        <div className="wishlist-grid">
          {wishlist.map(product => (
            <div key={product.id} className="wishlist-item">
              <ProductCard 
                product={product}
                onRemoveFromWishlist={() => removeFromWishlist(product.id)}
                showRemoveButton={true}
              />
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
