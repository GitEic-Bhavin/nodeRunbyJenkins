# Use an official Node.js runtime as a parent image
FROM node:14-alpine AS build

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install
COPY tsconfig.json .

# Copy the rest of the application files to the working directory
COPY src ./src  
# COPY node_modules ./
COPY . .

# Build the application
RUN npm run build
# CMD ["npm", "start"]
# Use an official Nginx runtime as a parent image
FROM nginx:1.19.9-alpine

# Copy the built application from the previous stage to the Nginx image
# RUN apk update
RUN apk add nodejs-current --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    apk add npm=14.20.1-r0 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main
COPY --from=build /app/dist /usr/share/nginx/html

# Copy the Nginx configuration file to the Nginx image
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80
COPY --from=build /app /app
# RUN apt-get update && apt-get install -y nodejs npm
# Start Nginx
# ENTRYPOINT ["nginx", "-g", "daemon off;"]
# ENTRYPOINT ["sh", "-c", "node /usr/share/nginx/html/index.js & nginx -g 'daemon off;'"]
ENTRYPOINT ["sh", "-c", "node /app & nginx -g 'daemon off;'"]






# FROM node:14-alpine AS build
# WORKDIR /app

# COPY package*.json ./
# RUN npm install
# COPY . .
# # RUN npm start
# CMD [ "node", "index.js" ]

# FROM nginx

# RUN apt-get update && apt-get upgrade -y

# COPY nginx.conf /etc/nginx/nginx.conf
# RUN service nginx restart

# # EXPOSE 80
# ENTRYPOINT ["nginx", "-g", "daemon off;"]