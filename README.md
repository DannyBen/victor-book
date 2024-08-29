# Victor Documentation Site

This is the source for [victor.dannyb.co](https://victor.dannyb.co) - the
documentation site for [victor](https://github.com/DannyBen/victor)

## Development

For development purposes, you will need these:

### Required

- [retype](https://retype.com)

### Optional

- [opcode](https://github.com/DannyBen/opcode)
- All the ruby dependencies - `bundle install`

## Favicon

In the examples/favicon directory:

1. .rb => .svg: `ruby favicon.rb`
2. .svg => .png: `cairosvg favicon.svg --output-width 512 -o favicon.png`
3. .png => .ico: <https://www.png2ico.com/>

