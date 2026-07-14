# Base image
FROM python:3.11-slim 

# Python output (print, log) sathe sathe terminal e dekhabe
ENV PYTHONUNBUFFERED=1
# Python bytecode file (.pyc) generate hobe na, ete image ekto clean thakbe
ENV PYTHONDONTWRITEBYTECODE=1

# Set working directory. Next sob command /app directory theke execute hobe.
WORKDIR /app

# Prothome sodhu requirements.txt file copy korbo, jate docker cache use kore dependency install korte pare. Ete build time kombe.
COPY requirements.txt .

# Pip version update korbo, karon base image e purono pip thakte pare. Ete dependency install er somoy error kombe.
RUN pip install --upgrade pip
# Ekhon requirements.txt file e thaka sob dependency install korbo.
RUN pip install -r requirements.txt

# Project er baki sob file container e copy korbo
COPY . .

# Container er application 8000 port e run hobe.
# (eti sodhu documentation er jonno, docker-compose.yaml file e port mapping kora ache)
EXPOSE 8000

# Container run korar somoy ei command execute hobe. Ekhane Django development server run hobe.
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
