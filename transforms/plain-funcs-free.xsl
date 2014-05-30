<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>


<xsl:variable name="label-width" select="'20%'"/>

<xsl:template name="free-title">
    <xsl:param name="free-title"/>
        <xsl:value-of select="$free-title"/>
	<xsl:call-template name="new-line"/>
	<xsl:call-template name="new-line"/>
</xsl:template>

<xsl:template name="display-gen">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="display"/>
    <xsl:param name="type"/>
    <xsl:param name="style"/>
    <xsl:param name="width"/>


   <xsl:if test="$display ='always'">
        <xsl:value-of select="$label"/><xsl:text>  </xsl:text><xsl:value-of select="$value"/>
        <xsl:call-template name="new-line"/>
   </xsl:if>

    <!-- Regular -->
   <xsl:if test="$display !='always' and $value != ''">
        <xsl:value-of select="$label"/><xsl:text>  </xsl:text><xsl:value-of select="$value"/>
        <xsl:call-template name="new-line"/>
   </xsl:if>
</xsl:template>

</xsl:stylesheet>
