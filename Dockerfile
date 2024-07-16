FROM node:alpine 
WORKDIR /src/index
#RUN addgroup dev 
#RUN adduser -S -G dev myuser
#USER myuser
COPY package.json .
COPY . .
RUN npm i
RUN npm install @prisma/client
#RUN npx prisma db push
RUN npx prisma migrate dev --name oficina_mecanica --preview-feature
CMD npm run dev
EXPOSE 3001