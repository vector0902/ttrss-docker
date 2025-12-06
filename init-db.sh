#!/bin/sh

# Initialize PostgreSQL
rc-update add postgresql default
rc-service postgresql start

# Wait for PostgreSQL to start
sleep 5

# Create database and user
sudo -u postgres createuser -s ttrss || true
sudo -u postgres createdb -O ttrss ttrss || true
sudo -u postgres psql -c "ALTER USER ttrss PASSWORD 'ttrss';" || true

# Initialize tt-rss database
sudo -u postgres psql -d ttrss -f /var/www/html/schema/ttrss_schema_pgsql.sql || true

# Stop PostgreSQL for supervisord to manage
rc-service postgresql stop