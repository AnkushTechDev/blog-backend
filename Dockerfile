# Builder stage
FROM node:lts-alpine as builder
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if using npm ci)
COPY package*.json ./
RUN npm ci

# Copy the rest of the application code
COPY . .

# Make sure to include necessary config files for building, if not already copied
# COPY tsconfig.json ./
# COPY .env ./

# Build the project (e.g., for NestJS or Angular)
RUN npm run build

# Runner stage
FROM node:lts-alpine as runner
WORKDIR /usr/src/app

# Copy node_modules and dist folder from the builder stage
COPY --from=builder /usr/src/app/node_modules ./node_modules
COPY --from=builder /usr/src/app/dist ./dist

# Install production dependencies (optional but recommended)
RUN npm install --production

# Clean up unnecessary files (optional)
# RUN rm -rf /usr/src/app/src /usr/src/app/tests /usr/src/app/.git

# Set the entry point for the app (for NestJS)
CMD [ "node", "dist/main" ]
