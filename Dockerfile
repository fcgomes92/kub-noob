FROM node
EXPOSE 3000
WORKDIR /app
COPY . .
RUN npm install
ENTRYPOINT ["npm"]
CMD [ "run", "start" ]