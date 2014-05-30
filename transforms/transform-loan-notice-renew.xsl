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

  <!--SECTION-01  (FREE)-->
  <xsl:template name="section-01">
    <xsl:call-template name="sublib-address-mit-circ"/>
    <xsl:call-template name="blank-line"/>
    <xsl:call-template name="patron-address-mit-circ"/>
    <xsl:call-template name="blank-line"/>
    <xsl:call-template name="generic-line-mit">
      <xsl:with-param name="line" select="'The following item(s) have been automatically renewed.'"/>
    </xsl:call-template>
    <xsl:call-template name="blank-line"/>
  </xsl:template>

  <!--SECTION-02  (GRID)-->
  <xsl:template name="section-02">
    <xsl:param name="header"/>
      <xsl:call-template name="bib-info-hdr"/>
      <xsl:call-template name="table-split-open"/>
      <xsl:call-template name="display-gen-split">
	<xsl:with-param name="label" select="'Due Date:'"/>
	<xsl:with-param name="value" select="./z36-due-date"/>
      </xsl:call-template>
    <xsl:call-template name="display-gen-split">
      <xsl:with-param name="label" select="'Barcode:'"/>
      <xsl:with-param name="value" select="./z30-barcode"/>
    </xsl:call-template>
   <xsl:call-template name="table-split-right"/>
    <xsl:call-template name="display-gen">
      <xsl:with-param name="label" select="'Call No:'"/>
      <xsl:with-param name="value" select="./z30-call-no"/>
    </xsl:call-template>
    <xsl:call-template name="display-gen">
      <xsl:with-param name="label" select="'Description:'"/>
      <xsl:with-param name="value" select="./z30-description"/>
    </xsl:call-template>
    <xsl:call-template name="table-split-close"/>
  </xsl:template>

  <xsl:template name="signature">
      <xsl:call-template name="generic-line-mit">
	<xsl:with-param name="line" select="'All MIT Libraries locations will be closed Thursday Dec. 23, 2010 through Sunday Jan, 2, 2011. Due dates for materials on loan have been adjusted to reflect this closure. No items will be due during this period and fines will not accrue. Items returned to a Libraries bookdrop during the closure will not be checked in until the Libraries re-open on January 3rd.'"/>
      </xsl:call-template>
      <xsl:call-template name="generic-line-mit">
	<xsl:with-param name="line" select="'MIT Libraries'"/>
      </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>


