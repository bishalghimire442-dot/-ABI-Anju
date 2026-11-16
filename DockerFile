
FROM node:20-alpine

RUN apk add --no-cache unzip

WORKDIR /app

COPY ABI_v2_14(1).zip /tmp/ABI_v2_14.zip

RUN unzip -q /tmp/ABI_v2_14.zip -d /app \
    && APP_DIR="$(dirname "$(find /app -name package.json -print -quit)")" \
    && test -n "$APP_DIR" \
    && cd "$APP_DIR" \
    && npm install --omit=dev

ENV NODE_ENV=production

CMD ["sh", "-c", "APP_DIR=$(dirname \"$(find /app -name package.json -print -quit)\") && cd \"$APP_DIR\" && npm start"]
