# Jellystack

**Jellystack** is a fully containerized and automated media server stack using Docker Compose. It brings together powerful tools like Jellyfin, qBittorrent, Sonarr, Radarr, Prowlarr, and Bazarr.

## Features

- **Jellyfin** – Media server for streaming movies and TV shows
- **qBittorrent** – Torrent client with Web UI
- **Sonarr** – Automatic TV show downloads and organization
- **Radarr** – Movie management and automation
- **Prowlarr** – Indexer manager for Sonarr and Radarr
- **Bazarr** – Subtitle downloader for your media library
- **Network Isolation** – Restricted communication between services via dedicated Docker networks

## Folder Structure

```
jellystack/
│
├── .env                # Environment file with PUID, PGID and TZ
├── docker-compose.yml  # Main media stack configuration
└── media/              # Media storage (local bind)
    ├── downloads/      # Where qBittorrent downloads go
    ├── movies/         # Where Radarr stores movies
    └── tv/             # Where Sonarr stores TV shows
```

## Usage

1. **Clone the repository**:
   ```bash
   git clone https://github.com/0xsharkboy/jellystack.git
   cd jellystack
   ```

2. **Edit the `.env` file**: Define your user and group ID, timezone, and media storage path.

   ```env
   PUID=1000
   PGID=1000
   TZ=Europe/Paris
   MEDIA_FOLDER=./media
   ```

3. **Start the stack**:
   ```bash
   docker-compose up -d
   ```

   ## Hardlinks Configuration

   To enable hardlinking (zero-copy moves) and save disk space, all media services now share a single `/data` mount point. You **must** update the internal paths in each application's Web UI:

   | Application | Setting | New Path |
   |-------------|---------|----------|
   | **qBittorrent** | Default Save Path | `/data/downloads` |
   | **Sonarr** | Root Folder | `/data/tv` |
   | **Radarr** | Root Folder | `/data/movies` |
   | **Jellyfin** | Library Paths | `/data/movies` and `/data/tv` |
   | **Bazarr** | Root Folder | `/data/movies` and `/data/tv` |

   > [!IMPORTANT]  
   > If you have existing data, you may need to move your files within the `/data` subfolders (`downloads`, `movies`, `tv`) to match these paths and trigger the hardlinking behavior.

   ## Ports
| Service     | Port                      |
| ----------- | ------------------------- |
| Jellyfin    | 8096                      |
| qBittorrent | 8888                      |
| Sonarr      | 8989                      |
| Radarr      | 7878                      |
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
* [Prowlarr](https://prowlarr.com/)
* [Bazarr](https://www.bazarr.media/)
* [i2pd](https://github.com/PurpleI2P/i2pd)
* [linuxserver.io](https://www.linuxserver.io/) for providing most of the container images used in this project

Special thanks to the contributors and communities behind these projects.

---

Built with love and torrents.
s://www.qbittorrent.org/)
* [Sonarr](https://sonarr.tv/)
* [Radarr](https://radarr.video/)
* [Prowlarr](https://prowlarr.com/)
* [Bazarr](https://www.bazarr.media/)
* [linuxserver.io](https://www.linuxserver.io/) for providing most of the container images used in this project


Special thanks to the contributors and communities behind these projects.

---

Built with love and torrents.
