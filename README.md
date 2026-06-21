# Docker images for Spotify Release List

ghcr.io images for Spotify Release List
Changes from the main [repo](https://github.com/jakubito/spotify-release-list) are pulled automatically

<b> You need to fork this repository and set the values as repository secrets/variables in your GitHub repo settings so the workflow can pass them as build args. </b>

You need to add these in your GitHub repository settings. Go to:
`https://github.com/<your-repo>/settings/secrets/actions`
And add:

| Type | Name | Value |
| ------------- | ------------- | ------------- |
| Secret | REACT_APP_SPOTIFY_CLIENT_ID | your Spotify client ID
| Variable | REACT_APP_URL | your public URL, e.g. https://your-domain.com
| Secret | REACT_APP_SENTRY_DSN | your Sentry DSN (or leave empty)

After adding them, manually trigger the workflow (it has workflow_dispatch) or wait for the next cron run.

A simple [docker-compose](./docker-compose.yml) file is provided.
To get you started:
```
services:
    spotify-release-list:
        image: ghcr.io/<your-username>/spotify-release-list-docker:latest
        container_name: spotify-release-list
        ports:
            - 80:80
```

All credits to [jakubito](https://github.com/jakubito) for the project