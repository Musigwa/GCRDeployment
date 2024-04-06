# Use the official Node.js runtime as a parent image
FROM node:18-alpine AS build

# Set the working directory in the container to /app
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package.json yarn.lock ./

# Copy the rest of the application files to the container
COPY . .

# Install dependencies
RUN yarn cache clean && yarn install --frozen-lockfile

# Run the build process
RUN yarn build

# Create a new stage called "production"
FROM build AS production

# Copy the necessary files and folders from the previous build
COPY --from=build /app/dist /app/dist

# Set the environment variable for the PORT
ENV API_SERVER_PORT 2345

# Use the CMD instruction to specify a command to run when the container is started
CMD ["npm", "start"]
