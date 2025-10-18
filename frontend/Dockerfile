FROM node:22-alpine

WORKDIR /app

RUN --mount=type=bind,source=package.json,target=package.json,rw \
    --mount=type=bind,source=package-lock.json,target=package-lock.json,rw \
    --mount=type=cache,target=/root/.npm \
    npm install

COPY . .

# Give ownership of /app to the 'node' user so it can write cache files, etc.
RUN chown -R node:node /app

USER node

CMD ["npm","start"]