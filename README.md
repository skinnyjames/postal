# postal

Crystal bindings for [libpostal](https://github.com/openvenues/libpostal)

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     postal:
       git: https://codeberg.org/skinnyjames/postal.git
   ```

2. Run `shards install`

## Usage

Example http parsing server

```crystal
require "postal"
require "http/server"
require "json"

worker = Postal::Worker.new("/opt/geoffrey/embedded/share/libpostal")

server = HTTP::Server.new do |context|
  add = context.request.query_params["add"]? || "123 Maine st, Quincy IL 62301"

  arr = worker.expand(add).map(&.parsed)

  context.response.content_type = "application/json"
  context.response.print arr.to_json
end

server.bind_tcp 8081
server.listen
```

## Development

Upcoming

## Contributors

- [Sean Gregory](https://codeberg.org/skinnyjames) - creator and maintainer
