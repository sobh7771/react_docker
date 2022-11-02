FROM node:19-alpine3.15 AS builder
WORKDIR /app
COPY ./package.json ./
COPY ./yarn.lock ./
RUN ["yarn"]
COPY . .
RUN ["yarn","build"]

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html