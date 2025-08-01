FROM python:3.10-slim

WORKDIR /app

# Copy only requirements.txt first to leverage Docker cache for dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . .

# Expose port 8000 for container networking (optional but good practice)
EXPOSE 8000

# Run Uvicorn, binding to all interfaces so container port mapping works
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
