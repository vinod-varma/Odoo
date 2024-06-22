#!/bin/bash
set -e

# Read environment variables from .env file
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi

# Function to wait for PostgreSQL to be ready
function wait_for_postgres {
    timeout=30
    echo "Waiting for PostgreSQL to be ready..."
    until PGPASSWORD="${SERVICE_PASSWORD_POSTGRES}" pg_isready -h "db" -p "5432" -U "${SERVICE_USER_POSTGRES}" >/dev/null 2>&1; do
        sleep 1
        timeout=$((timeout - 1))
        if [ $timeout -eq 0 ]; then
            echo "Timeout occurred waiting for PostgreSQL"
            exit 1
        fi
    done
    echo "PostgreSQL is ready"
}

# Wait for PostgreSQL to be ready
wait_for_postgres

# Handle different entrypoint commands
case "$1" in
    -- | odoo)
        shift
        exec odoo "$@"
        ;;
    -*)
        exec odoo "$@"
        ;;
    *)
        exec "$@"
esac

exit 1
