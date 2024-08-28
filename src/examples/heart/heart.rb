require 'victor/script'

setup viewBox: '-10 -10 120 120'

build do
  mask id: 'heart' do
    rect x: 0, y: 0, width: 100, height: 100, fill: 'white'
    path d: 'M10,35 A20,20,0,0,1,50,35 A20,20,0,0,1,90,35 Q90,65,50,95 Q10,65,10,35 Z',
      fill: 'black'
  end

  polygon points: '-10,120 120,120 120,-10', fill: :orange
  circle cx: 50, cy: 50, r: 50, mask: 'url(#heart)', fill: :red
end

save 'heart'
