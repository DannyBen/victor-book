require 'victor'
require 'debug'
include Victor

color = :black
debug = false
outfile = 'logo'

Box = Struct.new :x, :y, :w, :h
pad = Box[30, 10]
box = Box[-pad.x, -pad.y, 526 + (pad.x * 2), 100 + (pad.y * 2)]

viewbox = box.values.join ' '
viewbox_reference = SVG.new do
  rect x: box.x, y: box.y, width: box.w, height: box.h, fill: '#999'
end

v = SVG.new do
  polygon class: 'letter', points: %w[0,0 50,100 100,0]
end

i = SVG.new do
  rect class: 'letter', x: 0, y: 0, width: 40, height: 100
end

c = SVG.new do
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

t = SVG.new do
  polygon class: 'letter',
    points: %w[0,0 80,0 80,40 60 40 60,100 20,100 20,40 0,40]
end

o = SVG.new do
  circle class: 'letter', cx: 50, cy: 50, r: 50
  circle class: 'eye', cx: 30, cy: 30, r: 5
  line class: 'letter', x1: 0, y1: 50, x2: 50, y2: 50
end

r = SVG.new do
  path class: 'letter',
    d: %w[
      M 0,0 l 40,0
      a 30,30 0 1,1 0,60
      l 30,40
      L 0,100
      Z
    ]
  
  circle class: 'eye', cx: 40, cy: 30, r: 5
end

logo = SVG.new viewBox: viewbox, width: box.w, height: box.h
logo.css = {
  '.letter': { stroke: color, stroke_width: 3, fill: :none },
  '.eye': { stroke: color, stroke_width: 3, fill: color },
}

logo.build do
  append viewbox_reference if debug
  
  g(transform: 'translate(0 0)')   { append v }
  g(transform: 'translate(110 0)') { append i }
  g(transform: 'translate(160 0)') { append c }
  g(transform: 'translate(255 0)') { append t }
  g(transform: 'translate(345 0)') { append o }
  g(transform: 'translate(455 0)') { append r }
end

logo.save outfile
