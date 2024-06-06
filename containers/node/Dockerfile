FROM node:20-slim

# Create work dir
ENV API_ROOT /app
RUN mkdir $API_ROOT
WORKDIR $API_ROOT

# Run yarn add @redocly/cli
RUN yarn global add @redocly/cli

# Set `DEVCONTAINER` environment variable to help with orientation
ENV DEVCONTAINER=true
