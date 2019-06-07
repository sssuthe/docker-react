#The build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#and now for the run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
