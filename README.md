# Docker images for Spotify Release List

ghcr.io images for Spotify Release List
Changes from the main [repo](https://github.com/jakubito/spotify-release-list) are pulled automatically

A simple [docker-compose](./docker-compose.yaml) file is provided.
To get you started:
```
services:
    spotify-release-list:
        image: ghcr.io/gitgitro/spotify-release-list-docker:latest
        container_name: spotify-release-list
        ports:
            - 80:80
        environment:
            - REACT_APP_URL= #Public URL where you'll host it, e.g. https://your-domain.com
            - REACT_APP_SPOTIFY_CLIENT_ID= #Your Spotify app client ID
```

All credits to [jakubito](https://github.com/jakubito) for the project