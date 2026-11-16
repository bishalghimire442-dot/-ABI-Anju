
FROM node:20-alpine

RUN apk add --no-cache unzip

WORKDIR /app

COPY ABI_v2_16_1_AnjuSmriti_Gemini_NepaliVoice.zip /tmp/abi.zip

RUN unzip -q /tmp/abi.zip -d /app \
    && test -f /app/ABI_v2_16/package.json \
    && cd /app/ABI_v2_16 \
    && npm install --omit=dev

ENV NODE_ENV=production

CMD ["sh", "-c", "cd /app/ABI_v2_16 && node ./server.js"]
