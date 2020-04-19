# nginx-module-fancyindex RPM Packaging

[![Build Status](https://github.com/jfut/nginx-module-fancyindex-rpm/workflows/test/badge.svg?branch=master)](https://github.com/jfut/nginx-module-fancyindex-rpm/actions?query=workflow%3Atest)

RPM Packaging for [ngx-fancyindex](https://github.com/aperezdc/ngx-fancyindex).

## Install an RPM package

- [Download](https://github.com/jfut/nginx-module-fancyindex-rpm/releases)
- `yum install nginx-module-fancyindex-x.y.z-n.elx.x86_64.rpm`
- Add `load_module` in `nginx.conf`:
    ```
    load_module "modules/ngx_http_fancyindex_module.so";
    ```
- Add your configuration for this module (See [the official documentation](https://github.com/aperezdc/ngx-fancyindex)).
- `systemctl restart nginx.service`

## Usage

```
Usage:
    build [-d] [-h] BUILD_IMAGE_NAME

    Options:
        -d Debug mode.

    Build for CentOS 8:
        build -i centos:8

    Build for CentOS 7:
        build -i centos:7
```

## Build RPM Packages with Docker

You can build RPM packages in Docker.

```
./build
```

- Debug shell

```
./build -d
/pkg/build-rpm /pkg/rpmbuild nginx-module-fancyindex.spec
```

## Release tag

e.g.:

```
git tag -a v1.5.1-1 -m "v1.5.1-1"
git push origin refs/tags/v1.5.1-1
```

## License

BSD-2-Clause

