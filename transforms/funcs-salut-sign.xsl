<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>






<xsl:template name="salutation-init">
   <xsl:param name="salutation"/>
     <xsl:call-template name="table-open-full"/>
     <xsl:call-template name="table-start-row"/><td><br/>Dear Sir/Madam,<br/><br/></td><xsl:call-template name="table-end-row"/>
        <xsl:call-template name="generic-line">
            <xsl:with-param name="line" select="$salutation"/>
        </xsl:call-template>
</xsl:template>



<xsl:template name="salutation-end">
    <xsl:call-template name="table-close"/>
     <!--/TABLE-->
    <br/><br/>
</xsl:template>


</xsl:stylesheet>


