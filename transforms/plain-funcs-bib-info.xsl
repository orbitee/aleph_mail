<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>






<xsl:template name="bib-info">
   <xsl:param name="line"/>
   <xsl:variable name="first" select="substring-before($line,'##')"/>
   <xsl:variable name="rest" select="substring-after($line,'##')"/>
   <xsl:if test="$first != ''">
       <xsl:value-of select="$first"/>
       <xsl:call-template name="new-line"/>
   </xsl:if>
   <xsl:if test="$rest != ''">
        <xsl:call-template name="bib-info">
            <xsl:with-param name="line" select="$rest"/>
         </xsl:call-template>
   </xsl:if>
   <xsl:if test="$rest = '' and $line != ''  and $line != '##'">
      <xsl:value-of select="$line"/>
      <xsl:call-template name="new-line"/>
   </xsl:if>
</xsl:template>

<xsl:template name="bib-info-hdr">
        <xsl:call-template name="bib-info">
            <xsl:with-param name="line" select="./bib-info"/>
         </xsl:call-template>
</xsl:template>


</xsl:stylesheet>



