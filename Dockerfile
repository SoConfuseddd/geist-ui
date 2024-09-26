FROM node:18.6.0-alpine


# Set memory limit for Node.js
ENV NODE_OPTIONS="--max-old-space-size=4096"

# Step 2: Set the working directory inside the container
WORKDIR /app
# Step 5: Copy the rest of the application code
COPY . .

# Step 6: Expose the application's port (e.g., 8001)
EXPOSE 3000

# Step 7: Define the command to run your application
CMD ["yarn", "dev"]
