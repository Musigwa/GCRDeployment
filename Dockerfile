###############
# STAGE 1: BUNDLE THE APPLICATION BUILD
###############

FROM node:18-alpine AS build

# Create a non-root user and switch to it
# RUN adduser --disabled-password --gecos '' devops
USER root

# Create app directory
WORKDIR /app

# Copy package.json and yarn.lock to the working directory
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile && yarn cache clean

# Copy the rest of the application source
COPY . .

# Change ownership of the /app directory to the devops user
# RUN chown -R devops:devops /app

# Run the build process
RUN yarn build

###############
# STAGE 2: PREPARE A DEVELOPMENT BUILD
###############

FROM build AS production

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

# Switch to the devops user
USER root

# Create app directory (optional since build has already set it, but a good practice)
WORKDIR /app

# Copy the entire project from the build stage to the development image
COPY --from=build /app/dist /app/package.json /app/yarn.lock ./

# Install production dependencies
RUN yarn install --production --frozen-lockfile && yarn cache clean

# Run the command to start the Application server
CMD [ "yarn", "start:prod" ]
