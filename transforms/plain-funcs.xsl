<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>



<xsl:include href="plain-funcs-address.xsl"/>
<xsl:include href="plain-funcs-bib-info.xsl"/>
<!--xsl:include href="plain-funcs-salut-sign.xsl"/-->
<!--xsl:include href="plain-funcs-right.xsl"/-->
<xsl:include href="plain-funcs-split.xsl"/>
<xsl:include href="plain-funcs-grid.xsl"/>
<xsl:include href="plain-funcs-free.xsl"/>
<xsl:include href="plain-funcs-table.xsl"/>
<!--xsl:include href="plain-funcs-grid-style.xsl"/-->
<!--xsl:include href="plain-funcs-style.xsl"/-->
<!--xsl:include href="plain-funcs-right-style.xsl"/-->
<xsl:include href="plain-funcs-misc.xsl"/>
<!--xsl:include href="plain-funcs-multilines.xsl"/-->
<!--xsl:include href="plain-funcs-budget-status.xsl"/-->
<!--xsl:include href="date.xsl"/-->
<!--xsl:include href="date.date.template.xsl"/-->
<!--xsl:include href="date.date.function.xsl"/-->

<xsl:template name="header-gen">
     <xsl:param name="title"/>
     <xsl:param name="sub-title"/>
<xsl:call-template name="new-line"/>
<xsl:value-of select="//form-date"/><xsl:call-template name="new-line"/>

<xsl:value-of select="//form-name"/>-<xsl:value-of select="//form-format"/>
<xsl:call-template name="new-line"/>
<xsl:value-of select="$title"/><xsl:call-template name="new-line"/>
<xsl:value-of select="$sub-title"/><xsl:call-template name="new-line"/>
</xsl:template>

<xsl:template name="horizontal-line">
------------------------------------------------------------------------------
</xsl:template>

<!-- Template for MIT forms, removing the date, form name, and horizontal 
     line at the top -->
<xsl:template name="header-gen-mit">
      <xsl:param name="title"/>
      <xsl:param name="sub-title"/>
   <xsl:call-template name="new-line"/>
   <xsl:if test="$title !='' ">
      <xsl:value-of select="$title"/><xsl:call-template name="new-line"/>
   </xsl:if>
   <xsl:if test="$sub-title !='' ">
      <xsl:value-of select="$sub-title"/><xsl:call-template name="new-line"/>
   </xsl:if>
</xsl:template>

<xsl:template name="local-title">
      <xsl:param name="local-title"/>
       
   <xsl:call-template name="table-open"/>
   <xsl:call-template name="table-start-row"/><td><b><xsl:value-of select="$local-title"/></b></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-close"/>
</xsl:template>

<xsl:template name="new-line">
	<xsl:text>&#xa;</xsl:text>
</xsl:template>





</xsl:stylesheet>


