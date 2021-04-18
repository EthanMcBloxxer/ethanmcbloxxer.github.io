---
layout: page
title: Browser Information
subtitle: User Agent, Name, Code, Language, etc.
---

<p class="box-warning"><strong>Warning:</strong> By accessing this page, you allow us to use the data provided to us by your browser. Rest assured, we don't save any of it.</p>

<p/>
<h2>navigator</h2>
<dl id="info"></dl>
<style>dd {margin-left: 0.8rem; font-size: 1.2rem;}</style>

<script>
var txt = "";
txt += "<dt>Browser Code Name</dt><dd>" + navigator.appCodeName + "</dd>";
txt += "<dt>Browser Name</dt><dd>" + navigator.appName + "</dd>";
txt += "<dt>Browser Version</dt><dd>" + navigator.appVersion + "</dd>";
txt += "<dt>Cookies Enabled</dt><dd>" + navigator.cookieEnabled + "</dd>";
txt += "<dt>Browser Language</dt><dd>" + navigator.language + "</dd>";
txt += "<dt>Browser Online</dt><dd>" + navigator.onLine + "</dd>";
txt += "<dt>Platform</dt><dd>" + navigator.platform + "</dd>";
txt += "<dt>User-Agent</dt><dd>" + navigator.userAgent + "</dd>";
document.getElementById("info").innerHTML = txt;
</script>
