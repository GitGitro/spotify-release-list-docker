FROM node:20-alpine AS builder

WORKDIR /app

RUN apk add --no-cache git && \
    git clone --depth 1 --branch master \
      https://github.com/jakubito/spotify-release-list.git .

RUN yarn install --frozen-lockfile

ARG REACT_APP_URL
ARG REACT_APP_SPOTIFY_CLIENT_ID
ARG REACT_APP_SENTRY_DSN

ENV REACT_APP_URL=$REACT_APP_URL \
    REACT_APP_SPOTIFY_CLIENT_ID=$REACT_APP_SPOTIFY_CLIENT_ID \
    REACT_APP_SENTRY_DSN=$REACT_APP_SENTRY_DSN

RUN yarn build

FROM nginx:alpine AS runner

RUN rm -rf /usr/share/nginx/html/*

COPY --from=builder /app/build /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
