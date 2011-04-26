<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- Use XSL for creating a single page HTML document -->
<xsl:import href="docbook-xsl-1.75.0/html/onechunk.xsl"/>

<!-- Add class="code language" to code blocks created by programlistings -->
<xsl:template match="programlisting[@role = 'php']" mode="class.value">
  <xsl:value-of select="'code php'"/>
</xsl:template>
<xsl:template match="programlisting[@role = 'perl']" mode="class.value">
  <xsl:value-of select="'code perl'"/>
</xsl:template>
<xsl:template match="programlisting[@role = 'bash']" mode="class.value">
  <xsl:value-of select="'code bash'"/>
</xsl:template>
<xsl:template match="programlisting[@role = 'sql']" mode="class.value">
  <xsl:value-of select="'code sql'"/>
</xsl:template>

<!-- Insert Syntax highlighting script and CSS into the <head> of the document -->
<xsl:template name="user.header.content">
   <xsl:variable name="codefile" select="document('html-header-insert-onepage.xml',/)"/>
   <xsl:copy-of select="$codefile/htmlcode/node()"/>
</xsl:template>

<!-- Auto-label sections (adds chapter number in front of section names) -->
<xsl:param name="section.autolabel" select="1"/>
<!-- Include chapter number in the section labels -->
<xsl:param name="section.label.includes.component.label" select="1"/>
<!-- Add CSS to the <head> of the document -->
<xsl:param name="html.stylesheet" select="'css/main.css'"/>
<!-- Use icons for warnings, notices, etc. -->
<xsl:param name="admon.graphics" select="1"/>

</xsl:stylesheet>
