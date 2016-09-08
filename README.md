Show some responsive notifications to your user, supporting 5 different states which are "default", "info", "success", "warn" and "danger".

Usage
=====

## Include
Include the CSS:

```html
<link rel="stylesheet" href="dist/toaster.css" type="text/css"></link>
```

Include the JS like this:

```html
<script src="dist/toaster.js" async></script>
```

The data attributes are optional.

The default values are 5000 for duration and "bottom left" for position.

## Call via JS

```javascript
µ.toaster("info", "Your important Message to the User", 2000)
```

First parameter is the state of the toast to create. NOT optional!
Second parameter is the message to appear inside the toast. NOT optional!
Third parameter is the duration for the toast to create. optional.

## Call via data-attributes
You can also call a toast via data attributes. The toast will appear on click. Elements can be injected asynchronous.

```html
<button
  data-toggle="toast"
  data-message="some string for the toast"
  data-priority="success"
  data-duration="2000">
  show success for 2 seconds
</button>
```
