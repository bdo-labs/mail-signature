
#
# Environment
#

SHELL:=/bin/bash
PATH:=node_modules/.bin:$(PATH)

#
# Targets
#

build: node_modules index.html

index.html: temp.html
	juice2 $< $@
	rm temp.html

temp.html: template/signature.md
	markdown $< | \
	cat template/head.html - template/tail.html > $@

node_modules: package.json
	npm install

clean:
	rm index.html

test: build
	open index.html

.PHONY: build test clean

