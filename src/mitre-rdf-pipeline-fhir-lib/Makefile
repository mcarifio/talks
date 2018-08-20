%.md.html : %.md
	pandoc -t revealjs -s -o $@ $< -V revealjs-url=../../slides/reveal.js

md := $(shell echo *.md) 
html := $(patsubst %.md, %.md.html,$(md))

all: $(html)

target := www-data@do:html/mike.carif.io/html/talks/slides/mitre-rdf-pipeline-fhir-lib
pub: $(html)
	rsync -ravuc -e ssh *.jpg ${html} ${md} $(MAKEFILE) ${target}


