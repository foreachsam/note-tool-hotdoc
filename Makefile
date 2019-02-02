

default: doc
.PHONY: default


doc: doc-clean build
	cp src/build/html doc -a
.PHONY: build

doc-clean:
	rm -rf doc
.PHONY: doc-clean


build:
	cd src && hotdoc run
.PHONY: build

build-clean:
	rm -rf src/build
	rm -rf src/hotdoc-private*
.PHONY: build


clean: build-clean doc-clean


serve:
	php -S localhost:8080
