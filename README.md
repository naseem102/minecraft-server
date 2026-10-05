# Professional Hybrid Minecraft Server

**Arclight / Mohist based Hybrid Server**  
Supports **Forge/NeoForge Mods + Paper/Spigot Plugins** together.  
Optimized for **Windows + Java 21 + ~6.5-6.8 GB host RAM** (4 GB allocated to JVM).

---

## Quick Start (Windows)

### 1. Download the Hybrid Core (server.jar)

Choose **one**:

| Software | Best For | Download |
|----------|----------|----------|
| **Arclight** (Recommended) | Better plugin compatibility, newer versions (1.20.4 / 1.21.x) | https://arclight.izzel.io |
| **Mohist** | Classic Forge hybrid, wide version support | https://mohistmc.com |

- Download the jar for **Minecraft 1.20.4** or **1.21 / 1.21.1**
- Rename the downloaded file to **`server.jar`**
- Place it in the root of this repository

### 2. Install Java 21 LTS
Download from: https://adoptium.net (or Oracle JDK 21)  
Make sure `java -version` shows 21.

### 3. (Optional) Install ngrok for Public Access
1. Go to https://ngrok.com → Sign up → Download Windows version
2. Extract `ngrok.exe` into this folder **or** add it to your system PATH
3. Authenticate once: `ngrok config add-authtoken YOUR_TOKEN`

### 4. Start the Server

**Local only:**
```bat
start-server.bat
```

**Public (with ngrok tunnel):**
```bat
start-public.bat
```
This opens ngrok in a separate window + starts the Minecraft server.

Players connect using the TCP address shown by ngrok (example: `0.tcp.ngrok.io:12345`).

---

## Directory Structure

```text
.
├── server.jar                 # You download & rename (Arclight/Mohist)
├── eula.txt                   # Already set to true
├── server.properties          # Fully optimized config
├── ops.json                   # Empty - add your OP players
├── whitelist.json             # Empty
├── banned-players.json        # Empty
├── banned-ips.json            # Empty
├── start-server.bat           # Optimized local starter (Aikar flags)
├── start-public.bat           # Local + ngrok public tunnel
├── plugins/                   # Drop Paper/Spigot plugins here
├── mods/                      # Drop Forge/NeoForge mods here
├── .gitignore                 # Ignores worlds, logs, libraries etc.
└── README.md                  # This file
```

---

## Key Optimizations Applied

### Memory & JVM (Aikar's Flags)
- Heap: **exactly 4096M** (`-Xms4096M -Xmx4096M`)
- Leaves ~2.5 GB free for Windows + ngrok + Java overhead
- Full modern Aikar G1GC flags for minimal lag spikes

### server.properties Highlights
| Setting | Value | Reason |
|---------|-------|--------|
| `online-mode` | `false` | Allows cracked + premium players |
| `view-distance` | `6` | Low RAM friendly |
| `simulation-distance` | `4` | Reduces entity/tick load |
| `max-players` | `20` | Safe for 4 GB |
| `allow-flight` | `true` | Required by many mods & plugins |
| `difficulty` | `hard` | Professional feel |
| `enable-rcon` | `false` | Security |
| `motd` | Colored professional text | Looks premium |

---

## Recommended Essential Plugins (put in `/plugins`)

1. **LuckPerms** – Best permissions system  
2. **Vault** – Economy & permissions bridge  
3. **EssentialsX** (+ Chat, Spawn, Protect if needed)  
4. **Spark** – Performance profiler (highly recommended)  
5. **WorldEdit** + **WorldGuard**  
6. **zNPCsPlus** or Citizens (for NPCs)

Download from SpigotMC / Hangar / Modrinth (Paper compatible versions).

## Recommended Performance Mods (put in `/mods`)

- **FerriteCore**  
- **ModernFix**  
- **EntityCulling**  
- **Starlight** or **Phosphor**  
- **Krypton** (if available for your loader)

**Important:** Always download the exact version matching your Arclight/Mohist Minecraft + Forge/NeoForge version.

---

## Adding Yourself as OP

1. Start the server once
2. Join the server
3. In console type: `op YourUsername`
4. Or edit `ops.json` manually (after first run it becomes properly formatted)

Example after first op:
```json
[
  {
    "uuid": "your-uuid-here",
    "name": "YourName",
    "level": 4,
    "bypassesPlayerLimit": false
  }
]
```

---

## Security Notes

- `online-mode=false` means anyone can join with any name → use **whitelist** or strong LuckPerms groups
- Keep `enable-rcon=false` unless you really need remote console
- Regularly update Arclight/Mohist, plugins and mods
- Never share your ngrok authtoken

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| "Out of memory" | Close other programs, make sure only 4 GB is allocated |
| Plugins not loading | Confirm you are using Arclight/Mohist (not pure Forge) |
| Mods crashing | Version mismatch – check exact Forge/NeoForge version of your hybrid jar |
| ngrok not found | Place `ngrok.exe` in the same folder or add to PATH |
| Port already in use | Change `server-port` in server.properties or kill the other process |

---

## Credits & Sources

- Aikar's Flags: https://docs.papermc.io/paper/aikars-flags/
- Arclight: https://arclight.izzel.io / https://github.com/IzzelAliz/Arclight
- Mohist: https://mohistmc.com

**Happy Hybrid Hosting!**  
Built for production-ready performance on limited RAM.
