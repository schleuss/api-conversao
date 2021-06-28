FROM node:lts-alpine

# Create application work directory
WORKDIR /apps

# Add node package config
COPY package*.json ./

# install libs and apply dedup
RUN npm i --production && \
    npm ddp

# Add application files
COPY index.js ./
COPY swagger.yaml ./

# Expose application port
EXPOSE 8080

# Application entrypoint
CMD ["node", "index.js"]
