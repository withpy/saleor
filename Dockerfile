# Use official Saleor image
FROM ghcr.io/saleor/saleor:3.20

# Set working directory
WORKDIR /app

# Copy environment files
COPY common.env backend.env ./
RUN pip install --no-cache-dir gunicorn
# Expose the application port (Saleor API runs on 8000)
EXPOSE ${PORT}

# Run Saleor API
CMD ["gunicorn", "--bind", "0.0.0.0:${PORT}", "--workers", "4", "--threads", "4", "--timeout", "120", "saleor.wsgi:application"]
