---
author: Mike Carifio <mike@carif.io>
title: Slides on Slides
date: 2018-08-08
keywords: talks,slides,reveal.js,pandoc
---

# Slides on Slides

Let's make a talk!


# Use The `src`, Luke

* Create a slide deck in [markdown]()

* Create the final format using [pandoc](https://www.pandoc.org/) ...

* With the [reveal.js]() plugin ...

* With the magic command:

  ```bash
  pandoc -t revealjs -s -o slides-on-slides.md.html slides-on-slides.md -V revealjs-url=../../slides/reveal.js
  ```

* `slides-on-slides.html` is the "compiled" result, suitable for any web-browser


# Publish 'Em

* You will need a "publicly visible" machine with:

  - ssh access
  
  - rsync installed (optional)
  
  - a webserver such as [nginx](https://nginx.org/en/) or [apache](https://httpd.apache.org/). Any webserver will serve.
  
* The slide show is completely browser based. Just get the html file to the server:

  ```bash
  rsync -ravuc -e ssh slides-on-slides.html www-data@www.domain_name.com:html/slides
  ```

* ... and then browse the resource `http://www.domain_name.com/slides/slides-on-slides.html`
