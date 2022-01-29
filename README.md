# mkfifo

This small library monkey patches `File` to add two new class methods: `fifo` and `fifo?`.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     mkfifo:
       github: tijn/mkfifo
   ```

2. Run `shards install`

## Usage

```crystal
require "mkfifo"

path = File.tempname
File.mkfifo(path)
File.fifo?(path) # ==> true

# read from the fifo, for example
File.each_line(path) do |line|
  puts line
end

# or write to it:
File.open(path) do |fifo|
  fifo.puts("foo and bar")
end
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/tijn/mkfifo/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Tijn Schuurmans](https://github.com/tijn) - creator and maintainer
