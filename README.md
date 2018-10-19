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
  GEMINABOX_PORT=9292
```

Geminabox will start binded to `0.0.0.0:9292`

## License

MIT. See LICENSE for full license text.
