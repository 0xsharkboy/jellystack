# Jellystack

**Jellystack** is a fully containerized and automated media server stack using Docker Compose. It brings together powerful tools like Jellyfin, qBittorrent, Sonarr, Radarr, Lidarr, Whisparr, Prowlarr, and Bazarr — with built-in support for I2P via i2pd for anonymous torrenting.

## Features

- **Jellyfin** – Media server for streaming movies and TV shows
- **qBittorrent** – Torrent client with Web UI on port `8888`
- **Sonarr** – Automatic TV show downloads and organization
- **Radarr** – Movie management and automation
- **Prowlarr** – Indexer manager for Sonarr and Radarr
- **Bazarr** – Subtitle downloader for your media library
- **Whisparr** – "Movie" downloader for your media library
- **Lidarr** – Music downloader for your media library
- **i2pd** – I2P daemon used as a proxy for qBittorrent

## Folder Structure

```
jellystack/
│
├── .env                # Environment file with PUID, PGID and TZ
├── docker-compose.yml  # Main Docker Compose file
├── start.sh            # Startup script (chown + docker-compose up)
├── jellyfin/
├── qbittorrent/
├── sonarr/
├── lidarr/
├── whisparr/
├── radarr/
├── prowlarr/
├── bazarr/
├── i2pd/
└── media/
    ├── downloads/      # Where qBittorrent downloads go
    ├── movies/         # Where Radarr stores movies
    ├── paff/           # Where Whisparr stores movies
    ├── music/          # Where Lidarr stores musics
    └── tv/             # Where Sonarr stores TV shows
```

## Usage

1. **Clone the repository**:
   ```bash
   git clone https://github.com/0xsharkboy/jellystack.git
   cd jellystack
   ```

2. **Edit the `.env` file to define your user and group ID and your timezone**:

   ```env
   PUID=1000
   PGID=1000
   TZ=Europe/Paris
   MEDIA_FOLDER=./media
   ```

3. **Make `start.sh` executable**:

   ```bash
   chmod +x start.sh
   ```

4. **Start the stack**:

   ```bash
   ./start.sh
   ```

## Ports

| Service     | Port                      |
| ----------- | ------------------------- |
| Jellyfin    | 8096                      |
| qBittorrent | 8888                      |
| Sonarr      | 8989                      |
| Radarr      | 7878                      |
| Lidarr      | 8686                      |
| Whisparr    | 6969                      |
| Prowlarr    | 9696                      |
| Bazarr      | 6767                      |
| i2pd        | 7656                      |


## Coming Soon

A full **Wiki** on how to:

* Configure each application
* Set up automation with \*arr apps
* Use i2pd with qBittorrent for I2P

## Credits

This stack builds on the work of many amazing open-source projects:

* [Jellyfin](https://jellyfin.org/)
* [qBittorrent](https://www.qbittorrent.org/)
* [Sonarr](https://sonarr.tv/)
* [Radarr](https://radarr.video/)
* [Whisparr](https://whisparr.com/)
* [Lidarr](https://lidarr.audio/)
* [Prowlarr](https://prowlarr.com/)
* [Bazarr](https://www.bazarr.media/)
* [i2pd](https://github.com/PurpleI2P/i2pd)
* [linuxserver.io](https://www.linuxserver.io/) for providing most of the container images used in this project

Special thanks to the contributors and communities behind these projects.

---

Built with love and torrents.
