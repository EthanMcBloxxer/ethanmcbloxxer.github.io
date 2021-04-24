# Wikitweaks

*A UserCSS for Wikipedia*

I've been looking around at [userstyles.org](https://userstyles.org/) and decided to make my own Wikipedia custom stylesheet. It's not as cool as [n0x's Wikipedia Material Design](https://userstyles.org/styles/119976/wikipedia-material-design) (which I highly recommend for a more modern Wikipedia), but it'll do the job if you hate serif fonts. The below code may update at any time, and I didn't make it into an updating userstyle. Updates probably won't be that significant, though.

```css
body {
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	background: #fff !important;
}
p {
	font-weight: 500 !important;
	line-height: 1.9 !important;
	font-family: Calibri !important;
}
#siteSub {
	visibility: hidden;
}
h2 {
	border: 0px !important;
	font-family: 'Arial' !important;
	font-weight: 400 !important;
	font-size: 26px !important;
}
#p-personal .vector-menu-content-list {
	display: none;
}
.mw-body h1,
.mw-body-content h1 {
	font-size: 2em;
	font-family: Leelawadee !important;
}
.infobox td,
.infobox th {
	background-color: unset !important;
}
#mw-page-base {
	background-color: unset !important;
	background-image: unset !important;
	background-position: bottom left;
	height: 5em;
}
.mw-editsection-bracket {
	display: none !important;
}
:not(:checked) > .toctogglespan:before {
    content: '';
}
:not(:checked) > .toctogglespan:after {
    content: '';
}
```

Anyways, here's what it does:

1. Remove color backgrounds from infobox
2. Remove \[ edit ] and \[hide]/\[show] brackets
3. Smoother font (Calibri + Leelawadee)
4. Bigger line-spacing
5. Remove upper gradient
6. Hide "From Wikipedia, the free encyclopedia" watermark
