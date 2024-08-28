---
icon: code
order: C
---

# DSL Module Reference

The `Victor::DSL` module is a thin wrapper around `Victor::SVG` that provides
access to the SVG object, and direct access to several of its methods.

| Method    | Description                                            |
|:----------|:-------------------------------------------------------|
| `svg`     | Returns a [`Victor::SVG`](svg) instance                |
| `setup`   | Delegated to [`Victor::SVG#setup`](svg#setup)          |
| `build`   | Delegated to [`Victor::SVG#build`](svg#build)          |
| `save`    | Delegated to [`Victor::SVG#save`](svg#save)            |
| `render`  | Delegated to [`Victor::SVG#render`](svg#render)        |
| `append`  | Delegated to [`Victor::SVG#append`](svg##append-embed) |
| `element` | Delegated to [`Victor::SVG#element`](svg#element)      |
| `css`     | Delegated to [`Victor::SVG#css`](svg#css)              |


For more information and example, see
[Ways to Use Victor :icon-chevron-right: DSL](/usage-patterns/dsl).
