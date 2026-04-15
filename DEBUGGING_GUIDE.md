# Debugging Guide - Categories Not Loading

## Quick Diagnosis Steps

### Step 1: Check Browser Console
1. Open your browser (Chrome, Firefox, Safari)
2. Press `F12` or `Right-click → Inspect`
3. Click on the **"Console"** tab
4. Look for any error messages (shown in RED)
5. Check if you see `"Categories loaded:"` message with the list of categories

### Step 2: Check Network Tab
1. In DevTools, click on the **"Network"** tab
2. Reload the page (F5)
3. Look for a request to `wishcrate.onrender.com/api/categories`
4. Check the response status:
   - ✅ **200** = Success
   - ❌ **404** = Endpoint not found
   - ❌ **403** = Forbidden/CORS issue
   - ❌ **500** = Server error

### Step 3: Check ProductFilter Component
1. Go to the Products page (`/products`)
2. Open the Network tab
3. Look at the response from `/api/categories`
4. It should return JSON array like:
```json
[
  {"id": 1, "name": "Electronics", "description": "..."},
  {"id": 2, "name": "Fashion", "description": "..."},
  ...
]
```

## Common Issues and Fixes

### Issue 1: Categories dropdown is empty but no errors
**Possible Cause**: Categories loaded but not displaying in dropdown
**Fix**: 
- Check that categories have a valid `id` field
- Ensure category names are not empty strings
- Try refreshing the page (Ctrl+Shift+R for hard refresh)

### Issue 2: CORS Error in console
**Error message**: "Access to XMLHttpRequest at 'https://wishcrate.onrender.com/api/categories' from origin 'https://...' blocked by CORS"
**Possible Cause**: Backend CORS configuration issue
**Fix**: 
- This might be a temporary Render.com issue
- Check the backend `SecurityConfig.java` for CORS settings
- Restart the backend service

### Issue 3: 500 Error on /api/categories
**Error message**: "GET wishcrate.onrender.com/api/categories 500"
**Possible Cause**: Backend error loading categories
**Fix**:
```bash
# Check backend logs - look for:
# - LazyInitializationException
# - NullPointerException
# - Any database connection errors
```

### Issue 4: 404 Error on /api/categories
**Error message**: "GET wishcrate.onrender.com/api/categories 404"
**Possible Cause**: CategoryController is not mapped correctly
**Check**:
- CategoryController has `@RequestMapping("/api/categories")`
- Method `getAllCategories()` has `@GetMapping`
- CategoryController is in component scan path

## Testing the Backend Directly

### Using curl (Command Line)
```bash
curl https://wishcrate.onrender.com/api/categories
```

### Expected Response
```json
[
  {
    "id": 1,
    "name": "Electronics",
    "description": "Electronic devices and gadgets"
  },
  {
    "id": 2,
    "name": "Fashion",
    "description": "Clothing and accessories"
  },
  ...
]
```

## Frontend Console Messages

After the fix, you should see these logs when ProductFilter loads:

```
Categories loaded: Array(5)
  0: {id: 1, name: "Electronics", description: "..."}
  1: {id: 2, name: "Fashion", description: "..."}
  2: {id: 3, name: "Home & Garden", description: "..."}
  3: {id: 4, name: "Sports", description: "..."}
  4: {id: 5, name: "Books", description: "..."}

Products loaded: {content: Array(12), totalPages: 7, ...}
```

## How to Verify Categories Are Working

1. **On Products Page**:
   - Click "All Categories" dropdown
   - Should see list of categories
   - Selecting a category should filter products

2. **On HomePage**:
   - Scroll to "Browse by Category" section
   - Should show 5 category cards
   - Clicking a card should navigate to filtered products

3. **In Console**:
   - ProductFilter component should log categories
   - Should show all 5 categories (Electronics, Fashion, Home & Garden, Sports, Books)

## Database Verification

### Check if categories exist in database

**SQL Query** (run in PostgreSQL):
```sql
SELECT id, name, description FROM categories ORDER BY id;
```

Should return:
```
 id |       name        |              description
----+-------------------+--------------------------------------
  1 | Electronics       | Electronic devices and gadgets
  2 | Fashion           | Clothing and accessories
  3 | Home & Garden     | Home improvement and garden supplies
  4 | Sports            | Sports equipment and fitness
  5 | Books             | Books and educational materials
```

If no results, run the data migration:
```sql
-- From backend/src/main/resources/data.sql lines 16-20
INSERT INTO categories (id, name, description) VALUES (1, 'Electronics', 'Electronic devices and gadgets');
INSERT INTO categories (id, name, description) VALUES (2, 'Fashion', 'Clothing and accessories');
INSERT INTO categories (id, name, description) VALUES (3, 'Home & Garden', 'Home improvement and garden supplies');
INSERT INTO categories (id, name, description) VALUES (4, 'Sports', 'Sports equipment and fitness');
INSERT INTO categories (id, name, description) VALUES (5, 'Books', 'Books and educational materials');
```

## Profile Page - Available Features

### ✅ Working
- **My Orders** → Click to see order history
- **Wishlist** → Click to view saved items

### 🔄 Coming Soon
- **Edit Profile** → Disabled, shows "coming soon" message
- **Addresses** → Shows toast notification when clicked
- **Settings** → Shows toast notification when clicked

All profile icons are now fully functional and responsive!

## Next Steps

1. **Open browser DevTools** (F12)
2. **Go to Products page** and check Console tab
3. **Share any error messages** you see in red
4. **Check Network tab** for `/api/categories` response
5. **Try the above fixes** based on what you find

## Recent Fixes Applied

✅ Added LEFT JOIN FETCH for all product queries (fixes 500 errors)
✅ Added console logging to ProductFilter for debugging
✅ Fixed ProfilePage icon navigation
✅ All profile cards now fully functional
✅ Better error handling in ProductFilter

---

**If categories still don't load after following these steps, please**:
1. Take a screenshot of the Console tab errors
2. Check the Network → /api/categories response
3. Open the browser DevTools and run: `document.querySelectorAll('select')[0]` to see if the dropdown exists
