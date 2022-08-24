{{#isNodeEnvironment}}
FROM node:14.20.0-alpine

COPY * ./
{{#useFirebase}}
COPY firebase/* ./firebase/
{{/useFirebase}}

RUN npm install

CMD [ "npm", "start" ]
{{/isNodeEnvironment}}