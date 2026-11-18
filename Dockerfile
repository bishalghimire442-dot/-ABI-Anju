
# ABI Anju v2.40.0
# Build directly from uploaded GitHub ZIP

FROM node:20-alpine

WORKDIR /app

# Install ZIP extraction utility
RUN apk add --no-cache unzip

# Copy uploaded ZIP bundle
COPY ABI_Anju_v2_40_0_GitHub_Staging_Bundle.zip /tmp/abi-bundle.zip

# Extract ABI project into application directory
RUN unzip -q /tmp/abi-bundle.zip -d /tmp/abi-bundle \
    && cp -a /tmp/abi-bundle/ABI_v2_40_0/. /app/ \
    && rm -rf /tmp/abi-bundle /tmp/abi-bundle.zip

# Install production dependencies
RUN npm install --omit=dev

ENV NODE_ENV=production

EXPOSE 10000

CMD ["npm", "start"]
