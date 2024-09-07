# Stage 1: Build the application
# mention is the bild stage 
FROM node:20-alpine as builder

WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Create the final image
FROM nginx

# Copy the built application from the builder stage to the Nginx image
COPY --from=builder /app/build /usr/share/nginx/html
