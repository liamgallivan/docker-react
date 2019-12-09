# Build step
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# build dir in /app/build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# nginx starts on own on default

