---
icon: code
order: A
---

# SVG Class Reference

The `Victor::SVG` (and `Victor::SVGBase`) class provides a foundation for
creating SVG graphics in Ruby. It supports custom templates, CSS styling, and
flexible SVG element generation.

## Initialization

### `initialize`

Creates a new instance of `SVG`.

==- :icon-kebab-horizontal: Parameters

| Parameter    | Type           | Description                                                                  |
|:-------------|:---------------|:-----------------------------------------------------------------------------|
| `attributes` | Hash, optional | Initial attributes for the SVG, such as `:width`, `:height`, and `:viewBox`. |
| `block`      | Proc, optional | A block that defines the SVG content.                                        |

==- :icon-ruby: Example

```ruby
svg = Victor::SVGBase.new viewBox: '0 0 200 200'
svg.circle cx: '100', cy: '100', r: '50'

# Initialize with a block
svg = Victor::SVGBase.new viewBox: '0 0 200 200' do
  circle cx: '100', cy: '100', r: '50'
end
```
===

## Building

### `element`

Adds an SVG element to the content.

==- :icon-kebab-horizontal: Parameters

| Parameter    | Type             | Description                      |
|:-------------|:-----------------|:---------------------------------|
| `name`       | Symbol or String | The tag name of the SVG element. |
| `value`      | String, optional | The content inside the element.  |
| `attributes` | Hash, optional   | Attributes for the SVG element.  |

==- :icon-info: Notes

- If `value` is a Hash, it's treated as `attributes`.
- If `name` ends with `!`, the content is not XML-escaped.
- This method is the target for `method_missing`, enabling dynamic element
  names.

==- :icon-ruby: Example

```ruby
svg.element :rect, x: '10', y: '10', width: '100', height: '100'
svg.element :text, 'Hello, World!', x: '50', y: '50'
```

===

### `build`

Evaluates a block in the context of the SVG instance, allowing dynamic SVG
content creation.

==- :icon-kebab-horizontal: Parameters

| Parameter    | Type           | Description                                                                  |
|:-------------|:---------------|:-----------------------------------------------------------------------------|
| `block`      | Proc, optional | A block that defines the SVG content.                                        |

==- :icon-ruby: Example
```ruby
svg.build do
  circle cx: '100', cy: '100', r: '50'
  text 'Centered Text', x: '100', y: '100'
end
```

===

### `append` / `embed` / `<<`

Adds content from another source to the SVG. This can be used to compose SVG
using other SVG objects.

==- :icon-kebab-horizontal: Parameters

| Parameter            | Type    | Description                                                                       |
|:---------------------|:--------|:----------------------------------------------------------------------------------|
| `additional_content` | Object | Any object that responds to `to_s`. Usually this is another `Victor::SVG` object. |


==- :icon-ruby: Example
```ruby
host = SVG.new
guest = SVG.new

host << guest
host.append guest
host.embed guest
```

===

### `css`

Manages CSS definitions for the SVG.

==- :icon-kebab-horizontal: Parameters
| Parameter | Type           | Description             |
|:----------|:---------------|:------------------------|
| `defs`    | Hash, optional | CSS definitions to set. |

==- :icon-kebab-horizontal: Return Value

| Type   | Description                  |
|:-------|:-----------------------------|
| `Hash` | The current CSS definitions. |

==- :icon-ruby: Example

```ruby
svg.css = { '.hint': { color: :red, font_size: '12px' } }
svg['.hint'] = { color: :red, font_size: '12px' }
```
===

## Rendering / Saving

### `save`

Saves the SVG content to a file.

==- :icon-kebab-horizontal: Parameters

| Parameter  | Type                       | Description                                  |
|:-----------|:---------------------------|:---------------------------------------------|
| `filename` | String                     | The name of the file to save.                |
| `template` | Symbol or String, optional | The template to use.                         |
| `glue`     | String, optional           | The glue string to use between SVG elements. |

==- :icon-ruby: Example

```ruby
svg.save 'outfile'
svg.save 'outfile', template: :minimal
svg.save 'outfile', template: 'path/to/template'
svg.save 'outfile.svg', template: 'path/to/template', glue: ''
```

===

### `render`

Renders the full SVG string, including its CSS and SVG header.

==- :icon-kebab-horizontal: Parameters

| Parameter  | Type                       | Description                                  |
|:-----------|:---------------------------|:---------------------------------------------|
| `template` | Symbol or String, optional | The template to use.                         |
| `glue`     | String, optional           | The glue string to use between SVG elements. |

==- :icon-ruby: Example

```ruby
puts svg.render
```

===

### `to_s`

Converts the SVG content to a string. This method is used internally to join the
SVG content with the specified `glue`.

!!!info Note
The string output provided by `#to_s` does not include the CSS or the SVG header.
If you want the full SVG string, see [`#render`](#render)
!!!

==- :icon-ruby: Example

```ruby
puts svg
```

===

## Internal / Special Use

### `setup`

Sets up the initial attributes for the SVG.

This method is used internally, and by the [DSL](/usage-patterns/dsl) and
typically not required for basic usage.

==- :icon-kebab-horizontal: Parameters

| Parameter    | Type           | Description                                                                  |
|:-------------|:---------------|:-----------------------------------------------------------------------------|
| `attributes` | Hash | Initial attributes for the SVG, such as `:width`, `:height`, and `:viewBox`. |


### `content`

Manages the array of SVG lines. This is used internally to assemble the SVG
content.

### `svg_attributes`

Holds the attributes for the SVG element, such as `width`, `height`, and other
SVG attributes.

==- :icon-ruby: Example

```ruby
svg.svg_attributes.width = '200'
svg.svg_attributes.height = '200'
```
===

### `template`

Specifies the SVG template to use. This is rarely needed as the default template is often sufficient.

==- :icon-ruby: Example

```ruby
svg.template = :minimal
svg.template = 'path/to/template'
```

===

### `glue`

Specifies the string to use between SVG elements. This is rarely needed as the default glue is often sufficient.
