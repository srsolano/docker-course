FROM node:alpine as builder
WORKDIR /app
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build
# All the stuff we care is now in /app/build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# We don't need to run anything as the nginx container
# already starts the server automatically
