This project was developed as part of a DevOps internship to demonstrate practical knowledge of containerization, container orchestration, and deployment using tools such as Docker and Kubernetes.

# The application follows a three-tier architecture:

## Frontend (React)

Provides the user interface where users can view and add entries.
Communicates with the backend through HTTP requests.

## Backend (FastAPI)

Handles API requests, performs data validation, and interacts with MongoDB.
Exposes RESTful endpoints for operations like retrieving and adding users.

## Database (MongoDB)

Stores user data.
The backend connects to it to perform CRUD operations.

# Workflow:

When a user interacts with the frontend (by submitting a new user form), the frontend sends a request to the FastAPI backend. The backend processes the request, updates the MongoDB database, and returns a response to the frontend, which updates the user interface accordingly.

## To install dependencies

```bash
./scripts/setup.sh
```

## To run locally

```bash
./scripts/start_natively.sh
```

## To build the Docker images

```bash
./scripts/build_images.sh
```

### Or build each one individually

```bash
./scripts/build_frontend.sh
```

```bash
./scripts/build_backend.sh
```

## To run the conatinerized images

```bash
./scripts/start_containerized.sh
```

## To run backend only locally

```bash
./scripts/start_backend_natively.sh
```

### Or using docker compose

```bash
./scripts/start_backend_containerized.sh
```

### to stop and remove the containers

```bash
./scripts/stop_compose.sh
```

## Frontend → http://localhost:3000

## Backend → http://localhost:8000/users
