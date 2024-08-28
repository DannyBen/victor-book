---
icon: dot
order: C
---

# Class

Create your own class, that uses an instance of `Victor::SVG`.

## Target Image

In the example below, we are creating this grid with random colors.

!!!info Note
This class generates output identical to the
[Subclass Example](/usage-patterns/subclass).
!!!

![](/examples/grid/grid.svg)

## Usage Pattern

1. Create your own class.
2. Use `Victor::SVG` internally to generate SVG.

## Code

:::code source="/examples/grid/grid.rb" :::

## See Also

{.list-icon}
- :icon-code: [SVG Class Reference](/class-reference/svg.md)
- :icon-mark-github: [`Victor::SVG` source code](https://github.com/DannyBen/victor/blob/master/lib/victor/svg.rb)
- :icon-mark-github: [`Victor::SVGBase` source code](https://github.com/DannyBen/victor/blob/master/lib/victor/svg_base.rb)
