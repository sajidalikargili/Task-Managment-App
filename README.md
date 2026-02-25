Task Manager App (Flutter)

A clean architecture based Task Manager application built using Flutter, Provider (State Management), and Hive (Local Database).

This project demonstrates proper architecture, OOP principles, and local data persistence.

---
Features

-  Create a new task (title, description, optional due date)
-  View list of tasks
   Update/Edit task
   Delete task
-  Mark task as completed/incomplete
-  Local database using Hive
-  Data persists after app restart
-  Clean Architecture implementation
-  Proper folder structure
-  OOP principles applied

---
Architecture

This project follows **Clean Architecture** principles by separating:
1 Presentation Layer
- UI Screens
- Providers (State Management)
- User Interaction

2️ Domain Layer
- Entities
- Repository Abstract Classes
- Business Logic

3️ Data Layer
- Models
- Local Data Source (Hive)
- Repository Implementation
