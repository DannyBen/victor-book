---
label: Overview
icon: home
order: 100
---

# Introduction to Victor

**Victor** is a lightweight, zero-dependencies Ruby library that lets you build
SVG images using Ruby code.

## Example

Building a Meter Bar with Victor.

+++ :icon-image: SVG Image
![](/examples/meter/meter.svg)
+++ :icon-ruby: Ruby Input
:::code source="/examples/meter/meter.rb" :::
+++ :icon-code: SVG Code
:::code source="/examples/meter/meter.svg" :::
+++

## How it works

Victor allows you to build SVG elements using plain Ruby. It translates any
method call it doesn’t recognize into an SVG tag, so calling methods like
`rect`, `circle`, or `line` automatically generates the corresponding SVG
tags.


### Key Features

||| Initialization

Create an SVG with attributes like `viewBox` or `style`.

||| :icon-ruby:

```ruby
svg = Victor::SVG.new viewBox: '0 0 100 100'
```

|||


||| SVG Elements

Add SVG elements with attributes by calling methods with the desired tag name.

||| :icon-ruby:

```ruby
svg.rect x: 0, y: 10, width: 100
```

|||

||| Nesting

Organize SVG elements hierarchically by nesting them within blocks.

||| :icon-ruby:

```ruby
svg.g transform: 'translate(10 10)' do
  svg.rect x: 10, y: 10
end
```

|||

||| Attributes and Inline Styling

Apply attributes and inline styles directly within the method call.

||| :icon-ruby:

```ruby
svg.rect style: {
  fill: :blue, font_family: 'Roboto'
}
```

|||

||| CSS

Define stylesheets using a hash.

||| :icon-ruby:

```ruby
svg.css['.box'] = { fill: :red }
```

|||

## Installation

Install Victor:

```shell
gem install victor
```

Optionally, if you want to work with the
[Victor Command Line Interface](/usage-patterns/cli/):

```shell
gem install victor-cli
```