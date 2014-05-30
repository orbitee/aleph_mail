<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>



<xsl:include href="funcs-address.xsl"/>
<xsl:include href="funcs-bib-info.xsl"/>
<!--xsl:include href="funcs-salut-sign.xsl"/-->
<!--xsl:include href="funcs-right.xsl"/-->
<xsl:include href="funcs-split.xsl"/>
<xsl:include href="funcs-grid.xsl"/>
<xsl:include href="funcs-free.xsl"/>
<xsl:include href="funcs-table.xsl"/>
<!--xsl:include href="funcs-grid-style.xsl"/-->
<!--xsl:include href="funcs-style.xsl"/-->
<!--xsl:include href="funcs-right-style.xsl"/-->
<xsl:include href="funcs-misc.xsl"/>
<!--xsl:include href="funcs-multilines.xsl"/-->
<xsl:include href="funcs-budget-status.xsl"/>
<!--xsl:include href="date.xsl"/-->
<!--xsl:include href="date.date.template.xsl"/-->
<!--xsl:include href="date.date.function.xsl"/-->

<xsl:template name="header-gen">
     <xsl:param name="title"/>
     <xsl:param name="sub-title"/>
   <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8"/>

   <!--DIV  STYLE="font-size: 9pt; font-family: Arial"-->
   <xsl:call-template name="table-open-full"/>

     <xsl:call-template name="table-start-row"/><td><xsl:value-of select="//form-date"/></td><xsl:call-template name="table-end-row"/>
    <xsl:call-template name="table-start-row"/><td>
           <xsl:value-of select="//form-name"/>-<xsl:value-of select="//form-format"/>
    </td><xsl:call-template name="table-end-row"/>
     <xsl:call-template name="table-start-row"/><td width="100%" colspan="2"><hr/></td><xsl:call-template name="table-end-row"/>
     <xsl:call-template name="table-start-row"/><td width="100%" colspan="2"  STYLE="font-size: 12pt; font-family: Arial" ALIGN="CENTER">
                  <b><xsl:value-of select="$title"/><br/></b>
     </td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-close"/>
   <xsl:if test="$sub-title !='' ">
        <xsl:call-template name="table-open-full"/>

        <xsl:call-template name="table-start-row"/><td width="100%" colspan="2"  STYLE="font-size: 12pt; font-family: Arial" ALIGN="CENTER">
                  <b><xsl:value-of select="$sub-title"/><br/></b>
        </td><xsl:call-template name="table-end-row"/>
        <xsl:call-template name="table-close"/>
   </xsl:if>

</xsl:template>

<!-- Template for MIT forms, removing the date, form name, and horizontal 
     line at the top -->
<xsl:template name="header-gen-mit">
     <xsl:param name="title"/>
     <xsl:param name="sub-title"/>
   <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8"/>

   <!--DIV  STYLE="font-size: 9pt; font-family: Arial"-->
   <xsl:call-template name="table-open-full"/>

   <xsl:if test="$title !='' ">
        <xsl:call-template name="table-start-row"/><td width="100%" colspan="2"  STYLE="font-size: 12pt; font-family: Arial" ALIGN="CENTER">
                  <b><xsl:value-of select="$title"/><br/></b>
        </td><xsl:call-template name="table-end-row"/>
        <xsl:call-template name="table-close"/>
   </xsl:if>
   <xsl:if test="$sub-title !='' ">
        <xsl:call-template name="table-open-full"/>

        <xsl:call-template name="table-start-row"/><td width="100%" colspan="2"  STYLE="font-size: 12pt; font-family: Arial" ALIGN="CENTER">
                  <b><xsl:value-of select="$sub-title"/><br/></b>
        </td><xsl:call-template name="table-end-row"/>
        <xsl:call-template name="table-close"/>
   </xsl:if>

</xsl:template>
<!-- Template for MIT forms, removing the date, form name, and horizontal 
     line at the top -->

<xsl:template name="header-gen-mit-date">
     <xsl:param name="title"/>
     <xsl:param name="sub-title"/>
   <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8"/>

   <!--DIV  STYLE="font-size: 9pt; font-family: Arial"-->
   <xsl:call-template name="table-open-full"/>

   <xsl:if test="$title !='' ">
        <xsl:call-template name="table-start-row"/><td width="100%" colspan="2"  STYLE="font-size: 12pt; font-family: Arial" ALIGN="CENTER">
                  <b><xsl:value-of select="$title"/><xsl:value-of select="//form-date"/><br/></b>
        </td><xsl:call-template name="table-end-row"/>
        <xsl:call-template name="table-close"/>
   </xsl:if>
   <xsl:if test="$sub-title !='' ">
        <xsl:call-template name="table-open-full"/>

        <xsl:call-template name="table-start-row"/><td width="100%" colspan="2"  STYLE="font-size: 12pt; font-family: Arial" ALIGN="CENTER">
                  <b><xsl:value-of select="$sub-title"/><br/></b>
        </td><xsl:call-template name="table-end-row"/>
        <xsl:call-template name="table-close"/>
   </xsl:if>

</xsl:template>

<xsl:template name="horizontal-line">
    <hr/>
</xsl:template>

<xsl:template name="local-title">
      <xsl:param name="local-title"/>
       <br/>
   <xsl:call-template name="table-open"/>
   <xsl:call-template name="table-start-row"/><td><b><xsl:value-of select="$local-title"/></b></td><xsl:call-template name="table-end-row"/>
   <xsl:call-template name="table-close"/>
</xsl:template>







</xsl:stylesheet>


