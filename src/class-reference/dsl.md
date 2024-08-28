---
icon: code
order: C
---

# DSL Class Reference

`Victor::SVG` provides you with these methods:

## `save`

Save the SVG.

```ruby
svg.save 'outfile'
svg.save 'outfile', template: :minimal
svg.save 'outfile', template: 'path/to/template'
svg.save 'outfile.svg', template: 'path/to/template', glue: ''
```

## `render` / `to_s`

Render the SVG to string. The method is delegated to the underlying
`Victor::SVG` object. This method is called when you `puts` the object.

```ruby
puts component.render
puts component  # same
```

## `content`

Render the array of SVG lines. The method is delegated to the underlying
`Victor::SVG` object.
