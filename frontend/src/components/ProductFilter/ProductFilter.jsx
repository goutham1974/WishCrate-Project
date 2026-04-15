import React, { useState, useEffect } from 'react';
import { api } from '../services/api';
import ProductCard from './ProductCard/ProductCard';
import '../styles/ProductFilter.css';

export default function ProductFilter() {
  const [products, setProducts] = useState([]);
  const [categories, setCategories] = useState([]);
  const [brands, setBrands] = useState([]);
  const [filters, setFilters] = useState({
    keyword: '',
    categoryId: null,
    minPrice: null,
    maxPrice: null,
    brand: null,
    minRating: null,
    discountOnly: false
  });
  const [page, setPage] = useState(0);
  const [totalPages, setTotalPages] = useState(0);
  const [sortBy, setSortBy] = useState('id');
  const [sortDir, setSortDir] = useState('DESC');
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    fetchCategories();
    fetchProducts();
  }, []);

  useEffect(() => {
    fetchProducts();
  }, [filters, page, sortBy, sortDir]);

  const fetchCategories = async () => {
    try {
      const response = await api.get('/categories');
      setCategories(response.data);
    } catch (err) {
      console.error('Failed to load categories', err);
    }
  };

  const fetchProducts = async () => {
    try {
      setLoading(true);
      const params = {
        page,
        size: 12,
        sortBy,
        sortDir,
        ...Object.fromEntries(Object.entries(filters).filter(([, v]) => v !== null && v !== false && v !== ''))
      };

      const response = await api.get('/products/filter', { params });
      setProducts(response.data.content);
      setTotalPages(response.data.totalPages);
    } catch (err) {
      console.error('Failed to load products', err);
    } finally {
      setLoading(false);
    }
  };

  const handleFilterChange = (key, value) => {
    setFilters(prev => ({
      ...prev,
      [key]: value
    }));
    setPage(0);
  };

  const handleReset = () => {
    setFilters({
      keyword: '',
      categoryId: null,
      minPrice: null,
      maxPrice: null,
      brand: null,
      minRating: null,
      discountOnly: false
    });
    setPage(0);
  };

  return (
    <div className="product-filter-container">
      <aside className="filters-sidebar">
        <h3>Filters</h3>

        <div className="filter-group">
          <label>Search:</label>
          <input
            type="text"
            value={filters.keyword}
            onChange={(e) => handleFilterChange('keyword', e.target.value)}
            placeholder="Search products..."
          />
        </div>

        <div className="filter-group">
          <label>Category:</label>
          <select
            value={filters.categoryId || ''}
            onChange={(e) => handleFilterChange('categoryId', e.target.value ? parseInt(e.target.value) : null)}
          >
            <option value="">All Categories</option>
            {categories.map(cat => (
              <option key={cat.id} value={cat.id}>
                {cat.name}
              </option>
            ))}
          </select>
        </div>

        <div className="filter-group">
          <label>Price Range:</label>
          <div className="price-inputs">
            <input
              type="number"
              value={filters.minPrice || ''}
              onChange={(e) => handleFilterChange('minPrice', e.target.value ? parseFloat(e.target.value) : null)}
              placeholder="Min"
            />
            <span>-</span>
            <input
              type="number"
              value={filters.maxPrice || ''}
              onChange={(e) => handleFilterChange('maxPrice', e.target.value ? parseFloat(e.target.value) : null)}
              placeholder="Max"
            />
          </div>
        </div>

        <div className="filter-group">
          <label>Brand:</label>
          <input
            type="text"
            value={filters.brand || ''}
            onChange={(e) => handleFilterChange('brand', e.target.value)}
            placeholder="Filter by brand..."
          />
        </div>

        <div className="filter-group">
          <label>Min Rating:</label>
          <select
            value={filters.minRating || ''}
            onChange={(e) => handleFilterChange('minRating', e.target.value ? parseFloat(e.target.value) : null)}
          >
            <option value="">All Ratings</option>
            <option value="4">4+ Stars</option>
            <option value="3">3+ Stars</option>
            <option value="2">2+ Stars</option>
            <option value="1">1+ Stars</option>
          </select>
        </div>

        <div className="filter-group">
          <label>
            <input
              type="checkbox"
              checked={filters.discountOnly}
              onChange={(e) => handleFilterChange('discountOnly', e.target.checked)}
            />
            On Discount Only
          </label>
        </div>

        <button className="reset-btn" onClick={handleReset}>Reset Filters</button>
      </aside>

      <section className="products-section">
        <div className="sort-options">
          <select value={sortBy} onChange={(e) => setSortBy(e.target.value)}>
            <option value="id">Newest</option>
            <option value="price">Price</option>
            <option value="averageRating">Rating</option>
            <option value="name">Name</option>
          </select>
          <select value={sortDir} onChange={(e) => setSortDir(e.target.value)}>
            <option value="ASC">Ascending</option>
            <option value="DESC">Descending</option>
          </select>
        </div>

        {loading ? (
          <div className="loading">Loading products...</div>
        ) : products.length === 0 ? (
          <div className="no-products">No products found</div>
        ) : (
          <>
            <div className="products-grid">
              {products.map(product => (
                <ProductCard key={product.id} product={product} />
              ))}
            </div>

            {totalPages > 1 && (
              <div className="pagination">
                <button
                  disabled={page === 0}
                  onClick={() => setPage(page - 1)}
                >
                  Previous
                </button>
                <span>Page {page + 1} of {totalPages}</span>
                <button
                  disabled={page >= totalPages - 1}
                  onClick={() => setPage(page + 1)}
                >
                  Next
                </button>
              </div>
            )}
          </>
        )}
      </section>
    </div>
  );
}
