FROM node:alpine 
WORKDIR /src/index
#RUN addgroup dev 
#RUN adduser -S -G dev myuser
#USER myuser
COPY package.json .
COPY . .
RUN npm i
CMD npm run dev
EXPOSE 3001