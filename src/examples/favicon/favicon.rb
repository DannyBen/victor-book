require 'victor'
include Victor

debug = false
color = :black
size = 110
viewbox = "0 0 #{size} #{size}"

bg = SVG.new  do
  rect x: 0, y: 0, width: size, height: size, fill: '#999'
end

pacman = SVG.new do
  path class: 'letter', transform: 'rotate(45 50 50)',
    d: %w[
      M 50,50
      m 0,-50
      a 50,50 0 1,0 50,50
      L 50,50
      Z
    ]

  circle class: 'eye', cx: 50, cy: 20, r: 5
end

svg = SVG.new viewBox: viewbox #, width: 100, height: 100
svg.css = {
  '.letter': { stroke: color, stroke_width: 3, fill: :none },
  '.eye': { stroke: color, stroke_width: 3, fill: color },
}

svg.build do
  append bg if debug
  g(transform: 'translate(10 5)') { append pacman }
end

svg.save 'favicon'
