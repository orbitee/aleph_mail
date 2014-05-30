<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>

   <!--xsl:version="1.0"-->

<xsl:template name="display-not-empty-style">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="bold"/>
    <xsl:param name="italic"/>
    <xsl:param name="underline"/>
    <xsl:if test="$value !=''">
    <xsl:call-template name="table-start-row"/>
        <td width="40%"><b><xsl:value-of select="$label"/></b></td>
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
       </td>
    <xsl:call-template name="table-end-row"/>
     </xsl:if>
</xsl:template>

<xsl:template name="display-always-style">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="bold"/>
    <xsl:param name="italic"/>
    <xsl:param name="underline"/>
    <xsl:call-template name="table-start-row"/>
        <td width="40%"><b><xsl:value-of select="$label"/></b></td>
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
        </td>
    <xsl:call-template name="table-end-row"/>
</xsl:template>

<xsl:template name="display-not-empty-split-style">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="bold"/>
    <xsl:param name="italic"/>
    <xsl:param name="underline"/>
    <xsl:if test="$value !=''">
    <xsl:call-template name="table-start-row"/>
        <td width="40%"><b><xsl:value-of select="$label"/></b></td>
        <td>
            <xsl:call-template name="style-start">
               <xsl:with-param name="bold" select="$bold"/>
               <xsl:with-param name="italic" select="$italic"/>
               <xsl:with-param name="underline" select="$underline"/>
           </xsl:call-template>
                 <xsl:value-of select="$value"/></td>
           <xsl:call-template name="style-end">
               <xsl:with-param name="bold" select="$bold"/>
               <xsl:with-param name="italic" select="$italic"/>
               <xsl:with-param name="underline" select="$underline"/>
           </xsl:call-template>
    <xsl:call-template name="table-end-row"/>
     </xsl:if>
</xsl:template>

<xsl:template name="display-always-split-style">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="bold"/>
    <xsl:param name="italic"/>
    <xsl:param name="underline"/>
    <xsl:call-template name="table-start-row"/>
        <td width="40%"><b><xsl:value-of select="$label"/></b></td>
        <td>
           <xsl:call-template name="style-start">
               <xsl:with-param name="bold" select="$bold"/>
               <xsl:with-param name="italic" select="$italic"/>
               <xsl:with-param name="underline" select="$underline"/>
           </xsl:call-template>
              <xsl:value-of select="$value"/></td>
           <xsl:call-template name="style-end">
               <xsl:with-param name="bold" select="$bold"/>
               <xsl:with-param name="italic" select="$italic"/>
               <xsl:with-param name="underline" select="$underline"/>
           </xsl:call-template>
    <xsl:call-template name="table-end-row"/>
</xsl:template>




<xsl:template name="bib-info-hdr-style">
   <xsl:param name="line"/>
    <xsl:param name="bold"/>
    <xsl:param name="italic"/>
    <xsl:param name="underline"/>
    <xsl:call-template name="table-open-full"/>
     <td width="100%" colspan="2">
           <xsl:call-template name="style-start">
               <xsl:with-param name="bold" select="$bold"/>
               <xsl:with-param name="italic" select="$italic"/>
               <xsl:with-param name="underline" select="$underline"/>
           </xsl:call-template>
        <xsl:call-template name="bib-info">
            <xsl:with-param name="line" select="$line"/>
         </xsl:call-template>
           <xsl:call-template name="style-end">
               <xsl:with-param name="bold" select="$bold"/>
               <xsl:with-param name="italic" select="$italic"/>
               <xsl:with-param name="underline" select="$underline"/>
           </xsl:call-template>
    </td>
    <xsl:call-template name="table-close"/>
</xsl:template>




<xsl:template name="display-not-empty-barcode-style">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="bold"/>
    <xsl:param name="italic"/>
    <xsl:param name="underline"/>
    <xsl:if test="$value !=''">
    <xsl:call-template name="table-start-row"/>
        <td width="40%"><b><xsl:value-of select="$label"/></b></td>
        <td STYLE="font-family=CarolinaBar-B39-2.5-22x158x720;">*<xsl:value-of select="$value"/>*</td>
    <xsl:call-template name="table-end-row"/>
     </xsl:if>
</xsl:template>

<xsl:template name="display-always-barcode-style">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="bold"/>
    <xsl:param name="italic"/>
    <xsl:param name="underline"/>
    <xsl:call-template name="table-start-row"/>
        <td width="40%"><b><xsl:value-of select="$label"/></b></td>
        <td STYLE="font-family=CarolinaBar-B39-2.5-22x158x720;">*<xsl:value-of select="$value"/>*</td>
    <xsl:call-template name="table-end-row"/>
</xsl:template>

<xsl:template name="display-gen-style">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="display"/>
    <xsl:param name="type"/>
    <xsl:param name="bold"/>
    <xsl:param name="italic"/>
    <xsl:param name="underline"/>

    <!-- Regular -->
    <xsl:if test="$display =''  and $type = '' ">
      <xsl:call-template name="display-not-empty-style">
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="bold" select="$bold"/>
          <xsl:with-param name="italic" select="$italic"/>
          <xsl:with-param name="underline" select="$underline"/>
       </xsl:call-template>
     </xsl:if>


     <!-- Display label even if no data -->
   <xsl:if test="$display ='always'  and $type = ''">
      <xsl:call-template name="display-always-style">
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="bold" select="$bold"/>
          <xsl:with-param name="italic" select="$italic"/>
          <xsl:with-param name="underline" select="$underline"/>
       </xsl:call-template>
     </xsl:if>






    <!-- Regular  - align right-->
    <xsl:if test="$display =''  and $type = 'right'">
      <xsl:call-template name="display-not-empty-right-style">
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="bold" select="$bold"/>
          <xsl:with-param name="italic" select="$italic"/>
          <xsl:with-param name="underline" select="$underline"/>
       </xsl:call-template>
     </xsl:if>

     <!-- Display label even if no data - align right -->
   <xsl:if test="$display ='always'  and $type = 'right'">
      <xsl:call-template name="display-always-right-style">
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="bold" select="$bold"/>
          <xsl:with-param name="italic" select="$italic"/>
          <xsl:with-param name="underline" select="$underline"/>
       </xsl:call-template>
     </xsl:if>

    <!-- Regular - Barcode -->
    <xsl:if test="$display =''  and $type = 'barcode' ">
      <xsl:call-template name="display-not-empty-barcode-style">
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="bold" select="$bold"/>
          <xsl:with-param name="italic" select="$italic"/>
          <xsl:with-param name="underline" select="$underline"/>
       </xsl:call-template>
     </xsl:if>


     <!-- Display label even if no data - Barcode -->
   <xsl:if test="$display ='always'  and $type = 'barcode'">
      <xsl:call-template name="display-always-barcode-style">
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="value" select="$value"/>
          <xsl:with-param name="bold" select="$bold"/>
          <xsl:with-param name="italic" select="$italic"/>
          <xsl:with-param name="underline" select="$underline"/>
       </xsl:call-template>
     </xsl:if>



</xsl:template>

<xsl:template name="header-gen-style">
     <xsl:param name="title"/>
	 <xsl:text>&#xa;</xsl:text>
   <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8"/>
    <!--DIV  STYLE="font-size: 9pt; font-family: Arial"-->
      <TABLE WIDTH="100%" style="font-family=arial; font-size=9pt">
    <xsl:call-template name="table-start-row"/><td><SCRIPT LANGUAGE="JavaScript">document.write(Date())</SCRIPT></td><xsl:call-template name="table-end-row"/>
    <xsl:call-template name="table-start-row"/><td><xsl:value-of select="//form-name"/>-<xsl:value-of select="//form-format"/></td><xsl:call-template name="table-end-row"/>
     <xsl:call-template name="table-start-row"/><td width="100%" colspan="2"  STYLE="font-size: 12pt; font-family: Arial" ALIGN="CENTER"><b><xsl:value-of select="$title"/></b></td><xsl:call-template name="table-end-row"/>
   </TABLE>
</xsl:template>

<xsl:template name="signature-gen-style">
     <xsl:param name="signature"/>
       <TABLE WIDTH="100%" style="font-family=arial; font-size=9pt">
     <xsl:call-template name="bib-info">
        <xsl:with-param name="line" select="$signature"/>
    </xsl:call-template>
   </TABLE>
</xsl:template>






</xsl:stylesheet>


