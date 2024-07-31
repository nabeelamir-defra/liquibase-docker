# Use the official Liquibase image as the base image
FROM liquibase/liquibase:latest

# Set the working directory inside the container
WORKDIR /liquibase

# Copy your migration files into the container
COPY db ./db

# Define the environment variables for the database connection
# These should be overridden at runtime with --env-file or -e options
ENV ACTION=update

# Run Liquibase update to apply the migrations
# Command to run Liquibase update with all necessary parameters
CMD ["sh", "-c", \
    "liquibase \
    --url=jdbc:postgresql://host.docker.internal:5432/rcr_api \
    --username=postgres \
    --password=password \
    --defaultSchemaName=public \
    --changeLogFile=db/changelog/db.changelog-master.xml \
    $ACTION"]