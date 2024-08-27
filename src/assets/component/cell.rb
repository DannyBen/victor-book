require 'victor'

class Cell < Victor::Component
  attr_reader :dark

  def initialize(x: 0, y: 0, dark: false)
    @dark = dark

    # These 4 do not need attr_reader, Victor::Component handles that.
    # While x and y are optional, width and height are required.
    @x = x
    @y = y
    @width = 100
    @height = 100
  end

  # This method defines the SVG body.
  # Use add.* to add any SVG element.
  def body
    add.rect class: css_class, x: x, y: y, width: width, height: height
  end

  # This optional method returns a CSS hash. It will be merged into any host
  # component automatically.
  def style
    {
      '.cell':       { stroke: :white, stroke_width: 1 },
      '.light.cell': { fill: '#d4a76f' },
      '.dark.cell':  { fill: '#6a3f2b' }
    }
  end

private

  def css_class
    @css_class ||= (dark ? 'dark cell' : 'light cell')
  end
end
