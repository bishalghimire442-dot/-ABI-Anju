
FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache unzip

# Gallery सुधारिएको ZIP राख्ने
COPY ABI_Anju_v2_40_0_Gallery_Persistence_Fix.zip /tmp/abi-bundle.zip

# ZIP खोल्ने र ABI प्रोजेक्ट स्थापना गर्ने
RUN unzip -q /tmp/abi-bundle.zip -d /tmp/abi-bundle \
    && if [ -f /tmp/abi-bundle/ABI_v2_40_0/package.json ]; then \
         cp -a /tmp/abi-bundle/ABI_v2_40_0/. /app/; \
       else \
         cp -a /tmp/abi-bundle/. /app/; \
       fi \
    && rm -rf /tmp/abi-bundle /tmp/abi-bundle.zip

# आवश्यक Dependencies स्थापना गर्ने
RUN npm install --omit=dev

ENV NODE_ENV=production

EXPOSE 10000

CMD ["npm", "start"]
