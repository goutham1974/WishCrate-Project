# Database Files

This folder contains all SQL scripts and database-related files for the WishCrate e-commerce application.

## File Structure

```
database/
├── setup.sql              # Database schema and initial setup
├── data.sql              # Sample product and category data
├── data-migration.sql    # Data migration script for image URLs
└── README.md             # This file
```

## Files Overview

### setup.sql
- **Purpose**: Reference database schema setup
- **Note**: Spring Boot automatically creates tables via JPA using entity definitions
- Used for manual setup if needed or reference documentation

### data.sql
- **Location in Project**: `backend/src/main/resources/data.sql`
- **Purpose**: Initial sample data loaded on application startup
- **Contents**:
  - 5 product categories
  - 77 sample products with descriptions, prices, ratings
  - Sample user accounts for testing
  - Product images from Unsplash
- **Auto-loaded**: When Spring Boot starts with `ddl-auto: create`

### data-migration.sql
- **Location in Project**: `backend/src/main/resources/data-migration.sql`
- **Purpose**: Optional data migrations and updates
- **Contents**:
  - SQL updates to populate `imageUrl` fields
  - Category-based color coding for placeholder images
- **Auto-loaded**: After data.sql via `application.yml` configuration

## Integration with Spring Boot

The SQL files in `backend/src/main/resources/` are automatically loaded by Spring Boot:

```yaml
# application.yml
spring:
  sql:
    init:
      mode: always
      data-locations: classpath:data.sql,classpath:data-migration.sql
```

**Why files are duplicated**: 
- Source files in `backend/src/main/resources/` are required for Spring Boot runtime
- Copies in `database/` folder for documentation and reference

## Database Configuration

**Default Connection**:
- URL: `jdbc:postgresql://localhost:5432/wishcrate`
- Username: `postgres`
- Password: `postgres`

**Environment Variables** (override defaults):
- `DB_URL`: Database connection URL
- `DB_USERNAME`: Database username
- `DB_PASSWORD`: Database password

## Running Migrations

### Automatic (on startup)
1. Start the application: `java -jar wishcrate-backend-1.0.0.jar`
2. Spring Boot automatically:
   - Creates tables (via JPA entities)
   - Loads data.sql
   - Runs data-migration.sql

### Manual (psql)
```bash
# Connect to PostgreSQL
psql -U postgres -d wishcrate

# Run setup script
\i database/setup.sql

# Run data script
\i database/data.sql

# Run migration script
\i database/data-migration.sql
```

## Product Data

The application includes 77 sample products across 5 categories:

| Category | Count | Sample Products |
|----------|-------|-----------------|
| Electronics | 17 | iPhone, MacBook, PlayStation, etc. |
| Fashion | 15 | Nike, Adidas, Jeans, etc. |
| Home & Garden | 15 | KitchenAid, Dyson, Air Fryer, etc. |
| Sports | 15 | Yoga Mat, Dumbbells, Treadmill, etc. |
| Books | 15 | Atomic Habits, 1984, The Hobbit, etc. |

**Each product includes**:
- Name, description, brand
- Price and optional discount price
- Stock quantity
- Unsplash image URLs
- Category reference
- Rating and review count
- Featured/active status

## Schema Overview

### Core Tables
- `products` - Product catalog
- `categories` - Product categories  
- `users` - User accounts
- `orders` - Customer orders
- `order_items` - Items in each order
- `cart` - Shopping carts
- `cart_items` - Items in carts
- `addresses` - User addresses
- `reviews` - Product reviews

### Relationships
- Products → Categories (foreign key)
- Orders → Users (foreign key)
- Order Items → Orders, Products (foreign keys)
- Reviews → Products, Users (foreign keys)

## Notes

- All products have Unsplash image URLs in the `images` array
- Optional `imageUrl` field can be populated with placehold.co URLs via data-migration.sql
- CORS configured to allow image loading from external sources
- Database uses PostgreSQL 12+

## Troubleshooting

**Tables not created**: Verify `ddl-auto: create` or `update` is set in `application.yml`

**Data not loading**: Check `sql.init.mode: always` is enabled

**Foreign key errors**: Ensure categories are inserted before products (handled in data.sql)

**Image loading errors**: Verify CORS is configured in SecurityConfig.java
