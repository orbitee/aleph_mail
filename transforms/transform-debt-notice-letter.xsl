<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>

<xsl:include href="funcs.xsl"/>


<xsl:template match="/">
       <xsl:call-template name="header"/>


    <!--section-01 (FREE)-->
    <xsl:for-each select="//section-01">
       <xsl:call-template name="section-01"/>
    </xsl:for-each>

       <xsl:call-template name="signature"/>

</xsl:template>


    <!-- START DATA -->
<xsl:template name="header">
    <xsl:call-template name="header-gen-mit">
       <xsl:with-param name="title" select="''"/>
    </xsl:call-template>
</xsl:template>

<!--SECTION-01  (FREE)-->
<xsl:template name="section-01">
    <xsl:call-template name="sublib-address-mit-circ-2"/>
    <xsl:call-template name="patron-address-mit-circ"/>
    <xsl:call-template name="generic-line">
       <xsl:with-param name="line" select='concat("salutation_string##Please be aware that you have accumulated library fines of ", //balance,   ". Student
fines can be paid at any MIT Library service desk until April 30th. On May 1st they will be transferred to Student Financial Services for billing.
Non-student fines may be paid at any MIT Library service desk. See our Circulation FAQ for detailed information on viewing, paying and appealing fines: 
http://libguides.mit.edu/circ. Please contact a library circulation desk if you have any questions or need assistance.")'/>
    </xsl:call-template>
    <xsl:call-template name="salutation-end"/>
</xsl:template>

<xsl:template name="signature">
    <xsl:call-template name="generic-line">
       <xsl:with-param name="line" select="'##Sincerely,####MIT Libraries'"/>
    </xsl:call-template>
</xsl:template>

</xsl:stylesheet>



