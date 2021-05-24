---
layout: page
title: Daily DM
subtitle: The DM your eFriend sent you today
---

<style>
  /*
    Foreground: Discord.css, most elements ripped from the Discord application.
    Background: HLJS Solarized Dark (highlight.js solarized-dark) https://highlightjs.org, Original Style from ethanschoonover.com/solarized (c) Jeremy Hull <sourdrums@gmail.com>
  */

  .dm-container {
    position: relative;
    margin-bottom: 1rem;
    padding: 0.5em;
    width: 100%;
    display: block;
    border-radius: 10px;
    overflow-x: auto;

    color: #dcddde;
    background: #36393f;
    font-family: Whitney, Helvetica Neue, Helvetica, Arial, sans-serif;
    font-size: 1rem;
  }

  .dm-timestamp {
    position: absolute;
    bottom: 0;
    margin-bottom: 0.2rem;
    margin-left: 0.15rem;

    color: #72767d;
    font-size: 0.9rem;
  }

  .dm-credit {
    position: absolute;
    bottom: 0;
    right: 0;
    margin-bottom: 0.2rem;
    margin-right: 0.4rem;

    color: #72767d;
    font-size: 0.9rem;
  }

  .dm-attachment {
    position: absolute;
    bottom: unset;
    top: 0;
    margin-top: 0.2rem;
    margin-left: 0.075rem;
  }
  a.dm-attachment {
    color: #72767d !important;
    font-size: 0.9rem !important;
  }

  .dm-code {
    width: auto;
    height: auto;
    padding: .2em;
    margin: -.2em 0;
    border-radius: 3px;
    font-size: 85%;
    font-family: Consolas,Andale Mono WT,Andale Mono,Lucida Console,Lucida Sans Typewriter,DejaVu Sans Mono,Bitstream Vera Sans Mono,Liberation Mono,Nimbus Mono L,Monaco,Courier New,Courier,monospace;
    text-indent: 0;
    border: none;
    white-space: pre-wrap;
    font-size: 0.875rem;
    line-height: 1.125rem;
    text-indent: 0;
    white-space: pre-wrap;
    scrollbar-width: thin;
    scrollbar-color: var(--background-tertiary) var(--background-secondary);
    background: var(--background-secondary);
    border: 1px solid var(--background-tertiary);
  }

  .dm-mention {
    border-radius: 3px;
    padding: 0 2px;
    font-weight: 500;
    unicode-bidi: -moz-plaintext;
    unicode-bidi: plaintext;
    color: #7289da;
    background: rgba(114,137,218,.1);
    position: relative;
    margin: 0;
    padding: 0;
    border: 0;
    font-weight: inherit;
    font-style: inherit;
    font-family: inherit;
    font-size: 100%;
    vertical-align: baseline;
    text-rendering: optimizeLegibility;
    -webkit-transition: background-color 50ms ease-out,color 50ms ease-out;
    transition: background-color 50ms ease-out,color 50ms ease-out;
    cursor: pointer;
  }
  .dm-mention:hover {
    color: #fff;
    background-color: #7289da;
  }

  a {color: #3087e8;}
  .pt-emphasis {font-style: italic;}
  .pt-strong {font-weight: bold;}
</style>

<div align="center">
  <a href="feed.min.xml">
    <i style="font-size: 2rem; color: #ffa000;" class="fas fa-rss-square"></i>
  </a>
</div>

<!--
<div align="center" class="dm-container">
{{ message }}
<div class="dm-timestamp">Month 0, 0000</div>
<div class="dm-credit">—Author</div>
<div class="dm-attachment"><a class="dm-attachment" href="{{ link }}">attachment</a></div>
</div>
-->

<div align="center" class="dm-container">
that'll be all from The Daily DM. I thank any users who took time in reading or subscribing to it, but I'm switching to <a href="https://mastodon.online/@ethanmcbloxxer">Mastodon</a> for posting as of now.
<div class="dm-timestamp">Feb 21, 2021</div>
</div>

<div align="center" class="dm-container">
i've been working on a theme that resembles this very highly, so if you want to make your own website that looks like this than go to <br> <a href="https://ethanmcbloxxer.github.io/jekyll-theme-discord/">/jekyll-theme-discord/</a> <br> or <br> <a href="https://github.com/EthanMcBloxxer/jekyll-theme-discord#readme">the GitHub project</a>.
<div class="dm-timestamp">Feb 21, 2021</div>
</div>

<div align="center" class="dm-container">
Here are a few things I'd add to Markdown:<br>

<details>
  <summary>
    <span style="text-decoration: line-through">HTML</span>
  </summary>

  ~~HTML~~<br/>
  <span title="(&lt;s&gt; or &lt;del&gt;)">&lt;span style="text-decoration: line-through"&gt;</span><br/>
</details>

<details>
  <summary>
    <abbr title="Hypertext Markup Language">HTML</abbr>
  </summary>

  ?[HTML](Hypertext Markup Language)<br/>
  <span title="(&lt;span title=&quot;Hypertext Markup Language&quot;&gt;)">&lt;abbr&gt;</span><br/>
</details>

<details>
  <summary>
    <mark>HTML</mark>
  </summary>

  !=HTML=!<br/>
  <span title="(&lt;span style=&quot;background-color: #FFFF00&quot;&gt;)">&lt;mark&gt;</span><br/>
</details>

<details>
  <summary>
    <sub>HTML</sub>
  </summary>

  -^HTML^-<br/>
  &lt;sub&gt;<br/>
</details>

<details>
  <summary>
    <sup>HTML</sup>
  </summary>

  +^HTML^+<br/>
  &lt;sup&gt;<br/>
</details>

Also, <strong>REMOVE EVERY USAGE OF UNDERSCORES AND REPLACE THEM WITH UNDERLINES</strong>.

<div class="dm-timestamp">Feb 14, 2021</div>
</div>

<div align="center" class="dm-container">
You either die a hero, or you live long enough to see yourself become the villain.
<div class="dm-timestamp">Feb 12, 2021</div>
<div class="dm-credit">—Two-Face</div>
</div>

<div align="center" class="dm-container">
A lion has claws at the end of it's paws and a comma is a clause at the end of a pause
<div class="dm-timestamp">Feb 8, 2021</div>
<div class="dm-credit">—Hero's Quest / Quest For Glory 1</div>
</div>

<div align="center" class="dm-container">
I swear the more you think about 2048 the harder it gets
<div class="dm-timestamp">Feb 8, 2021</div>
</div>

<div align="center" class="dm-container">
Does the <strong>?q=</strong> in search engines mean "question" or "query"?
<div class="dm-timestamp">Feb 5, 2021</div>
</div>

<div align="center" class="dm-container">
<em>Illegally Activate</em><br>
🐧 Ubuntu 2.5.4<br>
<strong><em>FREE</em></strong>
<div class="dm-timestamp">Feb 2, 2021</div>
</div>

<div align="center" class="dm-container">
i hate things that remind me of my alarm
<div class="dm-timestamp">Feb 2, 2021</div>
</div>

<div align="center" class="dm-container">
what people really mean when they tell you "don't worry about the price" is "i think you've got a good sense of what a good budget is, pick something that's good to you and falls in that"
<div class="dm-timestamp">Feb 1, 2021</div>
</div>

<div align="center" class="dm-container">
when you know in which episodes all of the intro snippets are
<div class="dm-timestamp">Jan 31, 2021</div>
</div>

<div align="center" class="dm-container">
psychology is disappointing.
<div class="dm-timestamp">Jan 31, 2021</div>
</div>

<div align="center" class="dm-container">
how come in almost every other language, "bread"="pan"? why does english want "bread" to not be called "pan"? seriously, next time you eat bread, say it's pan. when asked what pan is, just say it's bread in spanish, french, portruguese, japanese, other-ese.
<div class="dm-timestamp">Jan 30, 2021</div>
</div>

<div align="center" class="dm-container">
once > one time, twice = two times, thrice < three times. also there's nothing more than that. just once, twice, thrice.
english is quite odd. why is thrice improper english?
<div class="dm-timestamp">Jan 27, 2021</div>
</div>

<div align="center" class="dm-container">
i just learned about microblogs and that's kinda what the daily dm is isn't it
<div class="dm-timestamp">Jan 25, 2021</div>
</div>

<div align="center" class="dm-container">
everyone complains about privacy<br/><br/>
everyone uses Chrome
<div class="dm-timestamp">Jan 23, 2021</div>
<div class="dm-credit">—siclucealucks</div>
</div>

<div align="center" class="dm-container">
you can't have regrets about anything for longer than <em>until something good happens in your life</em>.
<div class="dm-timestamp">Jan 23, 2021</div>
</div>

<div align="center" class="dm-container">
predictions of the future never ever turn out to be true.
<div class="dm-timestamp">Jan 24, 2021</div>
<div class="dm-credit">—Tom Scott</div>
</div>

<div align="center" class="dm-container">
sahara translates to desert, so the sahara desert is called desert desert. at least in arabic.
<div class="dm-timestamp">Jan 23, 2021</div>
</div>

<div align="center" class="dm-container">
italics are called italics because italy published their books <em>like this to conserve space</em>. we should all switch to <span class="dm-code">strong</span> and <span class="dm-code">emphasis</span>.
<div class="dm-timestamp">Jan 23, 2021</div>
</div>

<div align="center" class="dm-container">
why do i procrastinate this page its literally like 5 seconds to do
<div class="dm-timestamp">Jan 21, 2021</div>
</div>

<div align="center" class="dm-container">
embarrassment is garbage. you can either be frustrated or be embarrassed. whether or not you laugh it off is up to you, no matter which of the two you choose.
<div class="dm-timestamp">Jan 21, 2021</div>
</div>

<div align="center" class="dm-container">
isn't it great how humans can decide that they want to do something even if that something doesn't pose a gain for the individual?
<div class="dm-timestamp">Jan 21, 2021</div>
</div>

<div align="center" class="dm-container">
i try to understand how i develop as a human, and am doing a decent job.<br>
if that development gets in the way of how i behave, i brand that as my fault.<br>
sometimes it takes a lot of effort to change the way your brain is wired to think.
<div class="dm-timestamp">Jan 20, 2021</div>
</div>

<div align="center" class="dm-container">
Imagine Dragons' "Believer" is heavily overrated.
<div class="dm-timestamp">Jan 16, 2021</div>
</div>

<div align="center" class="dm-container">
Why isn't there an easy to learn language, without completely different word meanings? Like look at that! Word and World are completely different things, even though it's just one letter appended. Suffixes and prefixes are good, especially to understand the word. Imagine a language where each object has a prefix to determine what it is; object, person, etc. Semicolons and random grammar rules can die too. Person and I, Me and Person. The latter sounds better. The schwa sucks. Why is English, the language with decent ideas on how words shouldn't be gendered, the one to have such a meaningless pronounciation character?
<div class="dm-timestamp">Jan 11, 2021</div>
</div>

<div align="center" class="dm-container">
i dry things up too fast.<br>
got a show? done in a week.<br>
making a game? lost interest when i run into a hard hurdle.<br>
playing a game? beat the final boss after 5 days.<br>
very few things pique my interest so much that i stick with them. i have a bad imbalance of novelty and familiarity.
<div class="dm-timestamp">Jan 10, 2021</div>
</div>

<div align="center" class="dm-container">
you know your internet is bad when the speed test takes a couple minutes to connect
<div class="dm-timestamp">Jan 10, 2021</div>
<div class="dm-credit">—<span class="dm-mention">@MysticGaming</span></div>
</div>

<div align="center" class="dm-container">
1 goose, 2 geese, so 1 moose, 2 meese?
<div class="dm-timestamp">Jan 9, 2021</div>
</div>

<div align="center" class="dm-container">
Sponsors: <em>exist</em><br>
Nord VPN and Raid Shadow Legends:<br>
[view attachment]
<div class="dm-timestamp">Jan 9, 2021</div>
<div class="dm-credit">—<span class="dm-mention">@Aras</span></div>
<div class="dm-attachment"><a class="dm-attachment" href="https://cdn.discordapp.com/attachments/150074202727251969/797654404685103124/runmen.mp4">attachment</a></div>
</div>

<div align="center" class="dm-container">
grammatical articles most important for indian english speaker to learn and plural
<div class="dm-timestamp">Jan 9, 2021</div>
</div>

<div align="center" class="dm-container">
ecchi tagged anime that isnt ecchi is always amazing for some reason
<div class="dm-timestamp">Jan 9, 2021</div>
<div class="dm-credit">—Anonymous</div>
</div>

<div align="center" class="dm-container">
I just ordered a photo book google made of my fat dog on accident, I'm not canceling it<br>
33 pages of that animal wth
<div class="dm-timestamp">Jan 8, 2021</div>
<div class="dm-credit">—<span class="dm-mention">@𝕃𝕖𝕞𝕠𝕟</span></div>
<div class="dm-attachment"><a class="dm-attachment" href="https://media.discordapp.net/attachments/793474881907458068/797271116829425664/Screenshot_20210108-201038_Gmail.png">attachment</a></div>
</div>

<div align="center" class="dm-container">
something i envy about japanese is that they can just throw around a ton of characters and nobodyll bat an eye, like ayokumala, but in english, you cant just say aisdgjsdifgsdfug for a street name
<div class="dm-timestamp">Jan 8, 2021</div>
</div>

<div align="center" class="dm-container">
success isn't relative, but expectations are.
<div class="dm-timestamp">Jan 8, 2021</div>
</div>

<div align="center" class="dm-container">
what if everyone else in existence can read my mind and is confined to not act on it?
<div class="dm-timestamp">Jan 7, 2021</div>
</div>

<div align="center" class="dm-container">
fate seems to favor me. maybe you, too.
<div class="dm-timestamp">Jan 7, 2021</div>
</div>

<div align="center" class="dm-container">
im working on this project on <a href="https://ethanmcbloxxer.github.io/">https://ethanmcbloxxer.github.io/</a> where you can see a discord-type dm for every day, go check it out
<div class="dm-timestamp">Jan 7, 2021</div>
</div>

<div align="center" class="dm-container">
Nationwide is on your siiiideee
<div class="dm-timestamp">Jan 5, 2021</div>
</div>

<div align="center" class="dm-container">
p = b with more air
<div class="dm-timestamp">Jan 4, 2021</div>
</div>

<div align="center" class="dm-container">
why do the beatles sing about love so much?
<div class="dm-timestamp">Dec 29, 2020</div>
</div>

<div align="center" class="dm-container">
what if a band names themselves 🎵 and released a song called 🎶?
<div class="dm-timestamp">Dec 28, 2020</div>
</div>

<div align="center" class="dm-container">
lol = kinda funny not gonna laugh<br>
lmao = funnier and i mightve just smirked<br>
lmfao = *small chuckle*<br>
LMFAO = actually laughing really hard<br>
<div class="dm-timestamp">Dec 27, 2020</div>
</div>

<div align="center" class="dm-container">
whats life<br>
am i turning cynical<br>
or pro-cynical?<br>
i dont know why im here<br>
but i dont want it to stop<br>
<div class="dm-timestamp">Dec 26, 2020</div>
</div>

<div align="center" class="dm-container">
ive got this idea for a roblox game. imagine: crypto simulator.<br>
USD = RoCoin (ROC), and you can choose to be an investor or a miner... that would be amazing. your address could be your UserId > SHA256...
<div class="dm-timestamp">Dec 25, 2020</div>
</div>

<div align="center" class="dm-container">
i started watching naruto, てびよ
<div class="dm-timestamp">Dec 22, 2020</div>
</div>

<div align="center" class="dm-container">
opera gx can be a little annoying at times for the stupidest reasons that would only annoy me.
<div class="dm-timestamp">Dec 19, 2020</div>
</div>

<div align="center" class="dm-container">
ive got 21 pilots' "ride" stuck in my head, HEEEEEEELP
<div class="dm-timestamp">Dec 17, 2020</div>
</div>

<div align="center" class="dm-container">
some of my thoughts are surprisingly meaningful
<div class="dm-timestamp">Dec 12, 2020</div>
</div>
