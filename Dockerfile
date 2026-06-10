
FROM node:20-alpine AS builder


WORKDIR /app


ENV NODE_ENV=production

COPY package*.json ./

RUN npm ci --omit=dev


COPY --from=builder /app/dist ./dist

CMD ["node", "dist/main.js"]