---
icon: dot
order: 90
---

# SVG Attribute





## Usage

Initialize your SVG image:

```ruby
require 'victor'
svg = Victor::SVG.new
```

Any option you provide to `SVG.new` will be added as an attribute to the
main `<svg>` element. By default, `height` and `width` are set to 100%.

```ruby
svg = Victor::SVG.new width: '100%', height: '100%'
# same as just Victor::SVG.new

svg = Victor::SVG.new width: '100%', height: '100%', viewBox: "0 0 200 100"
```

As an alternative, you can set the root SVG attributes using the `setup` method:

```ruby
require 'victor'
svg = Victor::SVG.new
svg.setup width: 200, height: 150
```

Victor uses a single method (`element`) to generate all SVG elements:

```ruby
svg.element :rect, x: 2, y: 2, width: 200, height: 200
# => <rect x="2" y="2" width="200" height="200"/>
```

But you can omit it. Calls to any other method, will be delegated to the 
`element` method, so normal usage looks more like this:

```ruby
svg.rect x: 2, y: 2, width: 200, height: 200
# => <rect x="2" y="2" width="200" height="200"/>
```

In other words, these are the same:

```ruby
svg.element :anything, option: 'value'
svg.anything option: 'value'
```

You can use the `build` method, to generate the SVG with a block

```ruby
svg.build do 
  rect x: 0, y: 0, width: 100, height: 100, fill: '#ccc'
  rect x: 20, y: 20, width: 60, height: 60, fill: '#f99'
end
```

If the value of an attribute is a hash, it will be converted to a 
style-compatible string:

```ruby
svg.rect x: 0, y: 0, width: 100, height: 100, style: { stroke: '#ccc', fill: 'red' }
# => <rect x=0 y=0 width=100 height=100 style="stroke:#ccc; fill:red"/>
```

If the value of an attribute is an array, it will be converted to a 
space delimited string:

```ruby
svg.path d: ['M', 150, 0, 'L', 75, 200, 'L', 225, 200, 'Z']
# => <path d="M 150 0 L 75 200 L 225 200 Z"/>
```

For SVG elements that have an inner content - such as text - simply pass it as 
the first argument:

```ruby
svg.text "Victor", x: 40, y: 50
# => <text x="40" y="50">Victor</text>
```

You can also nest elements with blocks:

```ruby
svg.build do
  g font_size: 30, font_family: 'arial', fill: 'white' do
    text "Scalable Victor Graphics", x: 40, y: 50
  end
end
# => <g font-size="30" font-family="arial" fill="white">
#      <text x="40" y="50">Scalable Victor Graphics</text>
#    </g>
```

Underscores in attribute names are converted to dashes:

```ruby
svg.text "Victor", x: 40, y: 50, font_family: 'arial', font_weight: 'bold', font_size: 40
# => <text x="40" y="50" font-family="arial" font-weight="bold" font-size="40">
#      Victor
#    </text>
```

## Features

### Composite SVG

Victor also supports the ability to combine several smaller SVG objects into
one using the `<<` operator or the `#append` method. 

This operator expects to receive any object that responds to `#to_s` (can be another `SVG` object).

```ruby
require 'victor'
include Victor

# Create a reusable SVG object
frame = SVG.new
frame.rect x: 0, y: 0, width: 100, height: 100, fill: '#336'
frame.rect x: 10, y: 10, width: 80, height: 80, fill: '#fff'

# ... and another
troll = SVG.new
troll.circle cx: 50, cy: 60, r: 24, fill: 'yellow'
troll.polygon points: %w[24,50 50,14 76,54], fill: 'red'

# Combine objects into a single image
svg = SVG.new viewBox: '0 0 100 100'
svg << frame
svg << troll

# ... and save it
svg.save 'framed-troll'
```

Output:

[![troll](https://cdn.rawgit.com/DannyBen/victor/master/examples/14_composite_svg.svg)](https://cdn.rawgit.com/DannyBen/victor/master/examples/14_composite_svg.svg)

These two calls are identical:

```ruby
svg << other
svg.append other
```

To make this common use case a little easier to use, you can use a block when instantiating a new `SVG` object:

```ruby
troll = SVG.new do
  circle cx: 50, cy: 60, r: 24, fill: 'yellow'
end
```

Which is the same as:

```ruby
troll = SVG.new
troll.build do
  circle cx: 50, cy: 60, r: 24, fill: 'yellow'
end
```

Another approach to a more modular SVG composition, would be to subclass 
`Victor::SVG`.

See the [composite svg example](https://github.com/DannyBen/victor/tree/master/examples#14-composite-svg)
or the [subclassing example](https://github.com/DannyBen/victor/tree/master/examples#15-subclassing)
for more details.


### Saving the Output

Generate the full SVG to a string with `render`:

```ruby
result = svg.render
```

Or, save it to a file with `save`:

```ruby
svg.save 'filename'
# the '.svg' extension is optional
```

