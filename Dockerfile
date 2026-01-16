# Set the base image to create the image for react app
FROM node:20-alpine

#Create a user with permission to run the app 
# -S -> Create a system user
# -G -> add the user to a group
# This is done to avoid running the app as port
# if the app is run as root, any vulnerability in the app can be exploited to gain access to the host system
# It's a good practice to run the ap as a non-root user

RUN addgroup app && adduser -S -G app app

# Set the working directory to /app
USER app

# Copy the current directory contents into the container at /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Switch to the root user
USER root

# Install any needed packages specified in package.json
RUN chown -R app:app /app

# Switch to the app user
USER app

# Install dependencies
RUN npm install


# Copy the current directory contents into the container at /app
COPY . .

# Expose port 5173
EXPOSE 5173

# Run the app
CMD npm run dev