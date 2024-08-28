---
icon: dot
order: D
---

# Subclass

Create your own class, that uses an instance of `Victor::SVG`.

## Target Image

In the example below, we are creating this grid with random colors.

!!!info Note
This class generates output identical to the
[Class Example](/usage-patterns/class).
!!!

![](/examples/grid-subclass/grid.svg)

## Usage Pattern

1. Create your own class and inherit from `Victor::SVG`.
2. In the `#initialize` method, call `super` with any setup attributes.
3. Optionally, in the `#initialize` method, call an internal method to generate
   your SVG.

!!!success Tip
When you inherit from `Victor::SVG`, you can use SVG tags directly through
`method_missing` (as shown in this example).

If you inherit from `Victor::SVGBase`, you'll need to use the `#element` method
to create SVG tags.
!!!

## Code

:::code source="/examples/grid-subclass/grid.rb" :::

## See Also

{.list-icon}
- :icon-code: [SVG Class Reference](/class-reference/svg)
- :icon-mark-github: [`Victor::SVG` source code](https://github.com/DannyBen/victor/blob/master/lib/victor/svg.rb)
- :icon-mark-github: [`Victor::SVGBase` source code](https://github.com/DannyBen/victor/blob/master/lib/victor/svg_base.rb)
