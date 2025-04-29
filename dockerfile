
FROM nginx:alpine

# Copy website files to the default nginx public folder
COPY . /usr/share/nginx/html

# Expose port 80 to access the website
EXPOSE 80

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
