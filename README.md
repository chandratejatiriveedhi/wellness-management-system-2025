# Wellness Management System

An integrated wellness management system for managing Pilates, Massage, Nutrition, and Yoga activities.

## Prerequisites

Before you begin, ensure you have the following installed:
- Node.js (v16.x or later)
- Java Development Kit (JDK) 17
- Maven (v3.8.x or later)

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

1. Navigate to backend directory:
```bash
cd backend
```

2. Build and run the backend:
```bash
mvn clean install
mvn spring-boot:run
```
The backend server will start on http://localhost:8080

The H2 database console will be available at http://localhost:8080/api/h2-console
- JDBC URL: jdbc:h2:file:./data/wellness_db
- Username: sa
- Password: password

### 3. Frontend Setup

1. Navigate to frontend directory:
```bash
cd frontend
```

2. Install dependencies:
```bash
npm install
```

3. Start the development server:
```bash
npm start
```
The frontend application will start on http://localhost:3000

## Available Scripts

In the frontend directory:
- `npm start`: Runs the app in development mode
- `npm test`: Launches the test runner
- `npm run build`: Builds the app for production

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
- Password encryption
- CORS configuration
- XSS protection

## Troubleshooting

1. Backend startup issues:
   - Check if port 8080 is available
   - Ensure Java 17 is installed correctly
   - Verify Maven installation

2. Frontend issues:
   - Clear node_modules and reinstall packages
   - Check if port 3000 is available
   - Verify Node.js installation

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details