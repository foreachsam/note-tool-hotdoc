

default: doc
.PHONY: default


doc: doc-clean build
	cp src/build/html doc -a
.PHONY: doc

doc-clean:
	rm -rf doc
.PHONY: doc-clean


build:
	cd src && hotdoc run
.PHONY: build

build-clean:
	rm -rf src/build
	rm -rf src/hotdoc-private*
.PHONY: build-clean


clean: build-clean doc-clean
.PHONY: clean


serve:
	php -S localhost:8080
.PHONY: serve
