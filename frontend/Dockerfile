FROM node:20

WORKDIR /app

COPY package*.json ./

RUN --mount=type=cache,target=/root/.npm npm install

COPY . .

CMD ["npm","start"]