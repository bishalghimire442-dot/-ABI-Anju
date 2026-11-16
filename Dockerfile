
FROM node:20-alpine

RUN apk add --no-cache unzip

WORKDIR /app

COPY ABI_v2_16_1_AnjuSmriti_Gemini_NepaliVoice.zip /tmp/abi.zip

RUN unzip -q /tmp/abi.zip -d /app \
    && APP_DIR="$(dirname "$(find /app -name package.json -print -quit)")" \
    && test -f "$APP_DIR/package.json" \
    && cd "$APP_DIR" \
    && npm install --omit=dev

ENV NODE_ENV=production

CMD ["sh", "-c", "APP_DIR=$(dirname \"$(find /app -name package.json -print -quit)\") && cd \"$APP_DIR\" && node server.js"]
