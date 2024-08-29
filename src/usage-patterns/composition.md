---
icon: dot
order: 50
---

# Composition

By requiring `victor/script`, 
by having one component call and reference other components.

## Target Image

In the example below, we are creating this icon.

![](/examples/heart/heart.svg)

## Usage Pattern

1. Instantiate a `Victor::SVG` class.
2. Create SVG elements by utilizing its `method_missing` behavior, which allows
   you to call `svg.rect`, `svg.circle`, etc., to generate any SVG tag.

## Code

:::code source="/examples/heart/heart.rb" :::


## See Also

{.list-icon}
- :icon-code: [DSL Module Reference](/class-reference/dsl)
- :icon-mark-github: [`victor/script` source code](https://github.com/DannyBen/victor/blob/master/lib/victor/script.rb)
- :icon-mark-github: [`Victor::DSL` source code](https://github.com/DannyBen/victor/blob/master/lib/victor/dsl.rb)
