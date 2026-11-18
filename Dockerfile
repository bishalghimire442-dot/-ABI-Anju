
FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache unzip

COPY ABI_Anju_v2_40_0_Chat_UI_Pyari_Nepali_Fields.zip /tmp/abi-bundle.zip

RUN unzip -q /tmp/abi-bundle.zip -d /tmp/abi-bundle \
    && if [ -f /tmp/abi-bundle/ABI_v2_40_0/package.json ]; then \
         cp -a /tmp/abi-bundle/ABI_v2_40_0/. /app/; \
       else \
         cp -a /tmp/abi-bundle/. /app/; \
       fi \
    && rm -rf /tmp/abi-bundle /tmp/abi-bundle.zip

RUN npm install --omit=dev

ENV NODE_ENV=production

EXPOSE 10000

CMD ["npm", "start"]
