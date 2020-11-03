# openwrt-packages
Additional packages for OpenWRT that are not part of the official feeds.

## Using this package feed

Edit your `feeds.conf` and add this line at the end

```
src-git gbeine-packages https://github.com/gbeine/openwrt-packages.git
```

Run

```
./scripts/feeds update gbeine-packages
./scripts/feeds install -a
```

## Packages in the feed

* devel/ragel - The [Ragel State Machine Compiler](http://www.colm.net/open-source/ragel/)
* lang/python/python-future - A Python package required for building MAVLink Router [D, H]
* lang/rustc - The [Rust](https://www.rust-lang.org) compiler, required to build Suricata 5.x [D, H]
* libs/libhtp - The current version of the [libHTP](https://github.com/OISF/libhtp) HTTP protocol parser for Suricata
* net/curl-hosts - A package of curl for the host build target, required to build Rust [D, H]
* net/mavlink-router - The current version of [MAVLink Router](https://github.com/mavlink/mavlink-router)
* net/suricata - The version 4.1.x of [Suricata IDS](https://suricata-ids.org)

Notes:
* D - Required as a dependency
* H - Required as a host dependency during the build
* W - Work in progress

## Disclaimer

I do not provide official support for any of these packages.
Use at your own risk.
