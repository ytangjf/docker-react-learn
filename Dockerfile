FROM node:13.12.0-alpine3.10 as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

FROM nginx 
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html