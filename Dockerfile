
FROM node:20-alpine

RUN apk add --no-cache unzip

WORKDIR /app

COPY ABI_v2_39_0_Anju_Conversation_Icons.zip /tmp/abi.zip

RUN unzip -q /tmp/abi.zip -d /app \
    && APP_DIR="$(dirname "$(find /app -name package.json -not -path '*/node_modules/*' -print -quit)")" \
    && test -f "$APP_DIR/package.json" \
    && printf '%s' "$APP_DIR" > /app/.abi-app-dir

RUN APP_DIR="$(cat /app/.abi-app-dir)" \
    && cd "$APP_DIR" \
    && npm install --omit=dev

ENV NODE_ENV=production

EXPOSE 10000

CMD ["sh", "-c", "APP_DIR=$(cat /app/.abi-app-dir) && cd \"$APP_DIR\" && npm start"]
