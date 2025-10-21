# Recipe Cookbook Application

A production-ready Spring Boot web application for managing and browsing cooking recipes. It was built as part of the Spring Framework Guru curriculum and showcases a clean layered architecture, server-side rendering with Thymeleaf, and multiple persistence options (H2/MySQL; alternative branches for MongoDB and reactive WebFlux).

## Key Features
- Create, update, view, and delete recipes
- Ingredients management with units of measure
- Difficulty levels and categories
- Image upload for recipes
- Server-side rendered UI with Thymeleaf and Bootstrap
- Profiles for local development (H2, MySQL dev) and production (MySQL)

## Tech Stack
- Java 8, Spring Boot 2.2.x
- Spring MVC, Spring Data JPA (Hibernate)
- Databases: H2 (default, in-memory), MySQL (dev/prod profiles)
- View layer: Thymeleaf + Bootstrap
- Build: Maven; Testing: JUnit 5 (via spring-boot-starter-test)

## Architecture at a Glance
- Controllers: handle web requests and responses (Thymeleaf views)
- Services: business logic and transaction boundaries
- Repositories: Spring Data JPA interfaces for persistence
- Converters: map between domain and command (DTO) objects
- Bootstrap: data initialization for demo environments

Project entry point: `com.app.recipe.RecipeappApplication`.

## Getting Started
### Prerequisites
- Java 8 (JDK 1.8)
- Maven 3.6+ (or use the included Maven wrapper: `mvnw.cmd` on Windows)

### Clone and Build
- Build: `./mvnw clean package` (Windows: `mvnw.cmd clean package`)
- Run unit tests: `./mvnw test`

### Run (Default Profile: H2)
By default, the app runs with an embedded H2 database and demo data.
- Run: `./mvnw spring-boot:run`
- Or: `java -jar target/recipe-0.0.1-SNAPSHOT.jar`
- Open: http://localhost:8080

The H2 console can be enabled via Spring Boot defaults; if not visible, you can still use the app UI. Demo data is loaded from `src/main/resources/data-h2.sql` when H2 is active.

## Using MySQL (dev/prod profiles)
MySQL configurations are provided via Spring profiles:
- `dev`: `src/main/resources/application-dev.yml`
  - URL: `jdbc:mysql://localhost:3306/mac_dev`
  - Username: `mac_dev_user`
  - Password: `mac_dev_user`
  - DDL: validate
  - Show SQL: true
- `prod`: `src/main/resources/application-prod.yml`
  - URL: `jdbc:mysql://localhost:3306/mac_prod`
  - Username: `mac_prod_user`
  - Password: `mac_prod_user`
  - DDL: validate
  - Show SQL: false

Helper SQL scripts are available under `src/main/scripts`:
- `database-create-script.sql`: create schema and tables
- `configure-mysql.sql`: user/grants examples

Start with MySQL:
- `./mvnw spring-boot:run -Dspring-boot.run.profiles=dev`
- Or JAR: `java -jar target/recipe-0.0.1-SNAPSHOT.jar --spring.profiles.active=dev`

## Project Structure (high level)
- `src/main/java/com/app/recipe/controllers` – MVC controllers
- `src/main/java/com/app/recipe/services` – service layer (interfaces + impl)
- `src/main/java/com/app/recipe/repositories` – Spring Data repositories
- `src/main/java/com/app/recipe/converters` – DTO/domain converters
- `src/main/resources/templates` – Thymeleaf views
- `src/main/resources` – configuration and SQL/data files

## How to Use
- Visit the home page to view sample recipes
- Create new recipes, add ingredients with measures
- Upload an image for a recipe
- Edit or delete existing recipes

## Branches with Alternative Implementations
This repository includes branches that demonstrate different persistence and programming models:
- MongoDB implementation: https://github.com/GeorgeTsianakas/recipeapp/tree/master-mongo
  - Replaces JPA/MySQL with MongoDB via Spring Data MongoDB
  - Useful to compare document-oriented modeling vs. relational
- Reactive WebFlux implementation: https://github.com/GeorgeTsianakas/recipeapp/tree/master-reactive
  - Uses Spring WebFlux and reactive types (Mono/Flux)
  - Demonstrates non-blocking, reactive programming model

Switching branches (example):
- `git fetch --all`
- `git checkout master-mongo` (MongoDB variant)
- `git checkout master-reactive` (Reactive variant)

## Testing
- Run all tests: `./mvnw test`
- Integration tests use Spring’s test support and may rely on in-memory DB

## Troubleshooting
- Port already in use: change server port via `--server.port=8081`
- MySQL auth/connection issues: verify user, password, and that the DB exists; run scripts under `src/main/scripts`
- Clean build if classes seem stale: `./mvnw clean`

## Contributing
Issues and PRs are welcome. For substantial changes, please open an issue first to discuss your proposal.

## Acknowledgements
- Based on the Spring Framework Guru recipe app tutorial series
- Thanks to the Spring community for excellent tooling and docs