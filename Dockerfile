# first phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <-- all the files and folder for production 
# 2-Phase

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
