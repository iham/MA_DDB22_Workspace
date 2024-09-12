# MA_DDB22_WORKSPACE
This is the main sandbox for my Master Thesis Proof of Concept.

## Dockerfiles
Inside ./Dockerfiles is a bunch of Dockerfiles to be forked/updated/re-built for my Master Thesis
After testing the bit Docker Images and checking for versions using:
- ```cat /etc/debian_version```
- ```node --version```
- ```npm --version```
- ```bvm --version```
- ```bit --version```


There are some minor to major issues:
- Unconventional naming schemas (:latest-node-*, instead of :latest)
- Debian is outdated.
- Node is installed manually instead of using an official Node Image.
- The bvm and bit binaries are installed as root.
  which is considered bad practise on Node based Docker projects.
  This consideration is also mentioned by the bit binary itself, when launched as root.

To fix those issues, custom reimplemented Docker Images are created
- Based on Nodes official Image (node:lts-iron).
- This Node Image uses the latest Debian release.
- npm is updated to the latest version.
- bvm is installed globally with root user privileges.
- bit is installed with node user privileges.
- bit is installed in its latest stable release.
- The released Docker Images are in my Docker Hub Repository for further usage.
- Naming conventions are followed (:latest)

### Bit Base Image (bitcli/bit vs iham/bit-base)
| Name                          | Version (bitcli/bit:latest-node-20.11.1)   | Version (iham/bit-base:latest)   |
|----------------------------   |-----------------------------------------   |-------------------------------   |
| Operating System              | Debian 12.5 (Bookworm)                     | Debian 12.7 (Bookworm)           |
| NodeJS (node)                 | 20.11.1 (Iron - Active LTS)                | 20.17.0 (Iron - Active LTS)      |
| Node Package Manager (npm)    | 10.2.4                                     | 10.8.3                           |
| Bit Version Manager (bvm)     | 1.0.7                                      | 1.0.7                            |
| Bit (bit)                     | 1.8.55 (nightly)                           | 1.8.52 (stable)                  |


### Bit Server Image (bitcli/bit-server vs iham/bit-server)
| Name                          | Version (bitcli/bit-server:latest-node-20.11.1)   | Version (iham/bit-base:latest)   |
|----------------------------   |------------------------------------------------   |-------------------------------   |
| Operating System              | Debian 12.5 (Bookworm)                            | Debian 12.7 (Bookworm)           |
| NodeJS (node)                 | 20.11.1 (Iron - Active LTS)                       | 20.17.0 (Iron - Active LTS)      |
| Node Package Manager (npm)    | 10.2.4                                            | 10.8.3                           |
| Bit Version Manager (bvm)     | 1.0.7                                             | 1.0.7                            |
| Bit (bit)                     | 1.8.55 (nightly)                                  | 1.8.52 (stable)                  |


### Bit VS CODE Workspace Image (bitcli/vscode-workspace vs iham/bit-vscode-workspace)
| Name                              | Version (bitcli/vscode-workspace:latest)   | Version (iham/bit-base:latest)   |
|--------------------------------   |-----------------------------------------   |-------------------------------   |
| Operating System                  | Debian 12.5 (Bookworm)                     | Debian 12.7 (Bookworm)           |
| NodeJS (node)                     | 18.19.0 (Hydrogen - Maintaince)            | 20.17.0 (Iron - Active LTS)      |
| Node Package Manager (npm)        | 9.2.0                                      | 10.8.3                           |
| Bit Version Manager (bvm)         | 1.0.4                                      | 1.0.7                            |
| Bit (bit)                         | 1.6.173 (nightly)                          | 1.8.52 (stable)                  |
| Virtual Studio (VS) Code          | 4.89.1                                     | 4.92.2                           |
| Virtual Studio (VS) Code Server   | 1.89.1                                     | 1.92.2                           |

