<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>

   <!--xsl:version="1.0"-->

<xsl:template name="grid-hdr">
    <xsl:param name="value"/>
        <xsl:value-of select="$value"/>
	<xsl:call-template name="new-line"/>
</xsl:template>

<xsl:template name="grid-title">
      <xsl:param name="grid-title"/>
	<xsl:call-template name="new-line"/>
	<xsl:value-of select="$grid-title"/>
	<xsl:call-template name="horizontal-line"/>
	<xsl:call-template name="new-line"/>
</xsl:template>

<xsl:template name="display-grid-gen">
    <xsl:param name="value"/>
    <xsl:param name="type"/>
    <xsl:param name="label"/>
    <xsl:param name="header"/>
    <xsl:param name="style"/>
    <xsl:param name="check-value"/>
	<xsl:if test="$type !='bib-info' and $header =''">
        	<xsl:value-of select="$label"/>: <xsl:value-of select="$value"/>
        	<xsl:call-template name="new-line"/>
	</xsl:if>

    <!-- bib-info -->
     <xsl:if test="$type ='bib-info'  and $header =''">
      <xsl:call-template name="bib-info-hdr">
          <xsl:with-param name="line" select="$value"/>
       </xsl:call-template>
     </xsl:if>	
</xsl:template>
<xsl:template name="start-grid">
    <xsl:param name="grid-title"/>
    <xsl:param name="width"/>
    <xsl:param name="nobold"/>

           <xsl:call-template name="grid-title">
              <xsl:with-param name="grid-title" select="$grid-title"/>
           </xsl:call-template>
</xsl:template>


</xsl:stylesheet>









