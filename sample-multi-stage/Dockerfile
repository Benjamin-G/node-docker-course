FROM node:10-slim as prod
ENV NODE_ENV=production
COPY  package.json package-lock*.json ./
RUN npm install --production && npm cache clean --force
COPY . . 
CMD ["npm", "./bin/www"]

FROM prod as dev
ENV NODE_ENV=development
RUN npm install --only=development
#COPY --from=0 . . 
CMD ["../node_modules/nodemon/bin/nodemon.js", "./bin/www", "--inspect=0.0.0.0:9229"]

FROM dev as test
ENV NODE_ENV=development
CMD ["npm", "test"]