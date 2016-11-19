Custom Elements for Bytesize Icons
==================================

This package provides [bytesize-icons](https://github.com/danklammer/bytesize-icons) icons as [CustomElements](https://developers.google.com/web/fundamentals/getting-started/primers/customelements).
bytesize-icons are lightweight, reasonable set of nice icons with SVG format.


## Installation

```sh
$ npm install --save bytesize-icon-elements
```


## Usage

```html
<html>
  <body>
    This is search icon: <icon-search></icon-search>

    And this is a thin book icon: <icon-book type="thin"></icon-book>

    Icon size is variable because it's SVG.

    This is a big flag icon: <icon-flag width="64" height="64"></icon-flag>
  </body>
  <script src="/path/to/bytesize-icon-elements/index.js"></script>
</html>
```

Loading `bytesize-icon-elements/index.js` registers `<icon-*>` elements. You can use it in your HTML directly.
If you want to use this package with older browsers, you may need [webcomponents.js](https://github.com/webcomponents/webcomponentsjs) as polyfill.

Each icon has below optional properties.

| Name     | Description                                                                                                           | Default   |
|----------|-----------------------------------------------------------------------------------------------------------------------|-----------|
| `type`   | One of `ultra-light`, `thin`, `light`, `regular`, `medium`, `bold` and `heavy`. It determines `stroke-width` of icon. | `regular` |
| `width`  | Width of icon.                                                                                                        | `32`      |
| `height` | Height of icon.                                                                                                       | `32`      |


## Development

```sh
$ npm install
# Updates bytesize-icons if needed
$ npm run gen
$ git add -A
$ git commit -m "update something"
$ npm version x.y.z
```

## All Icons

