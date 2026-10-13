<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String summary = request.getParameter("summary");

    name = name == null ? "" : name.trim();
    email = email == null ? "" : email.trim();
    summary = summary == null ? "" : summary;

    boolean startsWithUppercaseEnglishLetter = name.length() > 0
            && name.charAt(0) >= 'A' && name.charAt(0) <= 'Z';
    boolean validName = startsWithUppercaseEnglishLetter && name.length() < 10;
    boolean validEmail = email.matches("^[A-Za-z0-9._%+-]+@gmail\\.com$");

    if (validName && validEmail) {
        request.setAttribute("verifiedName", name);
        request.setAttribute("verifiedEmail", email);
        request.setAttribute("submittedSummary", summary);
        request.getRequestDispatcher("display.jsp").forward(request, response);
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Check Your Details</title>
    <style>
        body {
            max-width: 680px;
            margin: 48px auto;
            padding: 0 20px;
            color: #1f2937;
            background: #f3f6fb;
            font-family: Arial, sans-serif;
        }

        main {
            padding: 32px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgb(31 41 55 / 8%);
        }

        h1 {
            color: #a12b24;
        }

        a {
            color: #174ea6;
        }
    </style>
</head>
<body>
<main>
    <h1>Please correct the following</h1>
    <ul>
        <% if (!validName) { %>
        <li>Name must start with an uppercase English letter (A–Z) and be
            fewer than 10 characters long.</li>
        <% } %>
        <% if (!validEmail) { %>
        <li>Email must be a valid address ending in @gmail.com.</li>
        <% } %>
    </ul>
    <p><a href="test.html">Return to the summary form</a></p>
</main>
</body>
</html>
