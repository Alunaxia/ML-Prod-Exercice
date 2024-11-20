# Use the official Node.js image as the base image
FROM node:16

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json files first
# This is done separately from copying the entire code so that Docker caches the npm install layer
COPY package*.json ./

# Install the app dependencies
RUN npm install

# Copy the rest of the application files to the container
COPY . .

# Expose the port the app will run on
EXPOSE 3000

# Define the command to start the app
CMD ["npm", "start"]
