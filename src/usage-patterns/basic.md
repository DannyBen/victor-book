---
icon: dot
order: 100
---

# Basic

Create an instance of `Victor::SVG` and add SVG elements to it.

## Target Image

In the example below, we are creating this gear icon.

![](/examples/gear/gear.svg)

## Usage Pattern

1. Instantiate a `Victor::SVG` class.
2. Create SVG elements by utilizing its `method_missing` behavior, which allows
   you to call `svg.rect`, `svg.circle`, etc., to generate any SVG tag.

## Code

+++ Without `build` block
:::code source="/examples/gear/gear2.rb" :::
+++ With `build` block
:::code source="/examples/gear/gear.rb" :::
+++

[!button :icon-mark-github: See this example on GitHub](https://github.com/DannyBen/victor-book/tree/master/src/examples/gear)

## See Also

{.list-icon}
- :icon-code: [SVG Class Reference](/class-reference/svg)
- :icon-mark-github: [`Victor::SVG` source code](https://github.com/DannyBen/victor/blob/master/lib/victor/svg.rb)
- :icon-mark-github: [`Victor::SVGBase` source code](https://github.com/DannyBen/victor/blob/master/lib/victor/svg_base.rb)
