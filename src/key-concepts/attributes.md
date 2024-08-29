---
icon: dot
order: 90
---

# SVG Attributes

Victor converts the options hash you pass to a tag into SVG attributes:

||| :icon-ruby: Ruby Input
```ruby
svg.rect x: 2, y: 2,
  width: 200, height: 200
```

||| :icon-code: SVG Output
```svg
<rect x="2" y="2"
  width="200" height="200"/>
```
|||

## Ruby-to-CSS Transformation Rules

### Underscores to hyphens

Underscores in attribute names, are converted to hyphens
(`font_family` :icon-arrow-right: `font-family`):

||| :icon-ruby: Ruby Input
```ruby
svg.text "Victor",
  x: 40, y: 50,
  font_family: 'Arial',
  font_weight: :bold,
  font_size: 40
```

||| :icon-code: SVG Output
```svg
<text
  x="40" y="50"
  font-family="arial"
  font-weight="bold"
  font-size="40">
  Victor
</text>
```

|||


### Symbol values

Symbol values are treated as strings:

||| :icon-ruby: Ruby Input
```ruby
svg.rect fill: :red
```

||| :icon-code: SVG Output
```svg
<rect fill="red"/>
```
|||

### Hash value

If the value of an attribute is a hash, it will be converted to a 
style-compatible string, where keys and values are combined with a colon (`:`),
and key-value pairs are combined with a semicolon (`;`):

||| :icon-ruby: Ruby Input
```ruby
svg.rect x: 0, y: 0,
  style: { stroke: '#ccc', fill: 'red' }
```

||| :icon-code: SVG Output
```svg
<rect x="0" y="0"
  style="stroke:#ccc; fill:red"/>
```
|||

### Array value

If the value of an attribute is an array, it will be converted to a 
space-delimited string:

||| :icon-ruby: Ruby Input
```ruby
svg.polygon points: %w[0,0 50,100 100,0]
```
||| :icon-code: SVG Output
```svg
<polygon points="0,0 50,100 100,0"/>
```
|||


## See Also

{.list-icon}
- :icon-mark-github: [`Victor::Attributes` source code](https://github.com/DannyBen/victor/blob/master/lib/victor/attributes.rb)
