
FROM node:20-alpine

RUN apk add --no-cache unzip

WORKDIR /app

COPY ABI_v2_35_0_Site_Data_Recovery.zip /tmp/abi.zip

RUN unzip -q /tmp/abi.zip -d /app \
    && test -f /app/ABI_v2_35_0_Project/package.json

WORKDIR /app/ABI_v2_35_0_Project

RUN npm install --omit=dev

ENV NODE_ENV=production

EXPOSE 10000

CMD ["npm", "start"]
