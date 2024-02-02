# Base image for a Python environment
FROM python:3.9  
# Adjust Python version if needed

# Copy project files
COPY bikeshare_model_api /app

RUN ls -lrth && pwd

# Set working directory to /app
WORKDIR /app

RUN ls -lrth && pwd

# COPY ../dist/bikeshare_model-0.0.1-py3-none-any.whl bikeshare_model-0.0.1-py3-none-any.whl
COPY dist/bikeshare_model-0.0.1-py3-none-any.whl bikeshare_model-0.0.1-py3-none-any.whl

# Copy only the requirements.txt file first
COPY bikeshare_model_api/requirements.txt requirements.txt

# Install dependencies from requirements.txt
RUN pip install -r requirements.txt

# Expose port 8001 for the FastAPI application
EXPOSE 8001

# Run the main application file on container startup
CMD ["python", "app/main.py"]