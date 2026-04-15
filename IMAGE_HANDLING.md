# Product Image Handling - Implementation Guide

## Overview
The WishCrate e-commerce platform implements product image handling across both backend and frontend with multiple fallback mechanisms to ensure images always display correctly.

## Database Schema

### Product Entity (Backend)
- **imageUrl** (String): Single primary image URL from Unsplash
- **images** (List<String>): ElementCollection for multiple product images (optional)
  - Stored in `product_images` join table
  - Maps `product_id` to `images` array values

### Initial Data
- All products seeded with `image_url` from Unsplash with `w=400&h=400&fit=crop` parameters
- Optional: Additional images can be populated in `product_images` table via `populate_product_images.sql`

## Frontend Implementation

### ProductCard Component
```javascript
<CardMedia
  component="img"
  height="240"
  image={product.imageUrl || product.images?.[0] || 'https://via.placeholder.com/300'}
  alt={product.name}
/>
```
**Fallback chain**:
1. Primary: `product.imageUrl` (single image from database)
2. Secondary: `product.images?.[0]` (first image from array if available)
3. Tertiary: Placeholder URL if neither exists

### ProductDetailPage Component
```javascript
const productImages = (product.images && product.images.length > 0) 
  ? product.images 
  : (product.imageUrl ? [product.imageUrl] : ['https://via.placeholder.com/600']);
```
**Behavior**:
- If `product.images` array exists and has items: Use the array
- Else if `product.imageUrl` exists: Wrap it in an array
- Else: Use placeholder image

**Image display**:
- Main image: `productImages[selectedImage]`
- Thumbnail gallery: Shows all images if count > 1
- Users can click thumbnails to change main image

## Backend API Response

### ProductDTO Fields
- `imageUrl` (String): Populated from Product.imageUrl
- `images` (List<String>): Populated from Product.images ElementCollection
- Both fields are sent in REST API responses

### All Endpoints Return Complete Data
- `GET /api/products` - List with pagination
- `GET /api/products/{id}` - Single product detail
- `GET /api/products/search` - Search results
- `GET /api/products/category/{categoryId}` - Category filtered
- `GET /api/products/featured` - Featured products
- All include both `imageUrl` and `images` fields

## Unsplash Image URLs

### Format
```
https://images.unsplash.com/photo-{photoId}?w={width}&h={height}&fit={fitMode}
```

### Database Seeded Parameters
- Width: 400px (for product cards)
- Height: 400px (square aspect ratio)
- Fit mode: crop (maintains aspect ratio)

### Alternative Widths for Different Use Cases
```javascript
// Product cards (400x400)
https://images.unsplash.com/photo-{photoId}?w=400&h=400&fit=crop

// Product details (600x600)
https://images.unsplash.com/photo-{photoId}?w=600&h=600&fit=crop

// Thumbnails (80x80)
https://images.unsplash.com/photo-{photoId}?w=80&h=80&fit=crop
```

## Troubleshooting

### Images Not Displaying
1. **Check API Response**:
   - Open browser DevTools → Network tab
   - Call `GET /api/products/1` (or any product ID)
   - Verify `imageUrl` and `images` fields in response
   
2. **Check Unsplash CDN**:
   - Try opening image URL directly in browser
   - If blocked, may need to clear cache or use VPN

3. **Check Frontend Fallbacks**:
   - ProductCard always shows: imageUrl → images[0] → placeholder
   - ProductDetailPage creates array from imageUrl if needed

4. **Browser Console**:
   - Check for CORS errors
   - Check for image 404 errors
   - Verify image source URLs are correct

## Populating Additional Images

### Option 1: Via SQL (populate_product_images.sql)
```sql
INSERT INTO product_images (product_id, images)
VALUES (1, 'https://images.unsplash.com/photo-1516....jpg?w=600'),
       (1, 'https://images.unsplash.com/photo-1517....jpg?w=600'),
       (2, 'https://images.unsplash.com/photo-1518....jpg?w=600');
```

### Option 2: Via API (Create/Update Endpoint)
```javascript
// Send multiple images via ProductDTO
{
  "name": "Product Name",
  "price": 99.99,
  "imageUrl": "primary-image-url",
  "images": [
    "primary-image-url",
    "secondary-image-url",
    "tertiary-image-url"
  ]
}
```

### Option 3: Admin Dashboard
- Create/Edit product form
- Select main image for `imageUrl`
- Add additional images for gallery

## Performance Considerations

### Image Optimization
- Unsplash URLs include `fit=crop` for consistent aspect ratios
- Width parameters reduce file size (400px vs full resolution)
- CDN caching improves load times

### Lazy Loading
- Consider implementing `loading="lazy"` for image tags
- ProductCard images load on demand
- ProductDetail main image uses Framer Motion for smooth transitions

### Caching
- Unsplash CDN caches images globally
- Browser caches images locally
- No need for server-side image storage

## Future Enhancements

1. **Image Upload to S3**:
   - Store product images in AWS S3
   - Generate multiple sizes (thumbnail, card, detail)
   - Remove dependency on Unsplash free tier

2. **Image Gallery**:
   - Lightbox effect for full-size viewing
   - Image zoom on hover
   - Swipe support on mobile

3. **Admin Dashboard**:
   - Drag-and-drop image upload
   - Batch image processing
   - Image URL validation

## Current Status

✅ All 75+ products have images from Unsplash  
✅ ProductCard displays images with fallbacks  
✅ ProductDetailPage shows images with gallery  
✅ Images responsive across desktop/tablet/mobile  
✅ Unsplash attribution auto-provided by CDN  

**Note**: Images are loaded from Unsplash CDN. Ensure internet connectivity for image display.
