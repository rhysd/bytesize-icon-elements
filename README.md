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

Default attribute values can be changed by the `BytesizeIcon.setDefaultAttributes` method, before the icon elements are constructed:

```js
BytesizeIcon.setDefaultAttributes({
  size: 64,
  style: 'miter',
  weight: 'bold'
});
```

## Development

```sh
$ npm ci
$ npm run gen
$ npm test
```

## All Icons

You can inspect all icons on the [bytesize-icons repository page](https://github.com/danklammer/bytesize-icons#grab-n-go). The following icon names are supported: "activity", "alert", "archive", "arrow-bottom", "arrow-left", "arrow-right", "arrow-top", "backwards", "bag", "ban", "bell", "book", "bookmark", "calendar", "camera", "caret-bottom", "caret-left", "caret-right", "caret-top", "cart", "checkmark", "chevron-bottom", "chevron-left", "chevron-right", "chevron-top", "clipboard", "clock", "close", "code", "compose", "creditcard", "desktop", "download", "edit", "eject", "ellipsis-horizontal", "ellipsis-vertical", "end", "export", "external", "eye", "file", "fire", "flag", "folder", "folder-open", "forwards", "gift", "github", "heart", "home", "import", "inbox", "info", "lightning", "link", "location", "lock", "mail", "menu", "message", "microphone", "minus", "mobile", "move", "music", "mute", "options", "paperclip", "pause", "photo", "play", "plus", "portfolio", "print", "reload", "reply", "search", "send", "settings", "sign-in", "sign-out", "star", "start", "tag", "telephone", "trash", "twitter", "unlock", "upload", "user", "video", "volume", "work".
