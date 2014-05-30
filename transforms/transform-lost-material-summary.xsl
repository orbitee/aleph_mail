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

<xsl:for-each select="//section-03">
	<xsl:call-template name="section-03"/>
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
<!--    <xsl:call-template name="table-open"/>
    <xsl:call-template name="display-gen">
		<xsl:with-param name="label" select="'Form Date:'"/>
		<xsl:with-param name="value" select="./form-date"/>
</xsl:call-template>
    <xsl:call-template name="table-close"/>-->
    <xsl:call-template name="blank-line"/>
    <xsl:call-template name="generic-line-mit">
        <xsl:with-param name="line" select="./form-date"/>
    </xsl:call-template>
    <xsl:call-template name="generic-line-mit">
		<xsl:with-param name="line" select="'Following is a list of long overdue item(s).  Please return these item(s) immediately in order to avoid replacement charges of 150.00 per item.'"/>
	</xsl:call-template>
    <xsl:call-template name="generic-line-mit">
        <xsl:with-param name="line" select="'If you return the items to the library before we send this bill to the Accounting Office you will only have to pay  overdue fines for the items.'"/>
    </xsl:call-template>
    <xsl:call-template name="blank-line"/>
</xsl:template>


<xsl:template name="section-02">
<xsl:param name="header"/>
<xsl:call-template name="bib-info-hdr"/>
   <xsl:call-template name="table-split-open"/>
    <xsl:call-template name="display-gen-split">
		<xsl:with-param name="label" select="'Loan Date:'"/>
		<xsl:with-param name="value" select="./z36-loan-date"/>
	</xsl:call-template>
    <xsl:call-template name="display-gen-split">
		<xsl:with-param name="label" select="'Barcode:'"/>
		<xsl:with-param name="value" select="./z30-barcode"/>
	</xsl:call-template>
    <xsl:call-template name="display-gen-split">
		<xsl:with-param name="label" select="'Sub Library:'"/>
		<xsl:with-param name="value" select="./z30-sub-library"/>
	</xsl:call-template>
    <xsl:call-template name="display-gen-split">
		<xsl:with-param name="label" select="'Collection:'"/>
		<xsl:with-param name="value" select="./z30-collection"/>
	</xsl:call-template>

   <xsl:call-template name="table-split-right"/>
    <xsl:call-template name="display-gen">
		<xsl:with-param name="label" select="'Due Date:'"/>
		<xsl:with-param name="value" select="./z36-due-date"/>
	</xsl:call-template>
    <xsl:call-template name="display-gen">
		<xsl:with-param name="label" select="'Call No:'"/>
		<xsl:with-param name="value" select="./z30-call-no"/>
	</xsl:call-template>
    <xsl:call-template name="display-gen">
		<xsl:with-param name="label" select="'Description:'"/>
		<xsl:with-param name="value" select="./z30-description"/>
	</xsl:call-template>
    <xsl:call-template name="display-gen">
		<xsl:with-param name="label" select="'Item Status:'"/>
		<xsl:with-param name="value" select="./z30-item-status"/>
	</xsl:call-template>
   <xsl:call-template name="table-split-close"/>
    <xsl:call-template name="table-open"/>
    <xsl:call-template name="display-gen">
		<xsl:with-param name="label" select="concat(./sum-label-1,':')"/>
		<xsl:with-param name="value" select="./sum-1"/>
	</xsl:call-template>
    <xsl:call-template name="table-close"/>
</xsl:template>


<xsl:template name="section-03">
<xsl:param name="header"/>
<xsl:call-template name="horizontal-line"/>
   <xsl:call-template name="table-split-open"/>
    <xsl:call-template name="display-gen-split">
		<xsl:with-param name="label" select="'Total:'"/>
		<xsl:with-param name="value" select="./total"/>
	</xsl:call-template>
   <xsl:call-template name="table-split-right"/>
   <xsl:call-template name="table-split-close"/>
</xsl:template>

<xsl:template name="signature">
     <xsl:call-template name="generic-line-mit">
          <xsl:with-param name="line" select="'Sincerely,'"/>
       </xsl:call-template>
     <xsl:call-template name="generic-line-mit">
          <xsl:with-param name="line" select="'MIT Libraries'"/>
       </xsl:call-template>
   <xsl:call-template name="generic-line-mit">
      <xsl:with-param name="line" select="'The MIT Libraries have instituted changes to the fines policy including lower fine rates for many items, caps on overdue fines and blocks on accounts with long overdue items.'"/>
   </xsl:call-template>
   <xsl:call-template name="generic-line-mit">
      <xsl:with-param name="line" select="'For more information on our fines policies, please visit http://libraries.mit.edu/ordering/fines.html.'"/>
   </xsl:call-template>
   </xsl:template>
</xsl:stylesheet>
