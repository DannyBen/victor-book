---
icon: dot
order: 80
---

# CSS

CSS gets a special treatment in Victor, with these goals in mind:

1. Provide a DSL-like syntax for CSS rules.
2. Handle CSS separately, in order to allow merging CSS rules from multiple SVG
   images into one.

`Victor::SVG` has a `css` property, which can contain either a Hash or a String:

```ruby
svg = Victor::SVG.new

svg.css = css_hash_or_string
# or without the equal sign:
svg.css css_hash_or_string

svg.build do
  # ...
end
```

This flexibility allows you to apply CSS in multiple ways. Below are some
examples.

## Building the CSS

### Using hash keys

```ruby
svg = Victor::SVG.new

# without a build block
svg.css['.box'] = { fill: :red }

# or inside a build block
svg.build do 
  css['.main'] = {
    stroke: "green", 
    stroke_width: 2,
    fill: "yellow"
  }

  circle cx: 35, cy: 35, r: 20, class: 'main'
  rect x: 0, y: 0, width: 50, height: 50, class: 'box'
end
```

### Using a full hash

```ruby
svg.css = {
  '.bar': {
    fill: '#666',
    stroke: '#fff',
    stroke_width: 1
  },
  '.negative': {
    fill: '#f66'
  },
  '.positive': {
    fill: '#6f6'
  }
}
```

### Using a string

```ruby`
svg.css = <<CSS
  .main {
    stroke: green;
    stroke-width: 2;
    fill: yellow;
    opacity: 0.7;
  }
CSS

### Using an external file

```ruby
svg.css = File.read 'styles.css'
```

## Ruby-to-CSS Transformation Rules

### Underscores to hyphens

Underscore characters will be converted to hyphens:

||| :icon-ruby: Ruby Input
```ruby
svg.css['.box'] = {
  stroke_width: 20
}
```

||| :icon-code: SVG Output

```svg
<style>
  .box { stroke-width: 20; }
</style>
```

|||

### Array prefixing

If you need to add CSS statements , like `@import`, use the following syntax:

||| :icon-ruby: Ruby Input

```ruby
svg.css['@import'] = [
  "url('https://fonts/family=Audiowide')",
  "url('https://fonts/family=Pacifico')"
]
```

||| :icon-code: SVG Output
```svg
<style>
  @import url('https://fonts/family=Audiowide');
  @import url('https://fonts/family=Pacifico');
</style>
```


|||

This is achieved thanks to the fact that when Victor encounters an array
in the CSS hash, it will prefix each of the array elements with the hash
key, so the above will result in two `@import url(...)` rows.



