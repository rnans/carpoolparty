<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Animated Letters | Demo 1 | Codrops</title>
		<meta name="description" content="Demo 1 of the letters.js plugin for animating SVG letters creatively." />
		<meta name="keywords" content="letters.js, plugin, SVG, letter, animation, segment, web design, demo" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		
		
		
		<link rel="stylesheet" type="text/css" href="/final02/CSS/dialog-sally.css" />
		<link rel="stylesheet" type="text/css" href="/final02/CSS/dialog.css" />
		<link rel="stylesheet" type="text/css" href="/final02/CSS/font-awesome.min.css"/>
		
		
		
		
		
		
		
<style>
@font-face {
	font-family: 'codropsicons';
	font-weight: normal;
	font-style: normal;
	src: url('../fonts/codropsicons/codropsicons.eot');
	src: url('../fonts/codropsicons/codropsicons.eot?#iefix') format('embedded-opentype'), url('../fonts/codropsicons/codropsicons.woff') format('woff'), url('../fonts/codropsicons/codropsicons.ttf') format('truetype'), url('../fonts/codropsicons/codropsicons.svg#codropsicons') format('svg');
}

@font-face {
	font-family: 'knarfart';
	font-weight: normal;
	font-style: normal;
	src: url('../fonts/knarfart/knarfart-webfont.eot');
	src: url('../fonts/knarfart/knarfart-webfont.eot?#iefix') format('embedded-opentype'), url('../fonts/knarfart/knarfart-webfont.woff2') format('woff2'), url('../fonts/knarfart/knarfart-webfont.woff') format('woff'), url('../fonts/knarfart/knarfart-webfont.ttf') format('truetype'), url('../fonts/knarfart/knarfart-webfont.svg#knarfart') format('svg');
}

@font-face {
	font-family: 'morse_coderegular';
	font-weight: normal;
	font-style: normal;
	src: url('../fonts/morse/m0rse-webfont.eot');
	src: url('../fonts/morse/m0rse-webfont.eot?#iefix') format('embedded-opentype'), url('../fonts/morse/m0rse-webfont.woff2') format('woff2'), url('../fonts/morse/m0rse-webfont.woff') format('woff'), url('../fonts/morse/m0rse-webfont.ttf') format('truetype'), url('../fonts/morse/m0rse-webfont.svg#morse_coderegular') format('svg');
}

*,
*::after,
*::before {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

body {
	font-family: 'Avenir Next', Avenir, 'Helvetica Neue', Helvetica, Arial, sans-serif;
	counter-reset: gridcounter;
	color: #3e3d47;
	background: #1e1d23;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

a {
	text-decoration: none;
	color: #aaa;
	outline: none;
}

a:hover,
a:focus {
	color: #fff;
	outline: none;
}

.hidden {
	position: absolute;
	left: -100vw;
	width: 0;
	height: 0;
}

.container {
	position: relative;
	overflow: hidden;
}

.codrops-header {
	position: relative;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	overflow: hidden;
	padding: 3.5em 1em 1em;
	text-align: center;
	text-align: center;
}

.demo-1 .codrops-header {
	height: calc(100vh - 40px);
	margin: 20px 20px 20px;
	padding: 2em 1em 4em;
	background: url(../img/mouse.svg) no-repeat left 50% bottom 40px;
}

.deco {
	font-family: 'knarfart', cursive;
	font-size: 90vw;
	line-height: 110vh;
	position: absolute;
	z-index: -1;
	top: 0;
	left: 0;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	overflow: hidden;
	width: 100%;
	height: 100%;
	pointer-events: none;
	color: rgba(0, 0, 0, 0.06);
	background: #23222a;
}

.codrops-header h1 {
	font-size: 2.35em;
	font-weight: 400;
	line-height: 1;
	margin: 0;
	padding: 0.85em 0 0;
	letter-spacing: 0.5em;
	word-spacing: -0.3em;
	text-transform: uppercase;
	color: #e65454;
}

.demo-1 .codrops-header h1 {
	font-size: 3.35em;
}

.codrops-header p {
	font-weight: 500;
	margin: 2em 0 0;
}

.info {
	color: #e65454;
}


/* Top Navigation Style */

.codrops-links {
	line-height: 1;
	position: relative;
	display: inline-block;
	text-align: center;
	white-space: nowrap;
}

.codrops-links::after,
.codrops-demos a:not(:last-child)::after {
	content: '';
	position: absolute;
	top: 0;
	left: 50%;
	width: 1px;
	height: 100%;
	background: rgba(255, 255, 255, 0.1);
	-webkit-transform: rotate3d(0, 0, 1, 22.5deg);
	transform: rotate3d(0, 0, 1, 22.5deg);
}

.codrops-icon {
	display: inline-block;
	width: 1.5em;
	margin: 0.15em 0.5em;
	text-decoration: none;
}

.codrops-icon span {
	display: none;
}

.codrops-icon::before {
	font-family: 'codropsicons';
	font-weight: normal;
	font-style: normal;
	font-variant: normal;
	line-height: 1;
	margin: 0 5px;
	text-transform: none;
	speak: none;
	-webkit-font-smoothing: antialiased;
}

.codrops-icon--drop::before {
	content: '\e001';
	color: #1b5baf;
}

.codrops-icon--prev::before {
	content: '\e004';
}


/* Demo links */

.codrops-demos {
	font-size: 0.95em;
	font-weight: bold;
	line-height: 1;
	margin: 2em 0 0 0;
}

.codrops-demos a {
	position: relative;
	display: inline-block;
	padding: 0 0.5em;
	pointer-events: auto;
}

.codrops-demos a:not(:last-child)::after {
	left: calc(100% + 0.5em);
}

.codrops-demos a:not(:last-child) {
	margin: 0 1em 0.1em 0;
}

.codrops-demos a.current-demo {
	color: #504f55;
}


/* List */

.list {
	margin: 0;
	padding: 0;
	list-style: none;
}

.list__item {
	position: relative;
	z-index: 1;
	overflow: hidden;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	max-width: calc(100vw - 40px);
	height: calc(100vh - 40px);
	min-height: 460px;
	margin: 20px;
	padding: 100px 0;
	text-align: center;
	background: #ddd;
}

.list__gap {
	min-height: 0;
	height: auto;
	text-align: center;
	font-weight: bold;
	padding: 1em 0;
}

.list__item--burst .list__text div svg {
	/* fox for mo.js */
	left: 0;
}

.list__text {
	position: relative;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	max-width: 90%;
	pointer-events: none;
}

.list__item p {
	font-size: 1.5em;
	font-weight: bold;
	color: #777;
}

.control__button {
	-webkit-flex: none;
	-ms-flex: none;
	flex: none;
	width: 2em;
	height: 2em;
	margin: 3em 0 0;
	z-index: 100;
	padding: 0;
	border: 0;
	background: none;
	-webkit-transition: opacity 0.3s;
	transition: opacity 0.3s;
	-webkit-tap-highlight-color: rgba(0,0,0,0);
}

.control__button--active {
	pointer-events: none;
	opacity: 0;
}

.js .control__button:focus,
.js .control__button:active {
	outline: none;
}

.control__vector {
	width: 100%;
	height: 100%;
	fill: rgba(0, 0, 0, 0.12);
}


/* Background colors */

.color-1 {
	background: #91a7d0;
}

.color-2 {
	background: #f6cac9;
}

.color-3 {
	background: #3d3d40;
}

.color-4 {
	background: #615e5f;
}

.color-5 {
	background: #3f51b5;
}

.color-6 {
	background: #403f6f;
}

.color-7 {
	background: #bec6d5;
}

.color-8 {
	background: #ffef67;
}

.color-9 {
	background: #f0eee9;
}

.color-10 {
	background: #e890bb;
}

.color-11 {
	background: #23222a;
}

.color-12 {
	background: #8788c5;
}


/* Grid */

.grid {
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-flex-wrap: wrap;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	max-width: 1300px;
	margin: 3em auto 0;
	padding: 1em;
	list-style: none;
}

.grid__item {
	position: relative;
	-webkit-flex: 1 1 280px;
	-ms-flex: 1 1 280px;
	flex: 1 1 280px;
	width: 25%;
	padding: 1.25em;
	-webkit-tap-highlight-color: rgba(0,0,0,0);
}

.grid__item::before {
	content: '';
	position: absolute;
	top: 0%;
	left: 50%;
	width: 10px;
	height: 100%;
	background: #1e1d23;
	-webkit-transform: rotate3d(0, 0, 1, 40deg);
	transform: rotate3d(0, 0, 1, 40deg);
}

.grid__inner {
	position: relative;
	padding: 1em;
	cursor: pointer;
	background: #23222a;
}

.grid__inner::before {
	content: attr(data-morse);
	font-family: 'morse_coderegular', sans-serif;
	font-size: 13em;
	font-weight: normal;
	line-height: 0.7;
	position: absolute;
	top: 0;
	left: 60px;
	padding: 0 0.15em 0 0;
	color: #1e1d23;
}

.grid__inner::after {
	content: attr(data-phonetic);
	font-family: 'Lucida Sans Typewriter', 'Lucida Console', monaco, 'Bitstream Vera Sans Mono', monospace;
	font-size: 1.15em;
	font-weight: normal;
	position: absolute;
	right: 1em;
	bottom: 0;
	color: #1e1d23;
	-webkit-transform: rotate3d(0, 0, 1, 90deg);
	transform: rotate3d(0, 0, 1, 90deg);
	-webkit-transform-origin: 100% 50%;
	transform-origin: 100% 50%;
}

.grid__text {
	font-weight: bold;
	line-height: 40px;
	position: relative;
	display: block;
	width: 40px;
	height: 40px;
	text-align: center;
	vertical-align: middle;
	color: #e65454;
	border-radius: 50%;
	background: #1e1d23;
}

.grid__heading {
	font-family: 'knarfart', sans-serif;
	font-size: 8em;
	line-height: 200px;
	position: relative;
	z-index: 10;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	width: 100%;
	margin: 0.5em 0;
	letter-spacing: -0.15em;
}

.grid__heading .letter {
	margin: 0 0.05em;
}


/* Related demos */

.content--related {
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-flex-wrap: wrap;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	-webkit-align-content: center;
	-ms-flex-line-pack: center;
	align-content: center;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
	padding: 10em 1em 6em;
	text-align: center;
}

.demo-1 .content--related {
	max-width: calc(100vw - 40px);
	height: calc(100vh - 40px);
	min-height: 460px;
	margin: 20px;
	padding: 3em 1em;
	background: #23222a;
}

.content--related p {
	width: 100%;
}

.media-item {
	display: inline-block;
	padding: 1em;
	vertical-align: top;
	-webkit-transition: color 0.3s;
	transition: color 0.3s;
}

.media-item__img {
	max-width: 100%;
	opacity: 0.3;
	-webkit-transition: opacity 0.3s;
	transition: opacity 0.3s;
}

.media-item:hover .media-item__img,
.media-item:focus .media-item__img {
	opacity: 1;
}

.media-item__title {
	font-size: 1em;
	margin: 0;
	padding: 0.5em;
}

body #cdawrap {
	top: 30px;
	right: 30px;
	background: rgba(0,0,0,0.2);
	font-family: 'Avenir Next', Avenir, 'Helvetica Neue', Helvetica, Arial, sans-serif;
}

body #cdawrap .carbon-text {
	color: #fff;
}

@media screen and (max-width: 50em) {
	.demo-1 .codrops-header {
		background: none;
	}
	.demo-1 .codrops-header h1 {
		font-size: 8vw;
	}
	.grid__item {
		width: 100%;
	}
}

@media screen and (max-width: 40em) {
	.codrops-header h1 {
		font-size: 1.85em;
	}
}




</style>
<script type="text/javascript">
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-7243260-2']);
_gaq.push(['_trackPageview']);
(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
</script>

		<!--[if IE]>
			<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<script>
			document.documentElement.className = 'js';
		</script>
		<script src="js/segment.min.js"></script>
		<script src="js/d3-ease.v0.6.js"></script>
		<script src="js/letters.js"></script>
	</head>
	<body class="demo-1">
		<!-- SVG icons -->
		<svg class="hidden">
			<symbol id="icon-play" viewBox="0 0 60 60">
				<path d="m53.48 27.435l-42.807-26.52c-3.119-2.047-5.672-.541-5.672 3.346v51.48c0 3.885 2.553 5.391 5.672 3.346l42.807-26.52c0 0 1.521-1.07 1.521-2.566s-1.521-2.566-1.521-2.566" />
			</symbol>
		</svg>
		<!-- /SVG icons -->
		<div class="container">
			<header class="codrops-header">
				<div class="deco" aria-hidden="true">o</div>
				<div class="codrops-links">
					<a class="codrops-icon codrops-icon--prev" href="http://tympanus.net/Development/Animocons/" title="Previous Demo"><span>Previous Demo</span></a>
					<a class="codrops-icon codrops-icon--drop" href="http://tympanus.net/codrops/?p=26057" title="Back to the article"><span>Back to the Codrops article</span></a>
				</div>
				<h1>Animated Letters</h1>
				<p>An artistically animated SVG font using the <a href="https://github.com/lmgonzalves/segment">Segment</a> library.</p>
				<nav class="codrops-demos">
					<a class="current-demo" href="index.html">Examples</a>
					<a href="index2.html">Alphabet</a>
				</nav>
			</header>
			<section class="content">
				<ul class="list">
				
					<li class="list__item color-5">
						<h3 class="list__text">sawbwa</h3>
						<button class="control__button control__button--play" aria-label="Trigger animation">
							<svg class="control__vector" aria-hidden="true" role="img" viewBox="0 0 60 60">
								<use xlink:href="#icon-play"></use>
							</svg>
						</button>
					</li>
				</ul>
				
				
				
				
				
				
				
					
			</section>
			<!-- Related demos -->
			<section class="content content--related">
				<p>If you enjoyed this demo you might also like:</p>
				<a class="media-item" href="http://tympanus.net/Development/TextStylesHoverEffects/">
					<img class="media-item__img" src="img/related/LinkStylesHoverEffects.jpg">
					<h3 class="media-item__title">Text Styles &amp; Hover Effects</h3>
				</a>
				<a class="media-item" href="http://tympanus.net/Development/InlineAnchorStyles/">
					<img class="media-item__img" src="img/related/InlineLinkStyles.png">
					<h3 class="media-item__title">Inline Anchor Styles</h3>
				</a>
			</section>
		</div>
		<!-- /container -->
		<script>
		(function() {
			var decoLetter = new Letters(document.querySelector('.deco'), {	
				size: 1000,
				weight: 5,
				color: '#212028',
				//color: '#63646B',
				duration: 2,
				fade:0,
				easing: d3_ease.easeExpOut.ease
			});
			decoLetter.hideInstantly();
			setTimeout(function() {
				decoLetter.show();
			}, 1000);
		})();
		</script>
		<script src="js/mo.min.js"></script>
		<script src="js/demo-1.js"></script>
		

<!-- For the demo ad only -->   


	</body>
</html>
