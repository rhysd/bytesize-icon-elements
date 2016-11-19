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

- `<icon-activity></icon-activity>`
- `<icon-alert></icon-alert>`
- `<icon-archive></icon-archive>`
- `<icon-arrow-bottom></icon-arrow-bottom>`
- `<icon-arrow-left></icon-arrow-left>`
- `<icon-arrow-right></icon-arrow-right>`
- `<icon-arrow-top></icon-arrow-top>`
- `<icon-backwards></icon-backwards>`
- `<icon-ban></icon-ban>`
- `<icon-bell></icon-bell>`
- `<icon-book></icon-book>`
- `<icon-bookmark></icon-bookmark>`
- `<icon-calendar></icon-calendar>`
- `<icon-camera></icon-camera>`
- `<icon-caret-bottom></icon-caret-bottom>`
- `<icon-caret-left></icon-caret-left>`
- `<icon-caret-right></icon-caret-right>`
- `<icon-caret-top></icon-caret-top>`
- `<icon-cart></icon-cart>`
- `<icon-checkmark></icon-checkmark>`
- `<icon-chevron-bottom></icon-chevron-bottom>`
- `<icon-chevron-left></icon-chevron-left>`
- `<icon-chevron-right></icon-chevron-right>`
- `<icon-chevron-top></icon-chevron-top>`
- `<icon-clock></icon-clock>`
- `<icon-close></icon-close>`
- `<icon-code></icon-code>`
- `<icon-compose></icon-compose>`
- `<icon-creditcard></icon-creditcard>`
- `<icon-download></icon-download>`
- `<icon-edit></icon-edit>`
- `<icon-eject></icon-eject>`
- `<icon-ellipsis-horizontal></icon-ellipsis-horizontal>`
- `<icon-ellipsis-vertical></icon-ellipsis-vertical>`
- `<icon-end></icon-end>`
- `<icon-export></icon-export>`
- `<icon-external></icon-external>`
- `<icon-eye></icon-eye>`
- `<icon-file></icon-file>`
- `<icon-fire></icon-fire>`
- `<icon-flag></icon-flag>`
- `<icon-folder-open></icon-folder-open>`
- `<icon-folder></icon-folder>`
- `<icon-forwards></icon-forwards>`
- `<icon-gift></icon-gift>`
- `<icon-github></icon-github>`
- `<icon-heart></icon-heart>`
- `<icon-home></icon-home>`
- `<icon-import></icon-import>`
- `<icon-inbox></icon-inbox>`
- `<icon-info></icon-info>`
- `<icon-lightning></icon-lightning>`
- `<icon-link></icon-link>`
- `<icon-location></icon-location>`
- `<icon-lock></icon-lock>`
- `<icon-mail></icon-mail>`
- `<icon-menu></icon-menu>`
- `<icon-message></icon-message>`
- `<icon-minus></icon-minus>`
- `<icon-music></icon-music>`
- `<icon-mute></icon-mute>`
- `<icon-options></icon-options>`
- `<icon-paperclip></icon-paperclip>`
- `<icon-pause></icon-pause>`
- `<icon-photo></icon-photo>`
- `<icon-play></icon-play>`
- `<icon-plus></icon-plus>`
- `<icon-portfolio></icon-portfolio>`
- `<icon-print></icon-print>`
- `<icon-reload></icon-reload>`
- `<icon-reply></icon-reply>`
- `<icon-search></icon-search>`
- `<icon-send></icon-send>`
- `<icon-settings></icon-settings>`
- `<icon-star></icon-star>`
- `<icon-start></icon-start>`
- `<icon-tag></icon-tag>`
- `<icon-trash></icon-trash>`
- `<icon-twitter></icon-twitter>`
- `<icon-unlock></icon-unlock>`
- `<icon-upload></icon-upload>`
- `<icon-user></icon-user>`
- `<icon-video></icon-video>`
- `<icon-volume></icon-volume>`
- `<icon-work></icon-work>`
