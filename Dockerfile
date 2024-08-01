# Use the official Liquibase image as the base image
FROM liquibase/liquibase:latest

# Set the working directory inside the container
WORKDIR /liquibase

# Copy your migration files into the container
COPY db ./db

# Define the environment variables for the database connection
# These should be overridden at runtime with --env-file or -e options
ENV ACTION=update
ENV DATABASE_USERNAME=""
ENV DATABASE_PASSWORD=""
ENV DATABASE_PORT=5432
ENV DATABASE_HOST=""

# Copy the bash script and change the permission to make it executable
COPY --chmod=755 entrypoint.sh /entrypoint.sh

# Use the script as the entry point
ENTRYPOINT ["/entrypoint.sh"]
