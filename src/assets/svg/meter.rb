led_width = 10
led_gap = 2
total_width = 10 * (led_width + led_gap) + 8

setup viewBox: "0 0 #{total_width} 40"

build do
  # Frame
  rect x: 2, y: 2, width: total_width - 4, height: 26,
    rx: 4, fill: 'none', stroke: '#666'

  # Leds
  x = 5
  10.times do |i|
    opacity = i < 7 ? 1 : 0.3
    rect x: x, y: 5, width: led_width, height: 20,
      rx: 3, fill: 'green', fill_opacity: opacity

    x += led_width + led_gap
  end
end
