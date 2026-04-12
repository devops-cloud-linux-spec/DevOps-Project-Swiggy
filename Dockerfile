# Using Node.js 16 as the base image
FROM node:16

# Setting up the working directory
WORKDIR /app

# Copying the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Installation of npm dependency
RUN npm install

# Copy the application code
COPY . .

# Building the React app
RUN npm run build

# EXPOSE is just documentation; the app must actually listen on 3010
EXPOSE 3010 80 3000

# Ensure the application listens on port 3010
# If this is a standard React app, you might need to set the PORT env variable
ENV PORT=3010

CMD ["npm", "start"]
