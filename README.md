# nginx-module-fancyindex RPM Packaging

[![Tag](https://img.shields.io/github/tag/jfut/nginx-module-fancyindex-rpm.svg)](https://github.com/jfut/nginx-module-fancyindex-rpm/releases)
[![License](https://img.shields.io/badge/License-BSD--2--Clause-blue)](https://github.com/jfut/nginx-module-fancyindex-rpm/blob/main/LICENSE)

[ngx-fancyindex](https://github.com/aperezdc/ngx-fancyindex) RPM Packaging for RHEL, AlmaLinux, Rocky Linux, and other compatible distributions.

## Install an RPM package

- [Download](https://github.com/jfut/nginx-module-fancyindex-rpm/releases)
- Install:
    - RHEL/AlmaLinux/Rocky Linux 10
    ```bash
    # Non-modular package version 1.26 for x86_64
    dnf install nginx-module-fancyindex-0.5.2-8.el10.x86_64.rpm

    # Non-modular package version 1.26 for x86_64_v2
    dnf install nginx-module-fancyindex-0.5.2-8.el10.x86_64_v2.rpm

    # Non-modular package version 1.26 for aarch64
    dnf install nginx-module-fancyindex-0.5.2-8.el10.aarch64.rpm
    ```
    - RHEL/AlmaLinux/Rocky Linux 9 x86_64
    ```bash
    # Non-modular package version 1.20
    dnf install nginx-module-fancyindex-0.5.2-8.el9.x86_64.rpm
    
    # AppStream module 1.22 stream
    dnf install nginx-module-fancyindex-0.5.2-8.module_el9.1.22.x86_64.rpm
    
    # AppStream module 1.24 stream
    dnf install nginx-module-fancyindex-0.5.2-8.module_el9.1.24.x86_64.rpm
    
    # AppStream module 1.26 stream
    dnf install nginx-module-fancyindex-0.5.2-8.module_el9.1.26.x86_64.rpm
    ```
    - RHEL/AlmaLinux/Rocky Linux 8 x86_64
    ```bash
    # AppStream module 1.16 stream
    dnf install nginx-module-fancyindex-0.5.2-8.module_el8.1.16.x86_64.rpm
    
    # AppStream module 1.18 stream
    dnf install nginx-module-fancyindex-0.5.2-8.module_el8.1.18.x86_64.rpm
    
    # AppStream module 1.20 stream
    dnf install nginx-module-fancyindex-0.5.2-8.module_el8.1.20.x86_64.rpm
    
    # AppStream module 1.22 stream
    dnf install nginx-module-fancyindex-0.5.2-8.module_el8.1.22.x86_64.rpm
    
    # AppStream module 1.24 stream
    dnf install nginx-module-fancyindex-0.5.2-8.module_el8.1.24.x86_64.rpm
    
    # EPEL module mainline stream (version: 1.23)
    # EPEL 8 Modularity was going away on February 15, 2023
    dnf install nginx-module-fancyindex-0.5.2-8.module_el8.epel.mainline.x86_64.rpm
    ```
- Add your configuration for this module (See [the official documentation](https://github.com/aperezdc/ngx-fancyindex)).
- Restart nginx:
    ```bash
    systemctl restart nginx.service
    ```

If `include /usr/share/nginx/modules/*.conf;` is enabled in `nginx.conf`, this module is enabled by default. If you want to disable the module once installed, simply comment out the contents of `/usr/share/nginx/modules/mod-http-fancyindex.conf`.

## Usage

```bash
Usage:
    build [-d] [-s] [-h] [-p PLATFORM] BUILD_IMAGE_NAME:BUILD_IMAGE_TAG[:REPOSITORY][:MODULE_VERSION]

    Options:
        -d Debug mode.
        -s Sign RPMs after building.

    Signing environment variables:
        GPG_KEY_PATH Path to an ASCII-armored private key file.
        GPG_FINGERPRINT Optional GPG fingerprint or key ID used for rpmsign.
        GPG_PASSPHRASE Passphrase for the private key.

    Build for RHEL/AlmaLinux/Rocky Linux 10 + AppStream module:
        build almalinux:10

    Build for RHEL/AlmaLinux/Rocky Linux 9 + AppStream module:
        build almalinux:9
        build almalinux:9:appstream:1.22
        build almalinux:9:appstream:1.24
        build almalinux:9:appstream:1.26

    Build for RHEL/AlmaLinux/Rocky Linux 8 + AppStream module:
        # build almalinux:8 (version 1.14 is not supported)
        build almalinux:8:appstream:1.16
        build almalinux:8:appstream:1.18
        build almalinux:8:appstream:1.20
        build almalinux:8:appstream:1.22
        build almalinux:8:appstream:1.24

    Build for RHEL/AlmaLinux/Rocky Linux 8 + EPEL Stream module:
        # EPEL 8 Modularity was going away on February 15, 2023
        build almalinux:8:epel-modular:mainline

    Build for RHEL/AlmaLinux/Rocky Linux 10 linux/arm64/v8(aarch64) + AppStream module:
        build -p linux/arm64/v8 almalinux:10

    Build for RHEL/AlmaLinux/Rocky Linux 9 linux/arm64/v8(aarch64) + AppStream module:
        build -p linux/arm64/v8 almalinux:9
        build -p linux/arm64/v8 almalinux:9:appstream:1.22
        build -p linux/arm64/v8 almalinux:9:appstream:1.24
```

## Build RPM Packages with Docker

You can build RPM packages in Docker.

```bash
BUILD_HOSTNAME=el10.example.org ./build almalinux:10
```

- Build and sign RPMs

```bash
export GPG_KEY_PATH=/path/to/rpm-signing-key.asc
read -r -s -p "GPG_PASSPHRASE: " GPG_PASSPHRASE; printf '\n'; export GPG_PASSPHRASE
BUILD_HOSTNAME=el10.example.org ./build -s almalinux:10
```

If the key file contains multiple secret keys, set `GPG_FINGERPRINT` explicitly.

- Debug shell

```bash
# el10 + debug shell
BUILD_HOSTNAME=el10.example.org ./build -d almalinux:10
/pkg/build-rpm /pkg/rpmbuild nginx-module-fancyindex.spec

# el9 + linux/arm64/v8 + debug shell
BUILD_HOSTNAME=el9.example.org ./build -d -p linux/arm64/v8 almalinux:9
/pkg/build-rpm /pkg/rpmbuild nginx-module-fancyindex.spec

# el8 + Modular package version + debug shell
BUILD_HOSTNAME=el8.example.org ./build -d almalinux:8:appstream:1.24
/pkg/build-rpm /pkg/rpmbuild nginx-module-fancyindex.spec appstream 1.24
```

## Release

1. Run `git tag -s vX.Y.Z -m vX.Y.Z`.
2. Run `git push origin vX.Y.Z` and wait for the Release to be created.
3. Edit the created Release.
4. Press the `Generate release notes` button and edit the release notes.
5. Press the `Update release` button.

## License

BSD-2-Clause
