#!/bin/sh

export XSL=/Users/gog/Development/xml2pdf/docbook-xsl-1.75.0
export FOP=/Users/gog/Development/xml2pdf/fop-0.95
export OUT=/Users/gog/Development/mail-server-book/en

# Single page
xsltproc --stringparam section.autolabel 1 --stringparam section.label.includes.component.label 1 --stringparam  html.stylesheet 'docbook.css' --xinclude -o output/html/index.html  $XSL/xhtml/onechunk.xsl book.xml
# Chunked
xsltproc --stringparam section.autolabel 1 --stringparam section.label.includes.component.label 1 --stringparam  html.stylesheet 'docbook.css' --stringparam use.id.as.filename 1 --xinclude -o output/chunks/index.html  $XSL/xhtml/chunk.xsl book.xml
# PDF
cd $FOP
$FOP/fop -c $FOP/conf/fop.xconf -xml $OUT/book.xml -xsl $XSL/fo/docbook.xsl -param body.font.family Times-Roman -param title.font.family Times-Roman -pdf $OUT/output/book.pdf
