require 'victor'

# Create an instance, with any property
svg = Victor::SVG.new viewBox: '0 0 100 100', style: { background: :lightgreen }

# Save style options for later use
style = {
  fill:   '#333',
  stroke: :none,
}

# Any unknown method inside `build` (mask, circle), is converted to SVG tags.
svg.build do
  # Define the mask for the inner circle
  mask id: 'hole' do
    rect x: 0, y: 0, width: 100, height: 100, fill: :white
    circle cx: 50, cy: 50, r: 15, fill: :black
  end

  # Outer circle
  circle cx: 50, cy: 50, r: 30, style: style, mask: 'url(#hole)'

  # 8 teeth represented by 4 rectantles
  [0, 45, 90, 135].each do |angle|
    rect x: 45, y: 10, width: 10, height: 80,
      style: style, mask: 'url(#hole)',
      transform: "rotate(#{angle} 50 50)"
  end
end

# Save the image
svg.save 'gear'

# or print it
puts svg.render
