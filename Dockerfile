# Use the official Python image as the base image
FROM python:3.11-slim 

# Set environment variables to prevent Python from writing .pyc files and to ensure that Python output is sent straight to the terminal without buffering
ENV PYTHONUNBUFFERED=1
# Set environment variable to prevent Python from writing .pyc files
ENV PYTHONDONTWRITEBYTECODE=1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Upgrade pip to the latest version
RUN pip install --upgrade pip
# Install the dependencies specified in the requirements file
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose the port that the application will run on
EXPOSE 8000

# Set the command to run the application 
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
