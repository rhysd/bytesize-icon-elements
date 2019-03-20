Custom Elements for Bytesize Icons
==================================

This package provides icons from [bytesize-icons](https://github.com/danklammer/bytesize-icons) as a [CustomElement](https://developers.google.com/web/fundamentals/getting-started/primers/customelements). The bytesize-icons package contains a lightweight, reasonable set of nice icons in the SVG format.

## Installation

```sh
$ npm install --save bytesize-icon-elements
```

## Usage

```html
<html>
  <body>
    This is search icon: <bytesize-icon name="search"></bytesize-icon>

    And this is a thin book icon: <bytesize-icon name="book" weight="thin"></bytesize-icon>

    And this is a gear icon with sharp edges: <bytesize-icon name="settings" style="miter"></bytesize-icon>

    Icon size is variable because it's SVG.

    This is a big flag icon: <bytesize-icon name="flag" size="64"></bytesize-icon>

    <script src="/path/to/bytesize-icon-elements/index.js"></script>
  </body>
</html>
```

Loading `bytesize-icon-elements/index.js` registers the `<bytesize-icon>` element. You can use it in your HTML directly.
If you want to use this package with older browsers, you may need [webcomponents.js](https://github.com/webcomponents/webcomponentsjs) as polyfill.

The following attributes are supported. The `name` attribute is mandatory, the others are optional.

| Name     | Description                                                                                                           | Default   |
|----------|-----------------------------------------------------------------------------------------------------------------------|-----------|
| `name`   | See the complete list below. It determines the `id` of the icon symbol. | |
| `weight`   | One of `ultra-light`, `thin`, `light`, `regular`, `medium`, `bold` and `heavy`. It determines `stroke-width` of the icon. | `regular` |
| `style`   | One of `round`, `bevel` and `miter`. It determines `stroke-linejoin` and `stroke-linecap` of the icon. | `round` |
| `size`  | Size (width and height) of the icon (in pixels). | `32` |

## Development

```sh
$ npm ci
$ npm run gen
$ npm test
```

## All Icons

You can inspect all icons on the [bytesize-icons repository page](https://github.com/danklammer/bytesize-icons#grab-n-go). The following icon names are supported: