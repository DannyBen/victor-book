---
label: Basic Generation
icon: home
---

# Basic Generation

```ruby
require 'victor'

# Create an instance.
# Any attribute you pass will be added to the `<svg ...>`
svg = Victor::SVG.new width: 140, height: 100, style: { background: '#ddd' }

# Add SVG tags directly
svg.rect x: 10, y: 10, width: 120, height: 80, fill: '#666'
svg.circle x: 50, cy: 50, r: 30, fill: 'yellow'

# or with a `build` block:
svg.build do
  rect x: 10, y: 10, width: 120, height: 80, rx: 10, fill: '#666'
  circle cx: 50, cy: 50, r: 30, fill: 'yellow'
end

# Save the output
svg.save 'pacman'

# Or render it to screen
puts svg.render

