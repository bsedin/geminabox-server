Geminabox server
=================

This will get [Geminabox](https://github.com/geminabox/geminabox) up and running.

## Quickstart

Clone repo

    $ git clone https://github.com/kressh/geminabox-server

If you haven't install `bundler` gem yet, this is great opportunity to do it now:

    $ gem install bundler

Run bundle install:

    $ bundle

Start geminabox server:

```sh
$ GEMINABOX_DATA=/path/where/gems/will/be/saved \
  GEMINABOX_PORT=9292 \
  GEMINABOX_HOST=0.0.0.0 \
  foreman start
```

Geminabox will start binded to `0.0.0.0:9292`

## Using with nginx

If you want to use `nginx` as frontend proxy, maybe you'll want to bind geminabox to socket. To do that, run:

```bash
$ GEMINABOX_DATA=/path/where/gems/will/be/saved \
  GEMINABOX_SOCKET=/var/run/geminabox.sock \
  foreman start
```

Now configure nginx to use geminabox as upstream:

```nginx
upstream geminabox {
  server unix:/var/run/geminabox.sock;
}

server {
  listen 9292;
  server_name gems.example.com;

  location / {
    proxy_pass http://geminabox;
  }
}
```

## License

MIT. See LICENSE for full license text.
