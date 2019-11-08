FROM node:10-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --only=production

FROM node:8-alpine

WORKDIR /app

ENV NODE_ENV production
ENV PORT 8000

COPY package.json .
COPY lib lib
COPY --from=deps /app/node_modules node_modules

EXPOSE $PORT

CMD ["npm", "start"]
