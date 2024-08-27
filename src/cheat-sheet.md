---
label: Cheat Sheet
icon: paste
---

# Cheat Sheet

## Initializing

||| Ruby Input
```ruby
# 1. Default attributes
svg = Victor::SVG.new


# 2. Any attribute
svg = Victor::SVG.new viewBox="0 0 100 100",
  style: { background: :lime }



# 3. Initialize and build
svg = Victor::SVG.new viewBox: '0 0 100 100' do
  rect x: 0, y: 0, width: 100, height: 100,
    fill: :lime, rx: 10
end
```

||| SVG Output
```svg
<!-- 1 -->
<svg width="100%" height="100%">


<!-- 2 -->
<svg viewBox="0 0 100 100"
  width="100%" height="100%"
  style="background:lime">


<!-- 3 -->
<svg viewBox="0 0 100 100"
  width="100%" height="100%">

  <rect x="0" y="0" width="100" height="100"
    fill="lime" rx="10"/>

</svg>
```
|||


## SVG tags

||| Ruby Input
```ruby
# 1. Anything
svg.anything


# 2. Any attribute
svg.rect x: 0, y: 10


# 3. Using #element
svg.element :rect, x: 3, y: 4


# 4. Using #build
svg.build do
  rect x: 0, y: 10
  circle cx: 10, cy: 10
end
```

||| SVG Output
```svg
<!-- 1 -->
<anything />


<!-- 2 -->
<rect x="0" y="10"/>


<!-- 3 -->
<rect x="3" y="4"/>


<!-- 4 -->
<rect x="0" y="10"/>
<circle cx="10" cy="10"/>
```
|||


## Nesting

||| Ruby Input
```ruby
# 1. Using a block
svg.g transform: 'translate(10 10)' do
  svg.rect x: 10, y: 10
end


# 2. Using the first argument
svg.text 'Hello',
  font_family: 'JetBrains Mono'



# 3. Using tag-less node
svg.build do
  text font_family: 'Roboto' do
    _ 'Hello'
  end
end
```

||| SVG Output
```svg
<!-- 1 -->
<g transform="translate(10 10)">
  <rect x="10" y="10"/>
</g>


<!-- 2 -->
<text font-family="JetBrains Mono">
  Hello
</text>


<!-- 3 -->
<text font-family="Roboto">
  Hello
</text>



```
|||


## Attributes

||| Ruby Input
```ruby
# 1. underscore => hyphen
svg.text font_family: 'Roboto'


# 2. string/symbol => string
svg.path d: 'M0 0 h80 L40 100'
svg.rect fill: :blue


# 3. array => space-delimited string
svg.path d: ['M0', '0', 'h80', 'L40', '100']


# 4. hash => style string
svg.rect style: { fill: :blue, stroke: :red }
```


||| SVG Output
```svg
<!-- 1 -->
<text font-family="Roboto">


<!-- 2 -->
<path d="M0 0 h80 L40 100"/>
<rect fill="blue"/>


<!-- 3 -->
<path d="M0 0 h80 L40 100"/>


<!-- 4 -->
<rect style="fill:blue; stroke:red"/>

```
|||


## CSS

||| Ruby Input
```ruby
# 1. Hash keys
svg.css['.box'] = { fill: :red }






# 2. Full hash assignment
svg.css = {
  '.box': {
    fill: :red
  }
}


# 3. String
svg.css = <<~CSS
  .box: {
    fill: magenta
  }
}
CSS
```


||| SVG Output
```svg
<!-- 1 -->
<style>
  .box {
    fill: red;
  }
</style>


<!-- 2 -->
<style>
  .box {
    fill: red;
  }
</style>


<!-- 3 -->
<style>
  .box {
    fill: magenta;
  }
</style>
```
|||
