# Database Setup Guide

This folder contains all SQL scripts for the WishCrate e-commerce application.

## Files

- **setup.sql** - Database schema reference (not needed as Spring Boot JPA handles schema creation)
- **data.sql** - Initial sample data (5 categories, 77 products, sample users)
- **data-migration.sql** - Optional data migrations for image URL population

## Automatic vs Manual Setup

### Spring Boot Automatic Initialization (Removed)
Previously, Spring Boot would automatically load `data.sql` on startup using the `sql.init.data-locations` configuration. This feature has been disabled to keep database files organized in a dedicated folder.

**Configuration changed in `application.yml`:**
```yaml
spring:
  sql:
    init:
      mode: never  # No automatic initialization
```

## Manual Database Setup

Follow these steps to populate your database with sample data:

### Option 1: Using psql (PostgreSQL CLI)

```bash
# Connect to PostgreSQL
psql -U postgres -d wishcrate

# Run setup script (optional - Spring Boot creates tables via JPA)
\i database/setup.sql

# Load sample data
\i database/data.sql

# Run migrations (optional)
\i database/data-migration.sql
```

### Option 2: Using pgAdmin
1. Open pgAdmin in browser
2. Right-click database → Query Tool
3. Open and execute `database/data.sql`
4. Then execute `database/data-migration.sql`

### Option 3: Create a Spring Boot Initializer Component
Add back automatic initialization by:
1. Creating a `@Component` with `CommandLineRunner` that reads and executes the SQL files
2. Or re-enable `sql.init.mode: on_first_use` and restore classpath: references in `application.yml`

## Database Schema

The application uses the following tables (auto-created via JPA):

```
categories          products            users
├── id              ├── id              ├── id
├── name            ├── name            ├── email
├── description     ├── description     ├── password
├── image_url       ├── price           ├── username
└── parent_id       ├── category_id     ├── first_name
                    ├── stock_quantity  ├── last_name
                    ├── image_url       ├── phone_number
                    ├── average_rating  ├── role
                    ├── total_reviews   └── created_at
                    ├── active
                    ├── featured
                    ├── images
                    └── specifications
```

## Sample Data Included

**Categories (5):**
- Electronics (17 products)
- Fashion (15 products)
- Home & Garden (15 products)
- Sports (15 products)
- Books (15 products)

**Total Products:** 77 with pricing, descriptions, images, and ratings

**Sample Users:** Test accounts for login

## Notes

- Categories are inserted first, then products (maintains foreign key integrity)
- PostgreSQL sequence is synchronized after explicit ID inserts
- Product images use Unsplash URLs in the `images` array
- Optional `imageUrl` field can be populated via data-migration.sql
- All SQL files are compatible with PostgreSQL 12+

## For Production

In production, consider:
1. Using migrations tools like Flyway or Liquibase
2. Externalizing database configuration
3. Using environment-specific data files
4. Implementing blue-green deployment with data migrations
5. Automated backups and recovery procedures

