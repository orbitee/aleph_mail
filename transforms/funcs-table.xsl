<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>


<xsl:variable name="table-width" select="'100%'"/>


<!--<xsl:template name="table-open-full">
    <xsl:element name="TABLE">
                  <xsl:attribute name="WIDTH"><xsl:value-of select="$table-width"/></xsl:attribute>
                 <xsl:attribute name="style">font-family=arial; font-size=9pt</xsl:attribute>
                  <xsl:attribute name="align">center</xsl:attribute>
    </xsl:element>
</xsl:template>-->
<xsl:template name="table-open-full">
      <xsl:text disable-output-escaping="yes">&lt;</xsl:text>TABLE WIDTH=<xsl:value-of select="$table-width"/> style="font-family: arial; font-size: 9pt" align="center"<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
</xsl:template>

<xsl:template name="table-open">
    <xsl:param name="width"/>
    <xsl:param name="align"/>
    <xsl:variable name="cur-width">
         <xsl:choose>
         <xsl:when test = "$width != ''">
             <xsl:value-of select="$width"/>
         </xsl:when>
         <xsl:otherwise><xsl:value-of select="$table-width"/></xsl:otherwise>
         </xsl:choose>
    </xsl:variable>
   <xsl:text disable-output-escaping="yes">&lt;</xsl:text>TABLE WIDTH=<xsl:value-of select="$cur-width"/> style="font-family: arial; font-size: 9pt" align="center"<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
</xsl:template>

<xsl:template name="grid-open">
    <xsl:param name="width"/>
    <xsl:param name="align"/>
    <xsl:variable name="cur-width">
         <xsl:choose>
         <xsl:when test = "$width != ''">
             <xsl:value-of select="$width"/>
         </xsl:when>
         <xsl:otherwise>100%</xsl:otherwise>
         </xsl:choose>
    </xsl:variable>
   <xsl:text >&lt;</xsl:text>TABLE WIDTH=<xsl:value-of select="$cur-width"/> BORDER=1 style="font-family: arial; font-size: 9pt" align=<xsl:value-of select="$align"/><xsl:text disable-output-escaping="yes">&gt;</xsl:text>
</xsl:template>


<xsl:template name="grid-close">
        <xsl:call-template name="table-close"/>
</xsl:template>


<xsl:template name="table-close">
         <xsl:text disable-output-escaping="yes">&lt;/TABLE&gt;</xsl:text>
</xsl:template>

<xsl:template name="table-split-open">
         <xsl:text disable-output-escaping="yes">        &lt;TABLE ALIGN="CENTER" WIDTH="100%"&gt;</xsl:text>
         <xsl:text disable-output-escaping="yes">         &lt;tr&gt;</xsl:text>
         <xsl:text disable-output-escaping="yes">         &lt;td width="50%"&gt;</xsl:text>
         <xsl:text disable-output-escaping="yes">           &lt;TABLE WIDTH="100%" STYLE="font-size: 9pt; font-family: Arial"&gt;</xsl:text>
</xsl:template>

<xsl:template name="table-split-right">
         <xsl:text disable-output-escaping="yes">        &lt;/TABLE&gt;</xsl:text>
         <xsl:text disable-output-escaping="yes">         &lt;/td&gt;</xsl:text>
         <xsl:text disable-output-escaping="yes">         &lt;td&gt;</xsl:text>
         <xsl:text disable-output-escaping="yes">           &lt;TABLE WIDTH="100%" STYLE="font-size: 9pt; font-family: Arial"&gt;</xsl:text>
</xsl:template>
<xsl:template name="table-split-close">
         <xsl:text disable-output-escaping="yes">        &lt;/TABLE&gt;</xsl:text>
         <xsl:text disable-output-escaping="yes">         &lt;/td&gt;</xsl:text>
         <xsl:text disable-output-escaping="yes">         &lt;/tr&gt;</xsl:text>
         <xsl:text disable-output-escaping="yes">        &lt;/TABLE&gt;</xsl:text>
</xsl:template>

<xsl:template name="table-start-row">
         <xsl:text disable-output-escaping="yes">&lt;tr&gt;</xsl:text>
</xsl:template>
<xsl:template name="table-end-row">
         <xsl:text disable-output-escaping="yes">&lt;/tr&gt;</xsl:text>
</xsl:template>


</xsl:stylesheet>




