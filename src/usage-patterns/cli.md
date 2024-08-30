---
icon: dot
order: 10
---

# Command Line

Use the separate
[Victor Command Line Interface](https://github.com/DannyBen/victor-cli)
to create new Ruby scripts, and render SVGs.

## Target Image

In the example below, we are creating this ghost image.

![](/examples/ghost/ghost.svg)

## Usage Pattern

1. Run `victor init RUBY_FILENAME` to create a sample
   [Victor DSL](/usage-patterns/dsl) file.
2. Edit the file.
3. Run `victor render RUBY_FILENAME SVG_FILENAME` to render your SVG.

## Code

:::code source="/examples/ghost/ghost.rb" :::

[!button :icon-mark-github: See this example on GitHub](https://github.com/DannyBen/victor-book/tree/master/src/examples/ghost)

## See Also

{.list-icon}
- :icon-dot: [Ways to Use Victor :icon-chevron-right: DSL](/usage-patterns/dsl)
- :icon-mark-github: [Victor CLI source code](https://github.com/DannyBen/victor-cli)
