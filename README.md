# Employee & HR Onboarding Portal

This project implements a microservices-based web application for managing employee onboarding. It includes services for user authentication, employee data management, housing logistics, email communication, and centralized configuration and service discovery.


## 💻 Getting Started

Before you can run the application, you'll need to clone the repository and ensure all necessary submodules are initialized.

### 1\. Clone the Repository

To get started, clone the repository to your local machine using Git:

```bash
git clone https://github.com/Beaconfire-Jul-2025/HR.git
```

### 2\. Initialize Submodules

This project uses Git submodules. After cloning, navigate into the project directory and initialize them recursively:

```bash
cd HR
git submodule update --init --recursive
```

## 🚀 How to Run

### 1. Start Infrastructure Services

This will start databases, message brokers, and developer tools like LocalStack and Mongo Express.

```bash
docker-compose -f docker-compose.infra.yaml up -d --build
```

### 2. Start Core Backend Services

This will spin up infrastructure services, config server, service registry, API gateway, and authentication service.

```bash
docker-compose -f docker-compose.base.yaml up -d --build
```

---

## 📌 Project Goal

We want to create an employee and HR website portal for managing the new employee onboarding process. Employees will be able to:

* Update personal information
* Upload required documents for identification and work authorization
* Monitor their housing situation

HR will be able to:

* Access employee information
* Make changes regarding onboarding status
* Manage housing assignments

---

## 🧩 System Design Overview

### Microservices Architecture

This project is structured as a set of Spring Boot-based microservices, coordinated using a centralized configuration server and service discovery.

### Core Services

| Service                 | Description                                                | Port (For Development)|
| ----------------------- | ---------------------------------------------------------- |------|
| **Authentication**      | Manages login and identity verification                    | 9081 |
| **Employee Service**    | Handles personal and employment details (uses MongoDB)     | 9082 |
| **Application Service** | Manages onboarding application workflow                    | 9083 |
| **Housing Service**     | Manages employee housing status and records                | 9084 |
| **Email Service**       | Sends email notifications (via RabbitMQ)                   | 9085 |
| **Composite Service**   | Aggregates multiple services for higher-level functions    | 9086 |
| **Frontend**            | React-based user interface for employees and HR            | 8000 |

### Supporting Services

| Service           | Description                                            | Port (For Development) |
| ----------------- | ------------------------------------------------------ |------------------------|
| **Config Server** | Central configuration source for all services          | 8888 |
| **Eureka Server** | Service registry for discovery of microservices        | 8761 |
| **Gateway**       | API Gateway for routing requests to services           | 8080 |
| **MySQL**         | Stores structured data like user, application and housing info | 3306 |
| **MongoDB**       | Stores employee data                                   | 27017 |
| **RabbitMQ**      | Message broker for async communication (email service) | 5672, 15672 |
| **LocalStack**    | Emulates AWS services for testing (e.g., S3 uploads)   | 4566,4571 |
| **Mongo Express** | Web UI for interacting with MongoDB                    | 8090 |

---

## 🔧 Configuration

### Volumes and Initialization Scripts

* MySQL initializes with scripts in `./mysql`
* MongoDB uses `./mongodb/mongo-init.js`

### Environment Variables

Each service uses appropriate Spring Boot profiles and environment variables for connecting to other services, databases, and frontend.

---

## 📝 Notes

* Ensure Docker and Docker Compose are installed on your machine.
* Initial startup may take time as all services build and initialize.
* Access the React frontend at: `http://localhost:3000`
* Eureka dashboard: `http://localhost:8761`
* Mongo Express UI: `http://localhost:8090`
* RabbitMQ Management UI: `http://localhost:15672` (default user: `guest`, password: `guest`)
