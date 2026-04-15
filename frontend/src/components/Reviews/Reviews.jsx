import React, { useState, useEffect } from 'react';
import { api } from '../../services/api';
import '../../styles/Reviews.css';

export default function Reviews({ productId }) {
  const [reviews, setReviews] = useState([]);
  const [loading, setLoading] = useState(true);
  const [showForm, setShowForm] = useState(false);
  const [rating, setRating] = useState(5);
  const [comment, setComment] = useState('');
  const [page, setPage] = useState(0);
  const pageSize = 5;

  useEffect(() => {
    fetchReviews();
  }, [productId, page]);

  const fetchReviews = async () => {
    try {
      setLoading(true);
      const response = await api.get(`/reviews/product/${productId}`, {
        params: { page, size: pageSize }
      });
      setReviews(response.data.content);
    } catch (err) {
      console.error('Failed to load reviews', err);
    } finally {
      setLoading(false);
    }
  };

  const handleSubmitReview = async (e) => {
    e.preventDefault();
    try {
      const reviewData = {
        rating: parseInt(rating),
        comment,
        images: []
      };
      await api.post(`/reviews/${productId}`, reviewData);
      setComment('');
      setRating(5);
      setShowForm(false);
      fetchReviews();
    } catch (err) {
      console.error('Failed to submit review', err);
      alert('Failed to submit review. You may have already reviewed this product.');
    }
  };

  const handleMarkHelpful = async (reviewId) => {
    try {
      await api.post(`/reviews/${reviewId}/helpful`);
      fetchReviews();
    } catch (err) {
      console.error('Failed to mark as helpful', err);
    }
  };

  return (
    <div className="reviews-container">
      <h3>Customer Reviews</h3>
      
      {!showForm && (
        <button className="add-review-btn" onClick={() => setShowForm(true)}>
          Write a Review
        </button>
      )}

      {showForm && (
        <form className="review-form" onSubmit={handleSubmitReview}>
          <div className="form-group">
            <label>Rating:</label>
            <select value={rating} onChange={(e) => setRating(e.target.value)}>
              <option value="5">5 Stars - Excellent</option>
              <option value="4">4 Stars - Good</option>
              <option value="3">3 Stars - Average</option>
              <option value="2">2 Stars - Poor</option>
              <option value="1">1 Star - Terrible</option>
            </select>
          </div>

          <div className="form-group">
            <label>Comment:</label>
            <textarea
              value={comment}
              onChange={(e) => setComment(e.target.value)}
              placeholder="Share your experience with this product..."
              required
            />
          </div>

          <div className="form-buttons">
            <button type="submit" className="submit-btn">Submit Review</button>
            <button type="button" className="cancel-btn" onClick={() => setShowForm(false)}>
              Cancel
            </button>
          </div>
        </form>
      )}

      {loading ? (
        <p>Loading reviews...</p>
      ) : reviews.length === 0 ? (
        <p className="no-reviews">No reviews yet. Be the first to review!</p>
      ) : (
        <div className="reviews-list">
          {reviews.map(review => (
            <div key={review.id} className="review-item">
              <div className="review-header">
                <div>
                  <strong>{review.userName}</strong>
                  {review.verified && <span className="verified-badge">✓ Verified Purchase</span>}
                </div>
                <span className="stars">{'★'.repeat(review.rating)}{'☆'.repeat(5 - review.rating)}</span>
              </div>

              <p className="review-comment">{review.comment}</p>

              <div className="review-footer">
                <small>{new Date(review.createdAt).toLocaleDateString()}</small>
                <button 
                  className="helpful-btn"
                  onClick={() => handleMarkHelpful(review.id)}
                >
                  👍 Helpful ({review.helpfulCount})
                </button>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
