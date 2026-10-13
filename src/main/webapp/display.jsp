<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
    private String escapeHtml(String value) {
        StringBuilder escaped = new StringBuilder();
        for (int i = 0; i < value.length(); i++) {
            char character = value.charAt(i);
            switch (character) {
                case '&':
                    escaped.append("&amp;");
                    break;
                case '<':
                    escaped.append("&lt;");
                    break;
                case '>':
                    escaped.append("&gt;");
                    break;
                case '"':
                    escaped.append("&quot;");
                    break;
                case '\'':
                    escaped.append("&#x27;");
                    break;
                default:
                    escaped.append(character);
            }
        }
        return escaped.toString();
    }
%>
<%
    String name = (String) request.getAttribute("verifiedName");
    String email = (String) request.getAttribute("verifiedEmail");
    String summary = (String) request.getAttribute("submittedSummary");

    if (name == null || email == null || summary == null) {
        response.sendRedirect("test.html");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Summary Verified</title>
    <style>
        body {
            max-width: 760px;
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

        h1, h2 {
            color: #174ea6;
        }

        .summary {
            padding: 16px;
            background: #f3f6fb;
            border-radius: 6px;
            white-space: pre-wrap;
            overflow-wrap: anywhere;
        }

        a {
            color: #174ea6;
        }
    </style>
</head>
<body>
<main>
    <h1>Summary verified</h1>
    <p><strong>Name:</strong> <%= escapeHtml(name) %></p>
    <p><strong>Email ID:</strong> <%= escapeHtml(email) %></p>
    <h2>Your summary</h2>
    <div class="summary"><%= escapeHtml(summary) %></div>
    <p><a href="about.html">Back to the concept page</a></p>
</main>
</body>
</html>
