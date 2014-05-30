<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>

   <!--xsl:version="1.0"-->

<xsl:template name="grid-hdr">
    <xsl:param name="value"/>
        <th><xsl:value-of select="$value"/></th>
</xsl:template>

<xsl:template name="grid-data">
    <xsl:param name="value"/>
    <xsl:param name="style"/>
        <td>
            <xsl:call-template name="build-style-start">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
		<!--xsl:value-of select="$value"/-->
	    <xsl:call-template name="put-data">
                <xsl:with-param name="value" select="$value"/>
            </xsl:call-template>
            <xsl:call-template name="build-style-end">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
        <br/></td>
</xsl:template>


<xsl:template name="put-data">
    <xsl:param name="value"/>
   <xsl:variable name="first" select="substring-before($value,'##')"/>
   <xsl:variable name="rest" select="substring-after($value,'##')"/>
   <xsl:if test="$first != ''">
       <xsl:value-of select="$first"/><br/>
   </xsl:if>
   <xsl:if test="$rest != ''">
        <xsl:call-template name="put-data">
            <xsl:with-param name="value" select="$rest"/>
         </xsl:call-template>
   </xsl:if>
   <xsl:if test="$rest = '' and $value != ''  and $value != '##'">
      <xsl:value-of select="$value"/>
   </xsl:if>
</xsl:template>


<xsl:template name="grid-data-check">
    <xsl:param name="value"/>
    <xsl:param name="style"/>
    <xsl:param name="check-value"/>

        <td align="middle"><form>
            <xsl:call-template name="build-style-start">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>

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
            <xsl:call-template name="build-style-end">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
        <br/></form></td>
</xsl:template>


<xsl:template name="grid-index">
    <xsl:param name="value"/>
    <xsl:param name="style"/>
        <td>
            <xsl:call-template name="build-style-start">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
               <xsl:value-of select="position()"/>
            <xsl:call-template name="build-style-end">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
        <br/></td>
</xsl:template>



<xsl:template name="grid-data-right">
    <xsl:param name="value"/>
    <xsl:param name="style"/>
        <td align="right">
            <xsl:call-template name="build-style-start">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
            <xsl:value-of select="$value"/>
            <xsl:call-template name="build-style-end">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
        <br/></td>
</xsl:template>

<xsl:template name="grid-data-barcode">
    <xsl:param name="value"/>
        <td width="35%" align="center" STYLE="font-family=CarolinaBar-B39-2.5-22x158x720;">*<xsl:value-of select="$value"/>*<br/></td>
</xsl:template>

<xsl:template name="grid-data-bib-info">
    <xsl:param name="value"/>
    <td>
    <xsl:variable name="bib" select="./bib-info"/>
    <xsl:if test="$value !='' ">
    <xsl:call-template name="generic-line">
       <xsl:with-param name="line" select="$value"/>
       <xsl:with-param name="grid" select="'grid'"/>
    </xsl:call-template>
    </xsl:if>
     <br/>
    </td>
</xsl:template>



<xsl:template name="grid-title">
      <xsl:param name="grid-title"/>
    <xsl:call-template name="table-close"/>
       <br/>
    <xsl:call-template name="table-open"/>

   <xsl:call-template name="table-start-row"/><td><b><xsl:value-of select="$grid-title"/></b></td><xsl:call-template name="table-end-row"/>
    <xsl:call-template name="table-close"/>
    <!--xsl:call-template name="grid-open"/-->
</xsl:template>

<xsl:template name="grid-title-nobold">
      <xsl:param name="grid-title"/>
    <xsl:call-template name="table-close"/>
       <br/>
    <xsl:call-template name="table-open"/>

   <xsl:call-template name="table-start-row"/><td><xsl:value-of select="$grid-title"/></td><xsl:call-template name="table-end-row"/>
    <xsl:call-template name="table-close"/>
    <!--xsl:call-template name="grid-open"/-->
</xsl:template>

<xsl:template name="grid-data-restart">
    <xsl:param name="value"/>
    <xsl:param name="style"/>
       <xsl:if test="$value!='' and position() !='1'">
           <xsl:call-template name="table-close"/>
           <xsl:call-template name="blank-line"/>
           <xsl:call-template name="grid-open"/>
       </xsl:if>
        <td><b>
            <xsl:call-template name="build-style-start">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
               <xsl:value-of select="$value"/>
            <xsl:call-template name="build-style-end">
                <xsl:with-param name="style" select="$style"/>
            </xsl:call-template>
        </b><br/></td>
</xsl:template>





<xsl:template name="display-grid-gen">
    <xsl:param name="value"/>
    <xsl:param name="type"/>
    <xsl:param name="label"/>
    <xsl:param name="header"/>
    <xsl:param name="style"/>
    <xsl:param name="check-value"/>

    <!-- Header -->
    <xsl:if test="$header ='header' ">
      <xsl:call-template name="grid-hdr">
          <xsl:with-param name="value" select="$label"/>
       </xsl:call-template>
     </xsl:if>

    <xsl:if test="$header ='' ">
    <!-- Regular -->
    <xsl:if test="$type ='index' ">
      <xsl:call-template name="grid-index">
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="style" select="$style"/>
       </xsl:call-template>
     </xsl:if>

    <!-- Index -->
    <xsl:if test="$type ='' ">
      <xsl:call-template name="grid-data">
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="style" select="$style"/>
       </xsl:call-template>
     </xsl:if>

    <!-- Right Aligned -->
    <xsl:if test="$type ='right' ">
      <xsl:call-template name="grid-data-right">
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="style" select="$style"/>
       </xsl:call-template>
     </xsl:if>

    <!-- Checkbox -->
    <xsl:if test="$type ='check' ">
      <xsl:call-template name="grid-data-check">
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="style" select="$style"/>
          <xsl:with-param name="check-value" select="$check-value"/>
       </xsl:call-template>
     </xsl:if>


    <!-- Barcode -->
    <xsl:if test="$type ='barcode' ">
      <xsl:call-template name="grid-data-barcode">
          <xsl:with-param name="value" select="$value"/>
       </xsl:call-template>
     </xsl:if>

    <!-- bib-info -->
    <xsl:if test="$type ='bib-info' ">
      <xsl:call-template name="grid-data-bib-info">
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="style" select="$style"/>
       </xsl:call-template>

    </xsl:if>

    <!-- Restart -->
    <xsl:if test="$type ='restart' ">
      <xsl:call-template name="grid-data-restart">
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="style" select="$style"/>
       </xsl:call-template>
     </xsl:if>
     </xsl:if>


</xsl:template>

<xsl:template name="start-grid">
    <xsl:param name="grid-title"/>
    <xsl:param name="width"/>
    <xsl:param name="nobold"/>

        <xsl:if test="$grid-title!='' and $nobold=''">
           <xsl:call-template name="grid-title">
              <xsl:with-param name="grid-title" select="$grid-title"/>
           </xsl:call-template>
        </xsl:if>
        <xsl:if test="$grid-title!='' and $nobold='nobold'">
           <xsl:call-template name="grid-title-nobold">
              <xsl:with-param name="grid-title" select="$grid-title"/>
           </xsl:call-template>
        </xsl:if>

        <xsl:if test="$grid-title=''">
             <br/>
        </xsl:if>
           <xsl:call-template name="grid-open">
              <xsl:with-param name="width" select="$width"/>
           </xsl:call-template>
</xsl:template>


</xsl:stylesheet>








