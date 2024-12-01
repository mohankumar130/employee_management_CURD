# Use a base Python image
FROM python:3.14.0a2-slim

# Set the working directory in the container
WORKDIR /app

# Copy the application code into the container
COPY . /app/

# Install system dependencies (if needed, e.g., for compiling dependencies like lxml)
RUN apt-get update && apt-get install -y \
    build-essential \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y cockpit

# Install Python dependencies
# First, upgrade pip
RUN pip install --upgrade pip

# Copy and install dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8000 for Django
EXPOSE 8000

# Command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
