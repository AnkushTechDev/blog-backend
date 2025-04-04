# Blog Backend Overview

This Blog Backend Application is a comprehensive content management platform built using **NestJS**. It offers a seamless blogging experience with advanced features such as secure user authentication, role-based access control, and CRUD operations for managing blog posts. It is fully containerized with **Docker** and is managed using **Amazon ECR** for deployment.

## Key Features

- **User Authentication & Authorization**: Secure authentication using **JWT tokens** and role-based access control (Admin, Author, Reader).
  
- **CRUD Operations**: Easy-to-use API for creating, reading, updating, and deleting blog posts.

- **Dockerized Application**: The app is packaged into a Docker container and managed by **Amazon ECR** for deployment.

- **Automated CI/CD Pipelines**: Built with **GitHub Actions** to automate testing, building, and deploying the application.

- **Prisma ORM**: Utilized for efficient database handling and migrations.

- **API Versioning**: Ensures backward compatibility and smooth updates through versioned APIs.

## Installation

### Prerequisites

1. **Node.js** version 18 or higher.
2. **PostgreSQL** installed locally, or use a hosted version.
3. **NestJS** version 9.0.0 or higher.
4. Clone the repository and navigate into the project folder.

    ```bash
    git clone https://github.com/your-repo/blog-app.git
    cd blog-app
    ```

5. Install the dependencies:

    ```bash
    npm install
    ```

### Environment Variables Setup

1. Copy the `env.example` to `.env` and configure the PostgreSQL database connection string:

    ```bash
    DATABASE_URL=your_postgresql_connection_string
    ```

2. Run the Prisma migrations:

    ```bash
    npx prisma db migrate
    ```

3. Seed the database to insert default roles and users:

    ```bash
    npx prisma seed
    ```

## Running the Application

### Locally:

- **Start in Development Mode**:

    ```bash
    npm run start
    ```

- **Start in Watch Mode** (auto-reloads when changes are made):

    ```bash
    npm run start:dev
    ```

- **Start in Production Mode**:

    ```bash
    npm run start:prod
    ```

### Running with Docker:

1. Build the Docker image:

    ```bash
    docker build -t nestjs-blog-app .
    ```

2. Run the Docker container (ensure `.env` is set up properly):

    ```bash
    docker run -p 3000:3000 --env-file .env nestjs-blog-app
    ```

## Testing

To ensure the application is working as expected, use the following commands to run tests:

- **Unit Tests**:

    ```bash
    npm run test
    ```

- **End-to-End (e2e) Tests**:

    ```bash
    npm run test:e2e
    ```

- **Test Coverage**:

    ```bash
    npm run test:cov
    ```

---

### Notes:

- The application uses **JWT** for secure authentication and authorization. You will need to configure the `SECRET_KEY` in your `.env` file for it to work properly.
- **Docker** is used to create a portable and consistent environment for both development and production.
- **Prisma ORM** is integrated for seamless database management and migrations.
