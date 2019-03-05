#!/usr/bin/env bash

## https://hotdoc.github.io/the-markdown-pages.html
## https://hotdoc.github.io/the-configuration-file.html

main_create_project_dir () {
	mkdir -p note/markdown
}


main_cd_project_dir () {
	cd note
}


main_create_subpage_markdown () {

cat > markdown/subpage.markdown << EOF
---
short-description: Just a subpage
...

# My subpage

Using *some* **random** \`CommonMark\` [syntax](http://spec.commonmark.org/)

You may want to go back to [the index](index.markdown) now?

EOF

}


main_create_index_markdown () {

cat > markdown/index.markdown << EOF
# My project

EOF

}

main_create_sitemap_txt () {

cat > sitemap.txt << EOF
index.markdown
	subpage.markdown

EOF

}

main_create_hotdoc_json () {

	hotdoc --project-name "simplest-example" --project-version "0.1" --index markdown/index.markdown --sitemap sitemap.txt --output built_doc conf

	cat hotdoc.json

}

main_build () {

	hotdoc run

	# tree built_doc
	# tree hotdoc-private-simplest-example-0.1
}

main_view () {

firefox built_doc/html/index.html

}



__main__ () {
	main_create_project_dir
	main_cd_project_dir

	main_create_subpage_markdown
	main_create_index_markdown
	main_create_sitemap_txt
	main_create_hotdoc_json

	main_build
	main_view
}

__main__
