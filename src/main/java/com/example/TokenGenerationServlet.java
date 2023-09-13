package com.example;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TokenGenerationServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Your token generation logic goes here
        String token = generateToken();

        // Set the content type of the response
        response.setContentType("text/plain");

        // Write the token as the response
        response.getWriter().write(token);
    }

    private String generateToken() {
        // Replace this with your actual token generation logic
        return "SAMPLE_TOKEN";
    }
}
