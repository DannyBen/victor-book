---
icon: dot
order: E
---

# Component

By using the `Victor::Component` base class, you can compose complex SVG images
by having one component call and reference other components.

## Target Image

In the example below, we are creating this output, using `Cell`, `Piece` and 
`Board` components.

![](/assets/component/filled-board.svg)

## Usage Pattern

1. Create a class that inherits from `Victor::Component`
2. Implement `width` and `height`, wither as public methods or instance variables.
3. Implement `body`, and use it to add SVG elements and/or embed other components.
4. Optionally, implement `style`, and use it to return a CSS hash, which will be 
   merged to any hosting component.
5. Optionally, if you want to provide host components with the ability to
   control `x` and `y`, provide them as public methods or instance variables.

## Notes

1. Components are always generated with 100% width and height, and with a
   `viewBox` that is determined by your x, y, width, height properties (x and y 
   default to 0).
2. Once a component was rendered (`#render`, `#to_s`) or saved (`#save`), the
   `#body` method will be called once and once only. This means that at this
   point the SVG can no longer be altered.

## Available Methods

`Victor::Component` provides you with these methods:

### `add`

This is an alias to the underlying `Victor::SVG` object (which is also
represented as `#vector`). It is intended to be used in your `#body`
implementation, like this:

```ruby
def body
  add.rect x: 0, y: 0, width: width, height: height
end
```

### `append` / `embed`

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

### `save`

Save the SVG. The method is delegated to the underlying `Victor::SVG` object.

```ruby
component.save 'outfile'
```

### `render` / `to_s`

Render the SVG to string. The method is delegated to the underlying
`Victor::SVG` object. This method is called when you `puts` the object.

```ruby
puts component.render
puts component  # same
```

### `content`

Render the array of SVG lines. The method is delegated to the underlying
`Victor::SVG` object.

## Code

+++ Cell
:::code source="/assets/component/cell.rb" :::
+++ Piece
:::code source="/assets/component/piece.rb" :::
+++ Board
:::code source="/assets/component/board.rb" :::
+++
