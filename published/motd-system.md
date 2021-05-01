# Message of the Day System

Personally, I corrolate the term "MOTD" with the Minecraft Server configuration option, where you can specify a two-line description for your server. Hold that thought.

I recently implemented a "message-of-the-day" system on the homepage with JavaScript. Unfortunately, this doesn't actually do a different message for every day.

Originally, there was only one caption for "EthanMcBloxxer" on the homepage, which had a few of my known programming languages.

![Original Homepage Caption](/img/original-homepage.png)

I thought this was a bit bland, so I made up a list of possible messages that I could show users. Most of them are inspired from Minecraft's Splash Text, which was mainly because of my initial correlation.

If you'd like to implement something similar on your website, you can just make a table of the messages you want to display, then do

```js
const motds = [
    "Message of the Day 1",
    "Tacos are the best food",
    "hammertime",
    "Remember&colon; Escape special characters with entities&excl;",
    "<span style='color: #000'>Tags are also supported here</span>",
    // etc
];

document.getElementById("motd").innerHTML = motds[Math.floor(Math.random() * motds.length)];
```

and be sure the element you're changing the inner text of has the "motd" id specified.

Now, a quick rundown.

We're specifying a constant value of messages to be displayed and setting the text of `#motd` to the index of `motds` (the constant value earlier) where we take a random float from 0 to 1, multiply it by how many messages there are (which gets us something like 2.2953309766667616), and removing the decimal points from it (rounding down with `Math.floor`), which would return 2. Tacos are the best food.

I also used the code at the bottom inside an `onclick` attribute of `#motd`, so clicking the message will reroll and give you a new one.