---
icon: dot
order: 50
---

# Composition

Create multiple `Victor::SVG` elements, and merge them together using `#append`.


## Target Image

In the example below, we are creating the Victor logo.

![](/examples/logo/logo.svg)

## Usage Pattern

1. Create multiple `Victor::SVG` objects, all originating from the same coordinate
   (e.g., 0, 0).
2. Combine these objects into a final `Victor::SVG` object by using `#append`
   (or its alias `#embed`) and applying SVG position transformations.

## Code

:::code source="/examples/logo/logo.rb" :::

[!button :icon-mark-github: See this example on GitHub](https://github.com/DannyBen/victor-book/tree/master/src/examples/logo)

## See Also

{.list-icon}
- :icon-code: [SVG Class Reference](/class-reference/svg)
- :icon-mark-github: [`Victor::SVG` source code](https://github.com/DannyBen/victor/blob/master/lib/victor/svg.rb)
- :icon-mark-github: [`Victor::SVGBase` source code](https://github.com/DannyBen/victor/blob/master/lib/victor/svg_base.rb)
