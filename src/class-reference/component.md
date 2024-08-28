---
icon: code
order: C
---

# Component

`Victor::Component` provides you with these methods:

## `add`

This is an alias to the underlying `Victor::SVG` object (which is also
represented as `#vector`). It is intended to be used in your `#body`
implementation, like this:

```ruby
def body
  add.rect x: 0, y: 0, width: width, height: height
end
```

## `append` / `embed`

Use this method in your your `#body` implementation, to embed another
component. This method is doing two things:

1. Appending the SVG of the guest component.
2. Merging the CSS (`#style`) of the guest component into its own.

```ruby
def body
  append Cell.new
  # or: embed Cell.new
end
```

## `save`

Save the SVG. The method is delegated to the underlying `Victor::SVG` object.

```ruby
component.save 'outfile'
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
