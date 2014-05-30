<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>

   <!--xsl:version="1.0"-->


<xsl:template name="display-not-empty-right">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:if test="$value !=''">
    <xsl:call-template name="table-start-row"/>
        <td width="40%"><b><xsl:value-of select="$label"/></b></td>
        <td align="right"><xsl:value-of select="$value"/></td>
    <xsl:call-template name="table-end-row"/>
     </xsl:if>
</xsl:template>

<xsl:template name="display-always-right">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:call-template name="table-start-row"/>
        <td width="40%"><b><xsl:value-of select="$label"/></b></td>
        <td alignment="right"><xsl:value-of select="$value"/></td>
    <xsl:call-template name="table-end-row"/>
</xsl:template>

<xsl:template name="display-not-empty-split-right">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:if test="$value !=''">
    <xsl:call-template name="table-start-row"/>
        <td width="40%"><b><xsl:value-of select="$label"/></b></td>
        <td align="right"><xsl:value-of select="$value"/></td>
    <xsl:call-template name="table-end-row"/>
     </xsl:if>
</xsl:template>

<xsl:template name="display-always-split-right">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:call-template name="table-start-row"/>
        <td width="40%"><b><xsl:value-of select="$label"/></b></td>
        <td align="right"><xsl:value-of select="$value"/></td>
    <xsl:call-template name="table-end-row"/>
</xsl:template>



</xsl:stylesheet>


