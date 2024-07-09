
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy application code
COPY . .
COPY init_iller.sh /app/init_iller.sh
RUN chmod +x /app/init_iller.sh
RUN ./init_iller.sh
# Expose port 4444
EXPOSE 4444

# Command to run the application
CMD ["python", "iller.py"]

