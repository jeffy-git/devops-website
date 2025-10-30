# Use nginx as the base image
FROM nginx:alpine

# Copy your HTML file into the nginx server directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Default command (nginx starts automatically)
CMD ["nginx", "-g", "daemon off;"]
