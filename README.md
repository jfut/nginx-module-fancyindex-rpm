# nginx-module-fancyindex RPM Packaging

[![Build Status](https://github.com/jfut/nginx-module-fancyindex-rpm/workflows/test/badge.svg?branch=master)](https://github.com/jfut/nginx-module-fancyindex-rpm/actions?query=workflow%3Atest)

[ngx-fancyindex](https://github.com/aperezdc/ngx-fancyindex) RPM Packaging for RHEL/AlmaLinux/Rocky Linux/others.

## Install an RPM package

- [Download](https://github.com/jfut/nginx-module-fancyindex-rpm/releases)
- Install:
    ```
    # el9 + AppStream module 1.20 stream
    dnf install nginx-module-fancyindex-0.5.2-2.module_el9.1.20.x86_64.rpm
    
    # el8 + AppStream module 1.16 stream
    dnf install nginx-module-fancyindex-0.5.2-2.module_el8.1.16.x86_64.rpm
    
    # el8 + AppStream module 1.18 stream
    dnf install nginx-module-fancyindex-0.5.2-2.module_el8.1.18.x86_64.rpm
    
    # el8 + AppStream module 1.20 stream
    dnf install nginx-module-fancyindex-0.5.2-2.module_el8.1.20.x86_64.rpm
    
    # el8 + EPEL module 1.20 stream
    dnf install nginx-module-fancyindex-0.5.2-2.module_el8.epel.1.20.x86_64.rpm
    
    # el8 + EPEL module mainline stream (currently: 1.21)
    dnf install nginx-module-fancyindex-0.5.2-2.module_el8.epel.mainline.x86_64.rpm
    
    # el7
    yum install nginx-module-fancyindex-0.5.2-2.el7.x86_64.rpm
    ```

- Add `load_module` in `nginx.conf`:
    ```
    load_module "/usr/lib64/nginx/modules/ngx_http_fancyindex_module.so";
    ```
- Add your configuration for this module (See [the official documentation](https://github.com/aperezdc/ngx-fancyindex)).
- `systemctl restart nginx.service`

## Usage

```
Usage:
    build [-d] [-h] BUILD_IMAGE_NAME:BUILD_IMAGE_TAG[:REPOSITORY][:MODULE_VERSION]

    Options:
        -d Debug mode.

    Build for RHEL/AlmaLinux/Rocky Linux 9 + AppStream module:
        build almalinux:9:appstream:1.20

    Build for RHEL/AlmaLinux/Rocky Linux 8 + AppStream module:
        # build almalinux:8:appstream:1.14 (not supported)
        build almalinux:8:appstream:1.16
        build almalinux:8:appstream:1.18
        build almalinux:8:appstream:1.20

    Build for RHEL/AlmaLinux/Rocky Linux 8 + EPEL Stream module:
        build almalinux:8:epel-modular:1.20
        build almalinux:8:epel-modular:mainline

    Build for RHEL/CentOS 7:
        build centos:7
```

## Build RPM Packages with Docker

You can build RPM packages in Docker.

```
./build almalinux:9:appstream:1.20
```

- Debug shell

```
./build -d almalinux:8:appstream:1.20
/pkg/build-rpm /pkg/rpmbuild nginx-module-fancyindex.spec appstream 1.20
```

## Release tag

e.g.:

```
git tag -a v0.5.2-2 -m "v0.5.2-2"
git push origin refs/tags/v0.5.2-2
```

## License

BSD-2-Clause

