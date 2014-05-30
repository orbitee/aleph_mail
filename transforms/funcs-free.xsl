<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>


<xsl:variable name="label-width" select="'20%'"/>

<xsl:template name="free-title">
    <xsl:param name="free-title"/>
        <xsl:call-template name="table-start-row"/>
        <td>
            <xsl:call-template name="build-style-start">
                <xsl:with-param name="style" select="'underline;bold'"/>
            </xsl:call-template>
               <xsl:value-of select="$free-title"/>
            <xsl:call-template name="build-style-end">
                <xsl:with-param name="style" select="'underline;bold'"/>
            </xsl:call-template>
        </td>
        <xsl:call-template name="table-end-row"/>
</xsl:template>

<xsl:template name="display-gen">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="display"/>
    <xsl:param name="type"/>
    <xsl:param name="style"/>
    <xsl:param name="width"/>

    <!-- Regular -->
    <xsl:if test="$display =''  and $type = '' ">
      <xsl:call-template name="display-not-empty">
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="style" select="$style"/>
          <xsl:with-param name="width" select="$width"/>
       </xsl:call-template>
     </xsl:if>


     <!-- Display label even if no data -->
   <xsl:if test="$display ='always'  and $type = ''">
      <xsl:call-template name="display-always">
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="style" select="$style"/>
          <xsl:with-param name="width" select="$width"/>
       </xsl:call-template>
     </xsl:if>


     <!-- Display index -->
   <xsl:if test="$type = 'index'">
      <xsl:call-template name="position-index">
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="style" select="$style"/>
          <xsl:with-param name="width" select="$width"/>
       </xsl:call-template>
     </xsl:if>






    <!-- Regular  - align right-->
    <xsl:if test="$display =''  and $type = 'right'">
      <xsl:call-template name="display-not-empty-right">
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="style" select="$style"/>
          <xsl:with-param name="width" select="$width"/>
       </xsl:call-template>
     </xsl:if>

     <!-- Display label even if no data - align right -->
   <xsl:if test="$display ='always'  and $type = 'right'">
      <xsl:call-template name="display-always-right">
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="style" select="$style"/>
          <xsl:with-param name="width" select="$width"/>
       </xsl:call-template>
     </xsl:if>

    <!-- Regular - Barcode -->
    <xsl:if test="$display =''  and $type = 'barcode' ">
      <xsl:call-template name="display-not-empty-barcode">
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="width" select="$width"/>
       </xsl:call-template>
     </xsl:if>


     <!-- Display label even if no data - Barcode -->
   <xsl:if test="$display ='always'  and $type = 'barcode'">
      <xsl:call-template name="display-always-barcode">
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="width" select="$width"/>
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

</xsl:template>

<xsl:template name="display-not-empty">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="style"/>
    <xsl:param name="width"/>
    <xsl:variable name="local-width">
    <xsl:choose>
    <xsl:when test = "$width = ''">
        <xsl:value-of select="$label-width"/>
    </xsl:when>
    <xsl:otherwise><xsl:value-of select="$width"/></xsl:otherwise>
    </xsl:choose>
    </xsl:variable>

    <xsl:if test="$value !=''">
    <xsl:call-template name="table-start-row"/>
        <td width="{$local-width}">
        <b><xsl:value-of select="$label"/></b></td>
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
     </xsl:if>
</xsl:template>

<xsl:template name="display-always">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="style"/>
    <xsl:param name="width"/>
    <xsl:variable name="local-width">
    <xsl:choose>
    <xsl:when test = "$width = ''">
        <xsl:value-of select="$label-width"/>
    </xsl:when>
    <xsl:otherwise><xsl:value-of select="$width"/></xsl:otherwise>
    </xsl:choose>
    </xsl:variable>

    <xsl:call-template name="table-start-row"/>
        <td width="{$local-width}"><b><xsl:value-of select="$label"/></b></td>
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



<xsl:template name="display-not-empty-barcode">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="width"/>
    <xsl:variable name="local-width">
    <xsl:choose>
    <xsl:when test = "$width = ''">
        <xsl:value-of select="$label-width"/>
    </xsl:when>
    <xsl:otherwise><xsl:value-of select="$width"/></xsl:otherwise>
    </xsl:choose>
    </xsl:variable>

    <xsl:if test="$value !=''">
    <xsl:call-template name="table-start-row"/>
         <td width="{$local-width}"><b><xsl:value-of select="$label"/></b></td>
        <td STYLE="font-family=CarolinaBar-B39-2.5-22x158x720;">*<xsl:value-of select="$value"/>*</td>
    <xsl:call-template name="table-end-row"/>
     </xsl:if>
</xsl:template>

<xsl:template name="display-always-barcode">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="width"/>
    <xsl:variable name="local-width">
    <xsl:choose>
    <xsl:when test = "$width = ''">
        <xsl:value-of select="$label-width"/>
    </xsl:when>
    <xsl:otherwise><xsl:value-of select="$width"/></xsl:otherwise>
    </xsl:choose>
    </xsl:variable>

    <xsl:call-template name="table-start-row"/>
        <td width="{$local-width}"><b><xsl:value-of select="$label"/></b></td>
        <td STYLE="font-family=CarolinaBar-B39-2.5-22x158x720;">*<xsl:value-of select="$value"/>*</td>
    <xsl:call-template name="table-end-row"/>
</xsl:template>

<xsl:template name="display-not-empty-right">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="style"/>
    <xsl:param name="width"/>
    <xsl:variable name="local-width">
    <xsl:choose>
    <xsl:when test = "$width = ''">
        <xsl:value-of select="$label-width"/>
    </xsl:when>
    <xsl:otherwise><xsl:value-of select="$width"/></xsl:otherwise>
    </xsl:choose>
    </xsl:variable>

    <xsl:if test="$value !=''">
    <xsl:call-template name="table-close"/>
    <xsl:call-template name="table-open"/>
    <xsl:call-template name="table-start-row"/>
        <td width="{$local-width}"><b><xsl:value-of select="$label"/></b></td>
        <td   width="10%" align="right">
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
    <xsl:call-template name="table-close"/>
    <xsl:call-template name="table-open"/>
     </xsl:if>
</xsl:template>

<xsl:template name="display-always-right">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="style"/>
    <xsl:param name="width"/>
    <xsl:variable name="local-width">
    <xsl:choose>
    <xsl:when test = "$width = ''">
        <xsl:value-of select="$label-width"/>
    </xsl:when>
    <xsl:otherwise><xsl:value-of select="$width"/></xsl:otherwise>
    </xsl:choose>
    </xsl:variable>

    <xsl:call-template name="table-open"/>
    <xsl:call-template name="table-start-row"/>
        <td width="{$local-width}"><b><xsl:value-of select="$label"/></b></td>
        <td   width="10%" align="right">
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
    <xsl:call-template name="table-close"/>
    <xsl:call-template name="table-open"/>
</xsl:template>



<xsl:template name="bib-info-hdr">
    <xsl:call-template name="table-open-full"/>
     <td width="100%" colspan="2">
        <xsl:call-template name="generic-line">
            <xsl:with-param name="line" select="./bib-info"/>
         </xsl:call-template>
    </td>
    <xsl:call-template name="table-close"/>
</xsl:template>

<xsl:template name="bib-info-free">
    <xsl:param name="value"/>
    <xsl:call-template name="table-open-full"/>
	<xsl:choose>
	<xsl:when test = "$value != ''">
	    <td width="100%">
 		<xsl:value-of select="$value"/>
	    </td>
	</xsl:when>
	</xsl:choose>

    <xsl:call-template name="table-close"/>
</xsl:template>


<xsl:template name="position-index">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="style"/>
    <xsl:param name="width"/>
    <xsl:variable name="local-width">
    <xsl:choose>
    <xsl:when test = "$width = ''">
        <xsl:value-of select="$label-width"/>
    </xsl:when>
    <xsl:otherwise><xsl:value-of select="$width"/></xsl:otherwise>
    </xsl:choose>
    </xsl:variable>

    <xsl:call-template name="table-start-row"/>
        <td width="{$local-width}"><b><xsl:value-of select="concat($label, position())"/></b></td>
        <td>
            <xsl:call-template name="build-style-start">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
               <!--xsl:value-of select="$value"/-->
            <xsl:call-template name="build-style-end">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
        </td>
    <xsl:call-template name="table-end-row"/>
</xsl:template>


<xsl:template name="free-data-check">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="style"/>
    <xsl:param name="check-value"/>

        <form><td>
            <xsl:call-template name="build-style-start">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
        <xsl:value-of select="$label"/>
        <xsl:call-template name="build-style-end">
                <xsl:with-param name="style" select="$style"/>
        </xsl:call-template>
        </td><td>
        <xsl:variable name="loc-check-value">
        <xsl:choose>
          <xsl:when test="$check-value!='' and $value = $check-value">Y</xsl:when>
          <xsl:when test="$check-value ='' and (starts-with($value,'Y') or starts-with($value,'y'))">Y</xsl:when>
          <xsl:otherwise>N</xsl:otherwise>
        </xsl:choose>
        </xsl:variable>

            <xsl:choose>
            <xsl:when test="$loc-check-value = 'Y'">
              <xsl:text disable-output-escaping="yes">
              &lt;input checked type=checkbox /&gt;
              </xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text disable-output-escaping="yes">
              &lt;input type=checkbox /&gt;
              </xsl:text>
            </xsl:otherwise>
            </xsl:choose>

        <br/></td></form>
</xsl:template>

</xsl:stylesheet>





