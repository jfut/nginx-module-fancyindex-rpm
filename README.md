# nginx-module-fancyindex RPM Packaging

[![Build Status](https://github.com/jfut/nginx-module-fancyindex-rpm/workflows/test/badge.svg?branch=master)](https://github.com/jfut/nginx-module-fancyindex-rpm/actions?query=workflow%3Atest)

[ngx-fancyindex](https://github.com/aperezdc/ngx-fancyindex) RPM Packaging for RHEL/CentOS/others.

## Install an RPM package

- [Download](https://github.com/jfut/nginx-module-fancyindex-rpm/releases)
- Install:
    ```
    # el7
    yum install nginx-module-fancyindex-0.5.1-2.el7.x86_64.rpm
    
    # el8 + module 1.16 stream
    dnf install nginx-module-fancyindex-0.5.1-2.module_el8.1.16.x86_64.rpm

    # el8 + module 1.18 stream
    dnf install nginx-module-fancyindex-0.5.1-2.module_el8.1.18.x86_64.rpm
    
    # el8 + EPEL module mainline stream
    dnf install nginx-module-fancyindex-0.5.1-2.module_el8.mainline.x86_64.rpm
    ```
- Add `load_module` in `nginx.conf`:
    ```
    load_module "modules/ngx_http_fancyindex_module.so";
    ```
- Add your configuration for this module (See [the official documentation](https://github.com/aperezdc/ngx-fancyindex)).
- `systemctl restart nginx.service`

## Usage

```
Usage:
    build [-d] [-h] BUILD_IMAGE_NAME:BUILD_IMAGE_TAG[:MODULE_VERSION]

    Options:
        -d Debug mode.

    Build for CentOS 8 + AppStream module:
        # build centos:8:1.14 (not supported)
        build centos:8:1.16
        build centos:8:1.18

    Build for CentOS 8 + EPEL Stream module:
        build centos:8:mainline

    Build for CentOS 7:
        build centos:7
```

## Build RPM Packages with Docker

You can build RPM packages in Docker.

```
./build centos:8:1.18
```

- Debug shell

```
./build -d centos:8:1.18
/pkg/build-rpm /pkg/rpmbuild nginx-module-fancyindex.spec 1.18
```

## Release tag

e.g.:

```
git tag -a v0.5.1-2 -m "v0.5.1-2"
git push origin refs/tags/v0.5.1-2
```

## License

BSD-2-Clause

