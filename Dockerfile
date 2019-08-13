# start of Build phase
FROM node:alpine as builder
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# start of Run phase (default nginx command starts up the server)
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

