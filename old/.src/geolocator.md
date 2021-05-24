---
layout: page
title: Geolocator
subtitle: "Your Coordinates:"
---

<p class="box-warning"><strong>Warning:</strong> By accessing this page, you allow us to use the location data provided to us by your browser. Rest assured, we don't save any of it.</p>

<p id="coordinates" align="center"></p>
<script>
  var x = document.getElementById("coordinates");

  navigator.geolocation.getCurrentPosition(func);
  function func(pos) {
    x.innerHTML = "Latitude: " + pos.coords.latitude + "<br>Longitude: " + pos.coords.longitude;
  }
</script>

How do we do this? Well, a special function: `navigator.geolocation`. First, we have a JavaScript statement to figure out if the browser supports geolocation:
```javascript
if (navigator.geolocation) {
  // We'll come back to this in a second
} else {
  document.body.innerHTML = "Geolocation is not supported by this browser.";
}
```
In the commented-out code, this is how we know that the browser supports geolocation.

Now, because of `navigator.geolocation`, we're able to display the position via a function.

```javascript
navigator.geolocation.getCurrentPosition(showPos);

function showPos(pos) {
  document.body.innerHTML = pos.coords.latitude +
  "<br>Longitude: " + pos.coords.lonitude;
}
```

If you don't understand, there's a [w3schools tutorial](https://www.w3schools.com/html/html5_geolocation.asp) for it.
