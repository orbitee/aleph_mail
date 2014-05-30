<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
       <xsl:call-template name="header"/>

<xsl:for-each select="//section-01">
	<xsl:call-template name="section-01"/>
</xsl:for-each>

<xsl:for-each select="//section-02">
	<xsl:call-template name="section-02"/>
        <xsl:call-template name="blank-line"/>
</xsl:for-each>

    <xsl:call-template name="signature"/>
</xsl:template>

<xsl:template name="header"/>
<!--    <xsl:call-template name="header-gen-mit">
       <xsl:with-param name="title" select="''"/>
    </xsl:call-template>
</xsl:template>-->


<xsl:template name="section-01">
    <xsl:call-template name="sublib-address-mit-circ"/>
    <xsl:call-template name="blank-line"/>
    <xsl:call-template name="patron-address-mit-circ"/>
	<!--Free Section Code -->
    <xsl:call-template name="generic-line-mit">
        <xsl:with-param name="line" select="./form-date"/>
    </xsl:call-template>
    <xsl:call-template name="generic-line-mit">
        <xsl:with-param name="line" select="'Recently we informed you that the following item had been recalled:'"/>
    </xsl:call-template>
    <xsl:call-template name="blank-line"/>
</xsl:template>


<xsl:template name="section-02">
<xsl:param name="header"/>
    <xsl:call-template name="bib-info-hdr"/>
    <xsl:call-template name="table-split-open"/>
    <xsl:call-template name="display-gen-split">
	<xsl:with-param name="label" select="'Library:'"/>
	<xsl:with-param name="value" select="./z30-sub-library"/>
    </xsl:call-template>
    <xsl:call-template name="display-gen-split">
	<xsl:with-param name="label" select="'Collection:'"/>
	<xsl:with-param name="value" select="./z30-collection"/>
    </xsl:call-template>
    <xsl:call-template name="table-split-right"/>
    <xsl:call-template name="display-gen">
	<xsl:with-param name="label" select="'Call number:'"/>
	<xsl:with-param name="value" select="./z30-call-no"/>
    </xsl:call-template>
    <xsl:call-template name="display-gen">
	<xsl:with-param name="label" select="'Description:'"/>
	<xsl:with-param name="value" select="./z30-description"/>
    </xsl:call-template>
    <xsl:call-template name="display-gen">
	<xsl:with-param name="label" select="'Barcode:'"/>
	<xsl:with-param name="value" select="./z30-barcode"/>
    </xsl:call-template>
    <xsl:call-template name="table-split-close"/>
    <xsl:call-template name="blank-line"/>
    <xsl:call-template name="generic-line-mit">
        <xsl:with-param name="line" select="concat('Please be advised that the recall request has been cancelled and that the item will now be due on the original due date:',./z36-original-due-date)"/>
    </xsl:call-template>
    <xsl:call-template name="blank-line"/>
</xsl:template>

<xsl:template name="signature">
     <xsl:call-template name="generic-line-mit">
          <xsl:with-param name="line" select="'Many thanks,'"/>
       </xsl:call-template>
     <xsl:call-template name="generic-line-mit">
          <xsl:with-param name="line" select="'MIT Libraries'"/>
       </xsl:call-template>
   </xsl:template>
</xsl:stylesheet>

