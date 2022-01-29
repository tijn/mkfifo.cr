# mkfifo

This small library monkey patches `File` to add two new class methods: `fifo` and `fifo?`.

I made this because:

1. I need it for my hobby project
2. I found [this dicussion about it](https://forum.crystal-lang.org/t/fifo-file-in-linux/271), so others need it too

It's basically a copy of [Ruby's `File.mkfifo`](https://forum.crystal-lang.org/t/fifo-file-in-linux/271), but I changed the permissions to match Crystal's default for new files.

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

## Contributing

1. Fork it (<https://github.com/tijn/mkfifo/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Tijn Schuurmans](https://github.com/tijn) - creator and maintainer


## Alternatives

I just found [fifo.cr](https://github.com/alexherbo2/fifo.cr) which takes a different approach which is arguably somewhat cleaner since it avoids monkey patching.
