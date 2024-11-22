# Use the official nginx image from Docker Hub
FROM nginx:alpine

# Set the working directory
WORKDIR /usr/share/nginx/html

# Remove the default nginx index.html file
RUN rm -rf ./*

# Copy your HTML page (and any other assets) into the container
COPY . .

# Expose port 80 to allow traffic to your web server
EXPOSE 80

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
