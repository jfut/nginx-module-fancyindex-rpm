# nginx-module-fancyindex RPM Packaging

[![Build Status](https://github.com/jfut/nginx-module-fancyindex-rpm/workflows/test/badge.svg?branch=master)](https://github.com/jfut/nginx-module-fancyindex-rpm/actions?query=workflow%3Atest)

[ngx-fancyindex](https://github.com/aperezdc/ngx-fancyindex) RPM Packaging for RHEL/AlmaLinux/Rocky Linux/others.

## Install an RPM package

- [Download](https://github.com/jfut/nginx-module-fancyindex-rpm/releases)
- Install:
    - RHEL/AlmaLinux/Rocky Linux 9
    ```bash
    # Non-modular package version 1.20
    dnf install nginx-module-fancyindex-0.5.2-4.el9.x86_64.rpm
    
    # AppStream module 1.22 stream
    dnf install nginx-module-fancyindex-0.5.2-4.module_el9.1.22.x86_64.rpm
    ```
    - RHEL/AlmaLinux/Rocky Linux 8
    ```bash
    # AppStream module 1.16 stream
    dnf install nginx-module-fancyindex-0.5.2-4.module_el8.1.16.x86_64.rpm
    
    # AppStream module 1.18 stream
    dnf install nginx-module-fancyindex-0.5.2-4.module_el8.1.18.x86_64.rpm
    
    # AppStream module 1.20 stream
    dnf install nginx-module-fancyindex-0.5.2-4.module_el8.1.20.x86_64.rpm
    
    # AppStream module 1.22 stream
    dnf install nginx-module-fancyindex-0.5.2-4.module_el8.1.22.x86_64.rpm
    
    # EPEL module mainline stream (version: 1.23)
    # EPEL 8 Modularity was going away on February 15, 2023
    dnf install nginx-module-fancyindex-0.5.2-4.module_el8.epel.mainline.x86_64.rpm
    ```
    - RHEL/CentOS 7
    ```bash
    yum install nginx-module-fancyindex-0.5.2-4.el7.x86_64.rpm
    ```
- Add your configuration for this module (See [the official documentation](https://github.com/aperezdc/ngx-fancyindex)).
- Restart nginx:
    ```
    systemctl restart nginx.service
    ```

If `include /usr/share/nginx/modules/*.conf;` is enabled in `nginx.conf`, this module is enabled by default. If you want to disable the module once installed, simply comment out the contents of `/usr/share/nginx/modules/mod-http-fancyindex.conf`.

## Usage

```
Usage:
    build [-d] [-h] BUILD_IMAGE_NAME:BUILD_IMAGE_TAG[:REPOSITORY][:MODULE_VERSION]

    Options:
        -d Debug mode.

    Build for RHEL/AlmaLinux/Rocky Linux 9 + AppStream module:
        build almalinux:9
        build almalinux:9:appstream:1.22

    Build for RHEL/AlmaLinux/Rocky Linux 8 + AppStream module:
        # build almalinux:8 (version 1.14 is not supported)
        build almalinux:8:appstream:1.16
        build almalinux:8:appstream:1.18
        build almalinux:8:appstream:1.20
        build almalinux:8:appstream:1.22

    Build for RHEL/AlmaLinux/Rocky Linux 8 + EPEL Stream module:
        # EPEL 8 Modularity was going away on February 15, 2023
        build almalinux:8:epel-modular:mainline

    Build for RHEL/CentOS 7:
        build centos:7
```

## Build RPM Packages with Docker

You can build RPM packages in Docker.

```
# el9 + Non-modular package version
./build almalinux:9
```

- Debug shell

```
# el8 + Modular package version + debug
./build -d almalinux:8:appstream:1.22
/pkg/build-rpm /pkg/rpmbuild nginx-module-fancyindex.spec appstream 1.22
```

## Release tag

e.g.:

```
git tag -a v0.5.2-4 -m "v0.5.2-4"
git push origin refs/tags/v0.5.2-4
```

## License

BSD-2-Clause
