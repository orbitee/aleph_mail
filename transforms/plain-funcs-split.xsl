<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>




<xsl:template name="display-gen-split">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="display"/>
    <xsl:param name="type"/>
	<xsl:value-of select="$label"/><xsl:text>  </xsl:text><xsl:value-of select="$value"/>
	<xsl:call-template name="new-line"/>
</xsl:template>


</xsl:stylesheet>


