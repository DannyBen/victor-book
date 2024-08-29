---
icon: dot
order: 20
---

# Component

By using the `Victor::Component` base class, you can compose complex SVG images
by having one component call and reference other components.

## Target Image

In the example below, we are creating this output, using `Cell`, `Piece` and 
`Board` components.

![](/examples/checkers/filled-board.svg)

## Usage Pattern

1. Create a class that inherits from `Victor::Component`
2. Implement `#width` and `#height`, wither as public methods or instance variables.
3. Implement `#body`, and use it to add SVG elements and/or embed other components.
4. Optionally, implement `#style`, and use it to return a CSS hash, which will be 
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
3. Each component is also a standalone SVG, that can be saved or rendered 
   independently.

## Code

+++ Cell
:::code source="/examples/checkers/cell.rb" :::
+++ Piece
:::code source="/examples/checkers/piece.rb" :::
+++ Board
:::code source="/examples/checkers/board.rb" :::
+++

## See Also

{.list-icon}
- :icon-code: [Component Class Reference](/class-reference/component)
- :icon-mark-github: [`Victor::Component` source code](https://github.com/DannyBen/victor/blob/master/lib/victor/component.rb)

