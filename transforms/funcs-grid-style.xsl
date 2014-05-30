<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>

   <!--xsl:version="1.0"-->

<xsl:template name="grid-hdr-style">
    <xsl:param name="value"/>
    <xsl:param name="bold"/>
    <xsl:param name="italic"/>
    <xsl:param name="underline"/>
        <th>
           <xsl:call-template name="style-start">
               <xsl:with-param name="bold" select="$bold"/>
               <xsl:with-param name="italic" select="$italic"/>
               <xsl:with-param name="underline" select="$underline"/>
           </xsl:call-template>
           <xsl:value-of select="$value"/>
           <xsl:call-template name="style-end">
               <xsl:with-param name="bold" select="$bold"/>
               <xsl:with-param name="italic" select="$italic"/>
               <xsl:with-param name="underline" select="$underline"/>
           </xsl:call-template>
           </th>
</xsl:template>


<xsl:template name="style-start">
    <xsl:param name="bold"/>
    <xsl:param name="italic"/>
    <xsl:param name="underline"/>
           <xsl:if test="$bold ='bold' ">
                 <xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text>
           </xsl:if>
           <xsl:if test="$italic ='italic' ">
                 <xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text>
           </xsl:if>
           <xsl:if test="$underline ='underline' ">
                 <xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text>
           </xsl:if>
</xsl:template>
<xsl:template name="style-end">
    <xsl:param name="bold"/>
    <xsl:param name="italic"/>
    <xsl:param name="underline"/>
           <xsl:if test="$underline ='underline' ">
                 <xsl:text disable-output-escaping="yes">&lt;/u&gt;</xsl:text>
           </xsl:if>
           <xsl:if test="$italic ='italic' ">
                 <xsl:text disable-output-escaping="yes">&lt;/i&gt;</xsl:text>
           </xsl:if>
           <xsl:if test="$bold ='bold' ">
                 <xsl:text disable-output-escaping="yes">&lt;/b&gt;</xsl:text>
           </xsl:if>
</xsl:template>

<xsl:template name="grid-data-style">
    <xsl:param name="value"/>
    <xsl:param name="bold"/>
    <xsl:param name="italic"/>
    <xsl:param name="underline"/>
          
        <td>
           <xsl:call-template name="style-start">
               <xsl:with-param name="bold" select="$bold"/>
               <xsl:with-param name="italic" select="$italic"/>
               <xsl:with-param name="underline" select="$underline"/>
           </xsl:call-template>
               <xsl:value-of select="$value"/>
           <xsl:call-template name="style-end">
               <xsl:with-param name="bold" select="$bold"/>
               <xsl:with-param name="italic" select="$italic"/>
               <xsl:with-param name="underline" select="$underline"/>
           </xsl:call-template>
         <br/>
        </td>
</xsl:template>

<xsl:template name="grid-data-right-style">
    <xsl:param name="value"/>
    <xsl:param name="bold"/>
    <xsl:param name="italic"/>
    <xsl:param name="underline"/>
            <td align="right">
           <xsl:call-template name="style-start">
               <xsl:with-param name="bold" select="$bold"/>
               <xsl:with-param name="italic" select="$italic"/>
               <xsl:with-param name="underline" select="$underline"/>
           </xsl:call-template>
        <xsl:value-of select="$value"/>
           <xsl:call-template name="style-end">
               <xsl:with-param name="bold" select="$bold"/>
               <xsl:with-param name="italic" select="$italic"/>
               <xsl:with-param name="underline" select="$underline"/>
           </xsl:call-template>
         <br/></td>
</xsl:template>

<xsl:template name="grid-data-barcode-style">
    <xsl:param name="value"/>
        <td align="center" STYLE="font-family=CarolinaBar-B39-2.5-22x158x720;">*<br/><xsl:value-of select="$value"/>*</td>
</xsl:template>

<xsl:template name="grid-data-bib-info-style">
    <xsl:param name="value"/>
    <xsl:param name="bold"/>
    <xsl:param name="italic"/>
    <xsl:param name="underline"/>
    <td>
           <xsl:call-template name="style-start">
               <xsl:with-param name="bold" select="$bold"/>
               <xsl:with-param name="italic" select="$italic"/>
               <xsl:with-param name="underline" select="$underline"/>
           </xsl:call-template>
    <xsl:variable name="bib" select="./bib-info"/>
    <xsl:if test="$bib !='' ">
    <xsl:call-template name="bib-info">
       <xsl:with-param name="line" select="./bib-info"/>
    </xsl:call-template>
    </xsl:if>
           <xsl:call-template name="style-end">
               <xsl:with-param name="bold" select="$bold"/>
               <xsl:with-param name="italic" select="$italic"/>
               <xsl:with-param name="underline" select="$underline"/>
           </xsl:call-template>
    </td>
</xsl:template>

<xsl:template name="display-grid-gen-style">
    <xsl:param name="value"/>
    <xsl:param name="type"/>
    <xsl:param name="bold"/>
    <xsl:param name="italic"/>
    <xsl:param name="underline"/>

    <!-- Regular -->
    <xsl:if test="$type ='' ">
      <xsl:call-template name="grid-data-style">
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="bold" select="$bold"/>
          <xsl:with-param name="italic" select="$italic"/>
          <xsl:with-param name="underline" select="$underline"/>
       </xsl:call-template>
     </xsl:if>

    <!-- Header -->
    <xsl:if test="$type ='header' ">
      <xsl:call-template name="grid-hdr-style">
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="bold" select="$bold"/>
          <xsl:with-param name="italic" select="$italic"/>
          <xsl:with-param name="underline" select="$underline"/>
       </xsl:call-template>
     </xsl:if>

    <!-- Right Aligned -->
    <xsl:if test="$type ='right' ">
      <xsl:call-template name="grid-data-right-style">
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="bold" select="$bold"/>
          <xsl:with-param name="italic" select="$italic"/>
          <xsl:with-param name="underline" select="$underline"/>
       </xsl:call-template>
     </xsl:if>


    <!-- Barcode -->
    <xsl:if test="$type ='barcode' ">
      <xsl:call-template name="grid-data-barcode-style">
          <xsl:with-param name="value" select="$value"/>
       </xsl:call-template>
     </xsl:if>

    <!-- bib-info -->
    <xsl:if test="$type ='bib-info' ">
      <xsl:call-template name="grid-data-bib-info-style">
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="bold" select="$bold"/>
          <xsl:with-param name="italic" select="$italic"/>
          <xsl:with-param name="underline" select="$underline"/>
       </xsl:call-template>
       <br/>
    </xsl:if>

</xsl:template>



</xsl:stylesheet>

