FROM ghcr.io/saleor/saleor:3.20

# Set the working directory
WORKDIR /app

# Copy required environment files
COPY common.env backend.env ./

# Expose the necessary ports
EXPOSE 8000


# Start Saleor API server
CMD ["gunicorn", "saleor.wsgi", "--bind", "0.0.0.0:8000", "--workers", "1"]
