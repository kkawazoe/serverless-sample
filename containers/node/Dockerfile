FROM node:20-slim

# Create work dir
ENV API_ROOT /app
RUN mkdir $API_ROOT
WORKDIR $API_ROOT

# Run yarn add @redocly/cli
# Static versions issue https://github.com/Redocly/redoc/issues/2553
RUN yarn global add @redocly/cli@1.14.0

# Set `DEVCONTAINER` environment variable to help with orientation
ENV DEVCONTAINER=true
