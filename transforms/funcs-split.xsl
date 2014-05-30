<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>




<xsl:template name="display-gen-split">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="display"/>
    <xsl:param name="type"/>
    <xsl:param name="style"/>

    <!-- Regular -->
    <xsl:if test="$display =''  and $type = '' ">
      <xsl:call-template name="display-not-empty-split">
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="style" select="$style"/>
       </xsl:call-template>
     </xsl:if>


     <!-- Display label even if no data -->
   <xsl:if test="$display ='always'  and $type = ''">
      <xsl:call-template name="display-always-split">
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="style" select="$style"/>
       </xsl:call-template>
     </xsl:if>






    <!-- Regular  - align right-->
    <xsl:if test="$display =''  and $type = 'right'">
      <xsl:call-template name="display-not-empty-right-split">
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="style" select="$style"/>
       </xsl:call-template>
     </xsl:if>

     <!-- Display label even if no data - align right -->
   <xsl:if test="$display ='always'  and $type = 'right'">
      <xsl:call-template name="display-always-right-split">
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="style" select="$style"/>
       </xsl:call-template>
     </xsl:if>

    <!-- Regular - Barcode -->
    <xsl:if test="$display =''  and $type = 'barcode' ">
      <xsl:call-template name="display-not-empty-barcode-split">
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="style" select="$style"/>
       </xsl:call-template>
     </xsl:if>


     <!-- Display label even if no data - Barcode -->
   <xsl:if test="$display ='always'  and $type = 'barcode'">
      <xsl:call-template name="display-always-barcode-split">
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="style" select="$style"/>
       </xsl:call-template>
     </xsl:if>

      <!-- Display checkbox -->
    <xsl:if test="$type = 'check' ">

   <xsl:call-template name="free-data-check">
            <xsl:with-param name="label" select="$label"/>
            <xsl:with-param name="value" select="$value"/>
            <xsl:with-param name="style" select="'bold'"/>
   </xsl:call-template>

     </xsl:if>

     <!-- Display index -->
   <xsl:if test="$type = 'index'">
      <xsl:call-template name="position-index">
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="style" select="'bold'"/>
          <xsl:with-param name="width" select="'40%'"/>
       </xsl:call-template>
     </xsl:if>

</xsl:template>

<xsl:template name="display-not-empty-split">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="style"/>
    <xsl:if test="$value !=''">
    <xsl:call-template name="table-start-row"/>
        <td width="40%">

        <b><xsl:value-of select="$label"/></b></td>
        <td width="30%">
            <xsl:call-template name="build-style-start">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
		<xsl:value-of select="$value"/>
            <xsl:call-template name="build-style-end">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
	</td>
        <td></td>
    <xsl:call-template name="table-end-row"/>
     </xsl:if>
</xsl:template>

<xsl:template name="display-always-split">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="style"/>
    <xsl:call-template name="table-start-row"/>
        <td width="40%"><b><xsl:value-of select="$label"/></b></td>
        <td>
            <xsl:call-template name="build-style-start">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
		<xsl:value-of select="$value"/>
            <xsl:call-template name="build-style-end">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
	</td>
    <xsl:call-template name="table-end-row"/>
</xsl:template>



<xsl:template name="display-not-empty-barcode-split">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="style"/>
    <xsl:if test="$value !=''">
    <xsl:call-template name="table-start-row"/>
         <td width="40%"><b><xsl:value-of select="$label"/></b></td>
        <td STYLE="font-family=CarolinaBar-B39-2.5-22x158x720;">
            <xsl:call-template name="build-style-start">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
		*<xsl:value-of select="$value"/>*
            <xsl:call-template name="build-style-end">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
	</td>
    <xsl:call-template name="table-end-row"/>
     </xsl:if>
</xsl:template>

<xsl:template name="display-always-barcode-split">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="style"/>
    <xsl:call-template name="table-start-row"/>
        <td width="40%"><b><xsl:value-of select="$label"/></b></td>
        <td STYLE="font-family=CarolinaBar-B39-2.5-22x158x720;">
            <xsl:call-template name="build-style-start">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
		*<xsl:value-of select="$value"/>*
            <xsl:call-template name="build-style-end">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
	</td>
    <xsl:call-template name="table-end-row"/>
</xsl:template>

<xsl:template name="display-not-empty-right-split">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="style"/>
    <xsl:if test="$value !=''">
    <xsl:call-template name="table-start-row"/>
        <td width="40%"><b><xsl:value-of select="$label"/></b></td>
        <td align="right">
            <xsl:call-template name="build-style-start">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
		<xsl:value-of select="$value"/>
            <xsl:call-template name="build-style-end">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
	</td>
    <xsl:call-template name="table-end-row"/>
     </xsl:if>
</xsl:template>

<xsl:template name="display-always-right-split">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="style"/>
    <xsl:call-template name="table-start-row"/>
        <td width="40%"><b><xsl:value-of select="$label"/></b></td>
        <td alignment="right">
            <xsl:call-template name="build-style-start">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
		<xsl:value-of select="$value"/>
            <xsl:call-template name="build-style-end">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
	</td>
    <xsl:call-template name="table-end-row"/>
</xsl:template>

</xsl:stylesheet>



