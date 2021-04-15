---
layout: page
title: Privacy
subtitle: Privacy Policy
permalink: /privacy.html
comments: true
js: "/assets/js/details-polyfill.js"
---

We use [Amplitude Analytics](https://amplitude.com). It collects your country (such as The US), language (such as English), and OS platform/carrier (such as Windows or iPhone/Verizon) anonymously. This data is only kept on Amplitude's servers for 90 days, then removed. It does also create a [cookie](https://www.allaboutcookies.org) with your device ID and another encrypted string (and possibly other cookies). You can use [Do Not Track](http://www.w3.org/TR/tracking-dnt/) and [Global Privacy Control](https://globalprivacycontrol.org/) to opt-out, as we only load the analytics with both of these disabled. You can also use the "do not track" button in the footer, or do `amplitude.getInstance().setOptOut(true);` in the console. You can enable Do Not Track with these methods:

<details>
<summary>Chrome and Chromium-based browsers, like Opera and Brave</summary>

Step 1: Open your <a href="chrome://settings/cookies#doNotTrack">settings page</a><br>
Step 2: Turn on <strong>Send a "Do not track" request with your browsing traffic</strong><br>
<img src="/assets/img/embed/dnt-chrome.png"/>

</details>


<details>
<summary>Chromium Package</summary>

Step 1: Open your <a href="chrome://settings/privacy">settings page</a><br>
Step 2: Click <strong>More</strong><br>
Step 3: Turn on <strong>Send a "Do Not Track" request with your browsing traffic</strong><br>
<img src="/assets/img/embed/dnt-chromium.png/>

</details>


<details>
<summary>Firefox and Firefox Profiles, like Tor Browser</summary>

Step 1: Open your <a href="about:preferences#privacy">settings page</a><br>
Step 2: Scroll down to <strong>Send websites a "Do Not Track" signal that you don't want to be tracked</strong><br>
Step 3: Toggle <strong>Always</strong><br>
<img src="/assets/img/embed/dnt-firefox.png"/>

</details>


<details>
<summary>Microsoft Edge</summary>

Step 1: Open your <a href="edge://settings/privacy">settings page</a><br>
Step 2: Scroll down to <strong>Privacy</strong><br>
Step 3: Turn on <strong>Send "Do Not Track" requests</strong><br>
<img src="/assets/img/embed/dnt-edge.png"/>

</details>


<details>
<summary>Internet Explorer</summary>

Step 1: Click on the gear near the top right<br>
Step 2: Hover over <strong>Safety</strong><br>
Step 3: Click <strong>Turn on Do Not Track requests</strong><br>
<img src="/assets/img/embed/dnt-ie.png"/>

</details>


<details>
<summary>Other Browsers</summary>

We don't have every browser here, so please look up how to turn on Do Not Track requests for your browser, or look in its settings. If you can't find anything about it, try setting <code>navigator.doNotTrack</code> to <code>"1"</code> in its source code or flag settings.

</details>

And to turn on Global Privacy Control, go to the [official website](https://globalprivacycontrol.org/#download) and download one of the supporting extensions or browsers. Like Do Not Track, you can also set `navigator.globalPrivacyControl` to `"1"` if none of these extensions or browsers appeal to you.

As of right now, deleting your data prior to the 90-day expiration is only possible with your Amplitude ID or aDevice ID. If you have it, then you can email `ethanmcbloxxer@protonmail.com` with the topic "Delete my Amplitude data" and the message containing your Amplitude ID or aDevice ID. Please also specify whether the message contains your Amplitude ID or aDevice ID. If you don't have it, you can retrieve your aDevice ID by opening the site's cookies and looking at the part of the cookie beginning with `amp` before a period.

![preview showing the cookie menu with the part before period highlighted](/assets/img/embed/privacy-cookie-menu.png)


Plus, by using the Dark Mode Toggle, we store a cookie called `dark` on your device. This is to make sure that every page you go to afterward is also dark. This is not deleted when you change back to light mode, but it becomes `false` instead.

##### Last revised on 19th January, 2021
For revision notifications, you can use [this RSS feed](/privacy-updates.xml).
