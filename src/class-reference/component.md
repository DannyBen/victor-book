---
icon: dot
order: C
---

# Component Class Reference

The `Victor::Component` class provides you with means to create standalone SVG
components that can be composed together.

## Initialization

`Victor::Component` is an abstract class. Create a class that inherits it:

==- :icon-ruby: Example
```ruby
class GameBoard < Victor::Component
  # implementation
end
```
===

## Required Implementation Methods

All components are rendered with 100% width and height, and with a given
`viewBox` that is determined by `x`, `y`, `width` and `height` as provided
by the object itself.

Your class is required to implement these methods:

### `body`

This method will be called once and once only when the SVG is rendered. In
this method you are expected to build your SVG by calling `add.*` and
`append` (or its alias, `embed`) to add SVG elements.

==- :icon-ruby: Example
```ruby
class GameBoard < Victor::Component
  def body
    add.rect x: x, y: y, width: width, height: height
    add.text 'Round 1', x: 10, y: 10
    
    game_piece = GamePiece.new  # another Component
    embed game_piece
  end
end
```
===

### `height / width`

Since components are designed to be composable, each component is required
to advertise its point height and width. This becomes useful when a container
component needs to set its own size based on the size of the guest components.

You can either provide these values as method overrides, or as instance
variables.

==- :icon-ruby: Example
```ruby
class BoardCell < Victor::Component
  def initialize
    @height = 100
    @width = 100
  end
end

class GameBoard < Victor::Component
  def height = @height ||= cell.height * 8
  def width = @width ||= cell.width * 8
  def cell = @cell ||= BoardCell.new
end
```
===

## Optional Implementation Methods

### `x / y`

Similar to the `width` and `height` properties, you may define the `x` and `y`
origin of your object. By default, these are set to 0.

This is useful when you wish to provide a host component with the ability to
set the object's location, without resorting to positioning by other means,
such as SVG's `<g transform='translate(...)'>` tag.

You can either provide these values as method overrides, or as instance
variables.

==- :icon-ruby: Example
```ruby
class BoardCell < Victor::Component
  def initialize(x, y)
    @x = x
    @y = y
  end
end

class GameBoard < Victor::Component
  def body
    cell = BoardCell.new 20, 20
    append cell
  end
end
```
===


### `style`

The Component class is designed to allow each component to define its own CSS
stylesheet, and is responsible for merging all styles together whenever you 
call the [`append` / `embed`](#append--embed) method.

To achieve this, you can define a `style` method that returns a hash.

==- :icon-ruby: Example
```ruby
class BoardCell < Victor::Component
  def style
    {
      '.cell':       { stroke: :white, stroke_width: 1 },
      '.light.cell': { fill: '#d4a76f' },
      '.dark.cell':  { fill: '#6a3f2b' }
    }
  end
end
```
===



## Additional Methods

### `add`

This is an alias to the underlying `Victor::SVG` object. It is intended to be
used in your `#body` implementation to add SVG elements.

==- :icon-ruby: Example
```ruby
def body
  add.rect x: 0, y: 0, width: width, height: height
end
```
===

### `append` / `embed`

Use this method in your your `#body` implementation, to embed another
component. This method is doing two things:

1. Appending the SVG of the guest component.
2. Merging the CSS (`#style`) of the guest component into its own.

==- :icon-ruby: Example
```ruby
def body
  append Cell.new
  # or: embed Cell.new
end
```
===

### `svg`

Returns the final `Victor::SVG` object, after rendering all its guest
components and their CSS styles.

Under most normal circumstances, you do not need to call this method directly,
it is called as needed by other methods.

!!!warning Attention
Once the `svg` method was called, the rendered SVG is considered frozen. This
mechanism is in place in order to ensure that your `body` implementation is
called only once, and applies to other methods (such as `render` and `save`)
that call `svg` under the hood.
!!!


## Delegated Methods

| Method    | Description                                       |
|:----------|:--------------------------------------------------|
| `save`    | Delegated to [`Victor::SVG#save`](svg#save)       |
| `render`  | Delegated to [`Victor::SVG#render`](svg#render)   |
| `content` | Delegated to [`Victor::SVG#content`](svg#content) |
| `element` | Delegated to [`Victor::SVG#element`](svg#element) |
| `css`     | Delegated to [`Victor::SVG#css`](svg#css)         |
| `to_s`    | Delegated to [`Victor::SVG#to_s`](svg#to_s)       |
