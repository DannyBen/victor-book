---
icon: dot
order: 100
---

# Output Templates

Victor renders its content using the [`:default` template][default-template].

If you wish to use another template, you can either use one of the built-in
templates (`:default` or `:minimal`), or provide your own:

```ruby
svg = Victor::SVG.new template: :minimal
svg = Victor::SVG.new template: 'path/to/template.svg'
```

See the [templates] folder for an understanding of how templates are 
structured.

Templates can also be provided when rendering or saving the output:

```ruby
svg.save 'filename', template: :minimal
svg.render template: :minimal
```

## New Lines

By default, the generated SVGs will have a newline glue between the elements.
You can change this (for example, to an empty string) if the default newlines
are not appropriate for your use case.

```ruby
svg = Victor::SVG.new glue: ''
```

The glue can also be provided when rendering or saving the output:

```ruby
svg.save 'filename', glue: ''
svg.render glue: ''
```

[default-template]: https://github.com/DannyBen/victor/blob/master/lib/victor/templates/default.svg?short_path=c28efa4
[templates]: https://github.com/DannyBen/victor/tree/master/lib/victor/templates
