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
       <xsl:with-param name="title" select="'LIBRARY - OVERDUE ITEMS'"/>
    </xsl:call-template>
</xsl:template>-->


<xsl:template name="section-01">
    <xsl:call-template name="sublib-address-mit-circ"/>
    <xsl:call-template name="blank-line"/>
    <xsl:call-template name="patron-address-mit-circ"/>
	<!--Free Section Code -->
<xsl:call-template name="blank-line"/>
<!--<xsl:call-template name="table-open-full"/>
    <xsl:call-template name="generic-line">
		<xsl:with-param name="line" select="'The following items are overdue.'"/>
	</xsl:call-template>
        <xsl:call-template name="table-close"/>
</xsl:template>-->
<xsl:call-template name="generic-line-mit">
   <xsl:with-param name="line" select="'The following items are overdue.'"/>
</xsl:call-template>
<xsl:call-template name="blank-line"/>
</xsl:template>

<xsl:template name="section-02">
<xsl:param name="header"/>
<!--    <xsl:call-template name="generic-line-mit">
		<xsl:with-param name="line" select="''"/>
	</xsl:call-template>-->
<xsl:call-template name="bib-info-hdr"/>
<!--    <xsl:call-template name="generic-line">
		<xsl:with-param name="line" select="''"/>
   </xsl:call-template>-->
   <xsl:call-template name="table-split-open"/>
   <xsl:call-template name="display-gen-split">
		<xsl:with-param name="label" select="'Loan Date:'"/>
		<xsl:with-param name="value" select="./z36-loan-date"/>
	</xsl:call-template>
    <xsl:call-template name="display-gen-split">
		<xsl:with-param name="label" select="'Due Date:'"/>
		<xsl:with-param name="value" select="./z36-due-date"/>
	</xsl:call-template>
    <xsl:call-template name="display-gen-split">
		<xsl:with-param name="label" select="'Letter Number:'"/>
		<xsl:with-param name="value" select="./z36-letter-number"/>
	</xsl:call-template>
   <xsl:call-template name="table-split-right"/>
    <xsl:call-template name="display-gen">
		<xsl:with-param name="label" select="'Barcode:'"/>
		<xsl:with-param name="value" select="./z30-barcode"/>
	</xsl:call-template>
    <xsl:call-template name="display-gen">
		<xsl:with-param name="label" select="'Library:'"/>
		<xsl:with-param name="value" select="./z30-sub-library"/>
	</xsl:call-template>
    <xsl:call-template name="display-gen">
		<xsl:with-param name="label" select="'Call No:'"/>
		<xsl:with-param name="value" select="./z30-call-no"/>
	</xsl:call-template>
    <xsl:call-template name="display-gen">
		<xsl:with-param name="label" select="'Year:'"/>
		<xsl:with-param name="value" select="./z30-chronological-i"/>
	</xsl:call-template>
    <xsl:call-template name="display-gen">
		<xsl:with-param name="label" select="'Volume:'"/>
		<xsl:with-param name="value" select="./z30-enumeration-a"/>
	</xsl:call-template>
    <xsl:call-template name="display-gen">
		<xsl:with-param name="label" select="'Number:'"/>
		<xsl:with-param name="value" select="./z30-enumeration-b"/>
	</xsl:call-template>
    <xsl:call-template name="display-gen">
		<xsl:with-param name="label" select="'Description:'"/>
		<xsl:with-param name="value" select="./z30-description"/>
	</xsl:call-template>
   <xsl:call-template name="table-split-close"/>
<!--   <xsl:call-template name="blank-line"/> -->
    <xsl:choose>
    <xsl:when test="contains(./z36-status,'Recalled')">
        <xsl:call-template name="generic-line-mit"> 
        <xsl:with-param name="line" select="'NOTE: THE ABOVE ITEM HAS BEEN RECALLED BY ANOTHER USER.  Therefore, you will not be allowed to renew it.  Late returns are subject to a special fine of $2.00 per day, and the grace period is shortened from four days to one day.'"/>
        </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
        <xsl:if test="contains(./z36-status,'Requested')">
            <xsl:call-template name="generic-line-mit">
            <xsl:with-param name="line" select="'NOTE: THE ABOVE ITEM HAS BEEN REQUESTED BY ANOTHER USER.  Therefore, you will not be allowed to renew it.'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="signature">
     <xsl:call-template name="generic-line-mit">
          <xsl:with-param name="line" select="'It may be possible to renew this material through Your Account: http://libraries.mit.edu/barton'"/>
     </xsl:call-template>
     <xsl:call-template name="generic-line-mit">
          <xsl:with-param name="line" select="'Interlibrary Borrowing materials may NOT be renewed via Your Account.'"/>
     </xsl:call-template>
     <xsl:call-template name="generic-line-mit">
          <xsl:with-param name="line" select="'Please do not reply to this message.  If you have questions or need help accessing Your Account online, please call or stop by any MIT libraries service desk (http://libraries.mit.edu/phone) or email our Ask Us! service (http://libraries.mit.edu/ask).'"/>
       </xsl:call-template>
     <xsl:call-template name="generic-line-mit">
	<xsl:with-param name="line" select="'Many thanks,'"/>
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
