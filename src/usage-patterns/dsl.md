---
icon: dot
order: 90
---

# DSL

Requiring `victor/script` provides a streamlined way to create SVG images by
automatically setting up an `#svg` object.

## Target Image

In the example below, we are creating this image.

![](/examples/heart/heart.svg)

## Usage Pattern

1. Require `victor/script`.
2. Use the `#setup` method to configure your SVG, like setting the `viewBox`.
3. Use the `#build` method to start defining your SVG content.
4. Save the SVG output to a file using the `#save` method.

## Code

:::code source="/examples/heart/heart.rb" :::

[!button :icon-mark-github: See this example on GitHub](https://github.com/DannyBen/victor-book/tree/master/src/examples/heart)

## See Also

{.list-icon}
- :icon-code: [DSL Module Reference](/class-reference/dsl)
- :icon-mark-github: [`victor/script` source code](https://github.com/DannyBen/victor/blob/master/lib/victor/script.rb)
- :icon-mark-github: [`Victor::DSL` source code](https://github.com/DannyBen/victor/blob/master/lib/victor/dsl.rb)
