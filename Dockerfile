# start of Build phase
FROM node:alpine as builder
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# start of Run phase (default nginx command starts up the server)
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

