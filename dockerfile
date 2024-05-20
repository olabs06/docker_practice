# Use an official Node.js runtime as a parent image
FROM node

# Set the working directory in the container
WORKDIR /usr/src/Document/Univelcity/JavaScript/Docker Practice 2/server.js

# Copy the wait-for-it.sh script into the container
COPY wait-for-it.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wait-for-it.sh

# Copy the rest of your application files into the container
COPY package*.json ./
COPY . .

# Install any needed packages specified in package.json
RUN npm install

# Make port 3000 available to the world outside this container
EXPOSE 8081

# Run the application when the container launches
CMD /usr/local/bin/wait-for-it.sh mongo:27017 -- npm start
