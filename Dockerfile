# Use the official Nginx image from Docker Hub
FROM nginx:alpine

# Copy the HTML and CSS files to the Nginx webroot directory
COPY index.html /usr/share/nginx/html/
COPY footer.css /usr/share/nginx/html/

# Expose port 80 to allow traffic to Nginx
EXPOSE 80

# Command to run Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
