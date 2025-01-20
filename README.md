# Wellness Management System

An integrated wellness management system for managing Pilates, Massage, Nutrition, and Yoga activities.

## Prerequisites

Before you begin, ensure you have the following installed:
- Node.js (v16.x or later)
- Java Development Kit (JDK) 17
- Maven (v3.8.x or later)
- PostgreSQL (v13 or later)
- Git

## Project Structure

```
wellness-management-system/
├── frontend/           # React frontend application
└── backend/           # Spring Boot backend application
```

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/chandratejatiriveedhi/wellness-management-system-2025.git
cd wellness-management-system-2025
```

### 2. Backend Setup

1. Configure PostgreSQL:
```sql
CREATE DATABASE wellness_db;
```

2. Navigate to backend directory:
```bash
cd backend
```

3. Update database configuration:
Edit `src/main/resources/application.properties` with your PostgreSQL credentials:
```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/wellness_db
spring.datasource.username=your_username
spring.datasource.password=your_password
```

4. Build and run the backend:
```bash
mvn clean install
mvn spring-boot:run
```
The backend server will start on http://localhost:8080

### 3. Frontend Setup

1. Navigate to frontend directory:
```bash
cd frontend
```

2. Install dependencies:
```bash
npm install
```

3. Create `.env` file:
```bash
REACT_APP_API_URL=http://localhost:8080/api
```

4. Start the development server:
```bash
npm start
```
The frontend application will start on http://localhost:3000

## Available Scripts

In the frontend directory:
- `npm start`: Runs the app in development mode
- `npm test`: Launches the test runner
- `npm run build`: Builds the app for production
- `npm run eject`: Ejects from Create React App

In the backend directory:
- `mvn spring-boot:run`: Runs the backend server
- `mvn test`: Runs the test suite
- `mvn clean install`: Builds the application

## Default Users

The system comes with default users for testing:

1. Admin User:
   - Username: admin
   - Password: admin123

2. Teacher User:
   - Username: teacher
   - Password: teacher123

3. Student User:
   - Username: student
   - Password: student123

## Features

- User Authentication and Authorization
- Activity Management
- Schedule Management
- Attendance Tracking
- Evaluation Management
- Report Generation
- User Profile Management

## Security

The application implements the following security measures:
- JWT-based authentication
- Role-based access control
- Password encryption using BCrypt
- CORS configuration
- XSS protection

## API Documentation

Once the backend is running, you can access the API documentation at:
http://localhost:8080/api/swagger-ui.html

## Troubleshooting

Common issues and solutions:

1. Database Connection Issues:
   - Verify PostgreSQL is running
   - Check database credentials
   - Ensure database exists

2. Port Conflicts:
   - Backend: Change port in application.properties
   - Frontend: Change port by using PORT environment variable

3. Build Errors:
   - Clear node_modules and reinstall packages
   - Clear Maven cache and rebuild
   - Check Java version compatibility

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details