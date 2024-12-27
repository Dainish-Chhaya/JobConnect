
# 🚀 Job Application Portal

JobConnect - "Where Ambition Meets Opportunity!"

## 📄 Overview
The **Job Application Portal** is a robust web application designed to simplify and streamline the job application process for applicants, recruiters, and administrators. With role-based features, the platform ensures tailored functionality for each type of user, making it a comprehensive solution for job management and recruitment needs.

## ✨ Key Features

### 🔑 Admin Features:

- **Job Category Management**: Create, update, and delete job categories.
- **User Management**: View all registered recruiters and applicants.

### 🤝 Recruiter Features:
- **Job Management**: Post, update, and delete job postings categorized under specific job categories.
- **Candidate Management**:
  - View applicants for specific jobs.
  - Send interview links via email.
  - Reject candidates.
  - Generate offer letters dynamically using iText PDF.
- **CRUD Operations**: Perform CRUD operations for job postings and candidate profiles.

### 🧑‍💻 Applicant Features:
- **Job Application**: View and apply for jobs.
- **Profile Management**: Create and manage a detailed profile, including skills and relevant information.
- **Job Listings**: Browse all available job postings.

## Technologies Used

### ⚙️ Backend:
- **Spring Boot**: Application framework for seamless development.
- **Spring Security**: Implements role-based security for Admin, Recruiter, and Applicant roles.
- **Hibernate ORM**: Efficient object-relational mapping.
- **MySQL**: Database for storing application data.
- **Apache POI**: For handling Excel files, if applicable.
- **iText**: For generating dynamic PDF offer letters.

### 🖼️ Frontend:
- **JSP Pages**: Dynamic rendering of web pages.
- **HTML/CSS/Bootstrap**: Ensures a responsive and user-friendly interface.

### 🌟 Highlighted Features
- **Role-Based Security**: Granular control of features based on user roles (Admin, Recruiter, Applicant).
- **Dynamic Offer Letter Generation**: Uses iText to create personalized offer letters in PDF format.
- **Email Notifications**: Integrated email functionality to notify candidates of interview schedules.
- **Comprehensive Job Management**: Recruiters can manage jobs effectively with CRUD operations.
- **Profile Customization**: Applicants can create rich profiles showcasing their skills and experiences.

## ⚙️ Setup and Installation

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   ```
2. **Database Setup**:
   - Create a MySQL database and configure the application properties in `application.properties`.
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/job_portal
   spring.datasource.username=<your-username>
   spring.datasource.password=<your-password>
   ```
3. **Build and Run the Application**:
   - Use Maven to build the project:
     ```bash
     mvn clean install
     ```
   - Run the Spring Boot application:
     ```bash
     mvn spring-boot:run
     ```
4. **Access the Application**:
   - Navigate to `http://localhost:8080` in your web browser.

## Usage Instructions

### Admin:
1. Log in with Admin credentials.
2. Manage job categories and view registered users.

### Recruiter:
1. Log in with Recruiter credentials.
2. Post jobs, view applicants, and manage job postings.
3. Send interview links and generate offer letters.

### Applicant:
1. Create an account and log in.
2. Apply for jobs, manage your profile, and browse job postings.

## Future Enhancements
- Implement dashboards with analytics for Admins and Recruiters.
- Add support for multiple file uploads (e.g., resumes).

## Contributors
- **Dainish Chhaya**: 
  Please connect me at chhaya.d@northeastern.edu in case of any questions!

---

**Note:** Feel free to fork, contribute, or use this project for educational and professional purposes. Feedback and contributions are highly appreciated!
