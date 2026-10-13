# Concept Learning and Summary Verification

A small Java OOP learning exercise built with HTML and JSP. The form is checked
on the server before the submitted summary is shown.

## Requirements

- JDK 11 or newer
- Maven 3.6 or newer
- Apache Tomcat 10.1 (Jakarta Pages/JSP support)

No servlet API dependency or Java servlet is needed; JSP handles the form
verification and forwarding. Do not open the JSP files directly from disk:
they must be processed by Tomcat.

## Build and run

1. Build the WAR from the project folder:

   ```text
   mvn clean package
   ```

2. Copy `target\concept-summary-verifier.war` into Tomcat's `webapps` folder.
3. Start Tomcat with `bin\catalina.bat run` (Windows).
4. Visit `http://localhost:8080/concept-summary-verifier/about.html`.

Tomcat deploys the application at `/concept-summary-verifier`. The pages are
`about.html`, `test.html`, `verify.jsp`, and `display.jsp`.

## Git

Initialize version control and make an initial commit from the project folder:

```text
git init
git add .
git commit -m "Add concept summary verification app"
```
