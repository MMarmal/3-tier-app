ARG NODE_VERSION=22-alpine
ARG NGINX_VERSION=1.29-alpine

# ---- Stage 1: Build the React app ----
FROM node:${NODE_VERSION} AS build

WORKDIR /app

RUN --mount=type=bind,source=package.json,target=package.json,rw \
    --mount=type=bind,source=package-lock.json,target=package-lock.json,rw \
    --mount=type=cache,target=/root/.npm \
    npm ci

COPY . .

RUN npm run build


# ---- Stage 2: Serve using Nginx ----
FROM nginxinc/nginx-unprivileged:${NGINX_VERSION} AS runner

USER nginx

# Copy the static build output from the build stage to Nginx's default HTML serving directory
COPY --chown=nginx:nginx  --from=build /app/build /usr/share/nginx/html


EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]


