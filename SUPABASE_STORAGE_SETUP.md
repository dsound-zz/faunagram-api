# Supabase Setup for Faunagram

This guide will help you set up Supabase for **both database AND storage** for your Faunagram Rails API, deployed on Heroku.

## Prerequisites

1. A Supabase account (sign up at https://supabase.com)
2. A Supabase project created
3. Heroku account and CLI installed
4. Your Rails app ready to deploy

## Step 1: Get Your Supabase Database Connection String

1. Go to your Supabase project dashboard
2. Navigate to **Settings** → **Database**
3. Scroll down to **Connection string** section
4. Select **URI** format
5. Copy the connection string (looks like `postgresql://postgres:[YOUR-PASSWORD]@db.xxxxx.supabase.co:5432/postgres`)
6. Replace `[YOUR-PASSWORD]` with your actual database password (found in **Settings** → **Database** → **Database password**)
7. Your final connection string should look like: `postgresql://postgres:yourpassword@db.xxxxx.supabase.co:5432/postgres`

## Step 2: Enable S3 API Compatibility (if needed)

1. Go to your Supabase project dashboard
2. Navigate to **Settings** → **API**
3. Look for **S3 API** settings and enable it if available
4. Note: Some Supabase projects have S3 compatibility enabled by default

## Step 3: Create a Storage Bucket in Supabase

1. Go to your Supabase project dashboard
2. Navigate to **Storage** in the left sidebar
3. Click **New bucket**
4. Name it `faunagram` (or whatever you prefer)
5. Make it **Public** (so images can be accessed via URL)
6. Click **Create bucket**

## Step 4: Get Your Supabase Storage Credentials

1. In your Supabase dashboard, go to **Settings** → **API**
2. Copy your **Project URL** (looks like `https://xxxxx.supabase.co`)
3. Copy your **service_role key** (NOT the anon key - you need the service_role key for server-side operations)
   - ⚠️ **Important**: Keep this key secret! Never commit it to git.

## Step 5: Configure Environment Variables on Heroku

Set all the required environment variables:

```bash
# Database connection (Supabase PostgreSQL)
heroku config:set SUPABASE_DATABASE_URL=postgresql://postgres:yourpassword@db.xxxxx.supabase.co:5432/postgres

# Storage configuration
heroku config:set SUPABASE_URL=https://your-project-ref.supabase.co
heroku config:set SUPABASE_SERVICE_KEY=your-service-role-key-here
heroku config:set SUPABASE_BUCKET=faunagram
heroku config:set SUPABASE_REGION=us-east-1
```

**Important Notes:**
- Replace `yourpassword` with your actual Supabase database password
- Replace `xxxxx` with your Supabase project reference
- The `SUPABASE_SERVICE_KEY` is your **service_role** key (NOT the anon key)
- Keep these values secret - never commit them to git!

### For Local Development (using Figaro):

Add to `config/application.yml`:

```yaml
development:
  SUPABASE_DATABASE_URL: postgresql://postgres:yourpassword@db.xxxxx.supabase.co:5432/postgres
  SUPABASE_URL: https://your-project-ref.supabase.co
  SUPABASE_SERVICE_KEY: your-service-role-key-here
  SUPABASE_BUCKET: faunagram
  SUPABASE_REGION: us-east-1

production:
  SUPABASE_DATABASE_URL: postgresql://postgres:yourpassword@db.xxxxx.supabase.co:5432/postgres
  SUPABASE_URL: https://your-project-ref.supabase.co
  SUPABASE_SERVICE_KEY: your-service-role-key-here
  SUPABASE_BUCKET: faunagram
  SUPABASE_REGION: us-east-1
```

**Note**: Make sure `config/application.yml` is in `.gitignore`!

## Step 6: Run Database Migrations

After setting up the database connection, run your migrations:

```bash
# On Heroku
heroku run rails db:migrate

# Or locally (if using Supabase for development)
rails db:migrate
```

## Step 7: Verify Configuration

The following configurations have been updated:
- `config/database.yml` - Uses `SUPABASE_DATABASE_URL` for production
- `config/storage.yml` - Configured with Supabase Storage service
- `config/environments/production.rb` - Set to use `:supabase` storage service

## Step 8: Update Image URLs in Frontend

Since Supabase Storage provides public URLs, you'll need to update your frontend to use Supabase URLs instead of Rails Active Storage URLs.

### Option A: Use Supabase Public URLs Directly

Supabase Storage provides public URLs in the format:
```
https://your-project-ref.supabase.co/storage/v1/object/public/faunagram/image-path.jpg
```

### Option B: Use Rails Active Storage URLs (Recommended)

If you want to keep using Active Storage URLs, you'll need to configure Supabase to serve files through your Rails app, or update the `REACT_APP_BASE_URI` to point to Supabase's public URL.

Actually, with Active Storage, Rails will generate URLs that point to your Rails app, which will then proxy to Supabase. This should work automatically.

## Step 9: Deploy and Test

1. **Deploy to Heroku:**
   ```bash
   git add .
   git commit -m "Configure Supabase for database and storage"
   git push heroku main
   ```

2. **Run migrations:**
   ```bash
   heroku run rails db:migrate
   ```

3. **Test the setup:**
   - Test database connection (create a user, create a sighting)
   - Test image uploads (avatar or sighting images)
   - Verify images are stored in your Supabase bucket
   - Check that images display correctly in your frontend
   - Verify data is being saved to Supabase PostgreSQL

## Troubleshooting

### Database Connection Issues

- Verify your `SUPABASE_DATABASE_URL` is correct and includes the password
- Check that your Supabase project is active
- Ensure the database password is correct
- Test the connection string locally first: `psql "your-connection-string"`

### Images Not Uploading

- Verify your `SUPABASE_SERVICE_KEY` is correct (use service_role key, not anon key)
- Check that the bucket name matches exactly
- Ensure the bucket is set to **Public** if you want public access

### CORS Errors

- Supabase Storage should handle CORS automatically for public buckets
- If you see CORS errors, check your Supabase bucket settings

### Wrong Endpoint Format

If you encounter issues with the S3 endpoint:
- The endpoint should be: `https://your-project-ref.supabase.co/storage/v1`
- Make sure S3 API compatibility is enabled in your Supabase project
- Some Supabase projects might use different endpoint formats - check Supabase documentation
- You might need S3-specific access keys (different from service_role key) - check Supabase Storage S3 settings

### Active Storage URL Issues

If Active Storage URLs aren't working, you might need to:
1. Configure Supabase bucket policies
2. Use Supabase's direct public URLs instead
3. Set up a proxy in your Rails app

## Alternative: Direct Supabase Storage API

If the S3-compatible approach doesn't work, you can use Supabase's Storage API directly:

1. Add `supabase-rb` gem to your Gemfile
2. Create a custom service or update your controllers to use Supabase Storage API directly
3. This requires more code changes but gives you more control

## Architecture Summary

**Database:** Supabase PostgreSQL (managed PostgreSQL)
**Storage:** Supabase Storage (S3-compatible object storage)
**App Hosting:** Heroku (Rails API)
**Frontend:** Vercel (React app)

## Notes

- The `aws-sdk-s3` gem is still in your Gemfile because Supabase Storage is S3-compatible
- You don't need Heroku Postgres addon - Supabase provides the database
- Development can still use local database/storage if you prefer
- Production uses Supabase for both database and storage
- All data (database + images) is stored in Supabase
- Heroku only runs your Rails API code

