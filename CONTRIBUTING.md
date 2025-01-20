# Contributing to Wellness Management System

## Development Setup Guide

### First Time Setup

1. **Set up your development environment:**

```bash
# Install Node Version Manager (nvm)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Install and use Node.js 16
nvm install 16
nvm use 16

# Install Java 17 (on Ubuntu/Debian)
sudo apt update
sudo apt install openjdk-17-jdk

# Install Maven
sudo apt install maven

# Install PostgreSQL
sudo apt install postgresql postgresql-contrib
```

2. **Configure PostgreSQL:**

```bash
# Start PostgreSQL service
sudo service postgresql start

# Access PostgreSQL
sudo -u postgres psql

# In PostgreSQL console:
CREATE DATABASE wellness_db;
CREATE USER your_username WITH ENCRYPTED PASSWORD 'your_password';
GRANT ALL PRIVILEGES ON DATABASE wellness_db TO your_username;
```

### Development Workflow

1. **Fork and Clone:**
```bash
# Fork the repository on GitHub, then:
git clone https://github.com/your-username/wellness-management-system-2025.git
cd wellness-management-system-2025
```

2. **Create a Branch:**
```bash
git checkout -b feature/your-feature-name
```

3. **Setup Frontend Development:**
```bash
cd frontend
npm install

# Start development server
npm start
```

4. **Setup Backend Development:**
```bash
cd backend
mvn clean install
mvn spring-boot:run
```

### Code Style Guidelines

#### Frontend (React)
- Use functional components with hooks
- Follow the Airbnb JavaScript Style Guide
- Use meaningful component and variable names
- Include proper PropTypes
- Write tests for components
- Use Prettier for code formatting

#### Backend (Spring Boot)
- Follow Java Code Conventions
- Use proper package structure
- Write unit tests for services
- Document APIs using Swagger
- Use meaningful names for classes and methods
- Keep methods small and focused

### Testing

#### Frontend Tests:
```bash
cd frontend
npm test
```

#### Backend Tests:
```bash
cd backend
mvn test
```

### Making Changes

1. Write and commit your changes:
```bash
git add .
git commit -m "Description of your changes"
```

2. Push to your fork:
```bash
git push origin feature/your-feature-name
```

3. Create a Pull Request:
- Go to the original repository
- Click "New Pull Request"
- Select your fork and branch
- Fill in the PR template

### Development Best Practices

1. **Code Organization:**
   - Keep components small and focused
   - Use proper file structure
   - Follow separation of concerns

2. **State Management:**
   - Use React hooks appropriately
   - Keep state as local as possible
   - Document complex state logic

3. **Security:**
   - Never commit sensitive data
   - Use environment variables
   - Follow security best practices

4. **Performance:**
   - Optimize images and assets
   - Use lazy loading where appropriate
   - Monitor bundle size

### Debugging Tips

1. **Frontend:**
   - Use React Developer Tools
   - Check browser console for errors
   - Use console.log() strategically

2. **Backend:**
   - Use proper logging
   - Check application logs
   - Use debugger in IDE

### Additional Resources

- [React Documentation](https://reactjs.org/docs)
- [Spring Boot Documentation](https://docs.spring.io/spring-boot/docs/current/reference/html/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
