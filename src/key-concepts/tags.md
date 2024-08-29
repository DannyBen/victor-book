---
icon: dot
order: 100
---

# SVG Tags

Victor uses a single method - `#tag`, or its alias `#element` - to generate all
SVG elements:

||| :icon-ruby: Ruby Input
```ruby
svg.tag :rect, x: 2, y: 2,
  width: 200, height: 200
```

||| :icon-code: SVG Output
```svg
<rect x="2" y="2"
  width="200" height="200"/>
```
|||

But you can omit it. Calls to any other method will be delegated to the 
`#tag` method, so normal usage looks more like this:

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

In other words, these three lines will generate the same output:

```ruby
svg.tag :anything, option: 'value'
svg.element :anything, option: 'value'
svg.anything option: 'value'
```

## Using the `#build` block

You can use the `#build` method to generate the SVG with a block:

```ruby
svg.build do 
  rect x: 0, y: 0, width: 100, height: 100, fill: '#ccc'
  rect x: 20, y: 20, width: 60, height: 60, fill: '#f99'
end
```

## Nested Content

For SVG elements that have inner content - such as text - simply pass it as 
the first argument:

||| :icon-ruby: Ruby Input

```ruby
svg.text 'Victor', x: 40, y: 50
```

||| :icon-code: SVG Output
```svg
<text x="40" y="50">Victor</text>
```

|||


For nesting of other elements, use Ruby blocks:

||| :icon-ruby: Ruby Input
```ruby
svg.build do
  g transform: 'translate(20 20)' do
    text "Hello", x: 0, y: 0
  end
end
```

||| :icon-code: SVG Output
```svg
<g transform="translate(20 20)">
  <text x="0" y="0">Hello</text>
</g>
```

|||

## Tagless Elements

Using underscore (`_`) as the element name will directly add the value to the
generated SVG, without any surrounding element. This allows you to generate
output like this:

||| :icon-ruby: Ruby Input
```ruby
svg.build do 
  text do
    _ 'You are'
    tspan 'not', font_weight: "bold"
    _ 'a banana'
  end
end
```

||| :icon-code: SVG Output
```svg
<text>
  You are
  <tspan font-weight="bold">not</tspan>
  a banana
</text>
```

|||


## Character Escaping

By default, plain text values are automatically escaped (e.g., `&` becomes
`&amp;`). If you need the values to remain untouched, add a `!` suffix to the
element's name.

||| :icon-ruby: Ruby Input
```ruby
svg.build do
  text "Ben & Jerry's",
    x: 0, y: 20, font_size: 16

  
  text! "&#169; Warner Bros.",
    x: 0, y: 40, font_size: 16
end
```

||| :icon-code: SVG Output
```svg
<text x="0" y="20" font-size="16">
  Ben &amp; Jerry's
</text>


<text x="0" y="40" font-size="16">
  &#169; Warner Bros.
</text>
```

|||


## See Also

{.list-icon}
- :icon-code: [SVG Class Reference](/class-reference/svg)
- :icon-mark-github: [`Victor::SVG` source code](https://github.com/DannyBen/victor/blob/master/lib/victor/svg.rb)
- :icon-mark-github: [`Victor::SVGBase` source code](https://github.com/DannyBen/victor/blob/master/lib/victor/svg_base.rb)
