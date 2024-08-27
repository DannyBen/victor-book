require 'victor'

class Piece < Victor::Component
  attr_reader :dark

  def initialize(x: 0, y: 0, dark: false)
    @dark = dark
    @x = x
    @y = y
  end

  # Width and height can bn provided as methods, or as instance variables in 
  # the #initialize method.
  def width = @width ||= 80
  def height = @height ||= 80

  # This method defines the SVG body.
  # Use add.* to add any SVG element.
  def body
    add.circle class: css_class,
      cx: x + width / 2, cy: y + height / 2,
      r: [width, height].min / 2
  end

  # This optional method returns a CSS hash. It will be merged into any host
  # component automatically.
  def style
    {
      '.piece': {
        filter: 'drop-shadow(8px 8px 8px rgba(0, 0, 0, 0.5))',
        stoke: :none
      },
      '.light.piece': {
        fill: '#f5f5f5',
      },
      '.dark.piece':  {
        fill: '#333',
      }
    }
  end

private

  def css_class
    @css_class ||= (dark ? 'dark piece' : 'light piece')
  end
end
