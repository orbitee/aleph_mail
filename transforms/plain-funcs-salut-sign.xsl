<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>





<xsl:template name="salutation-init-old">
   <xsl:param name="salutation"/>
   <xsl:param name="val1"/>
   <xsl:param name="val2"/>
   <xsl:param name="val3"/>
   <xsl:param name="val4"/>
     <xsl:call-template name="table-open-full"/>
     <!--TABLE WIDTH="100%" STYLE="font-size: 9pt; font-family: Arial"-->
     <xsl:call-template name="table-start-row"/><td>Dear Sir/Madam,</td><xsl:call-template name="table-end-row"/>
        <xsl:call-template name="salutation-vars">
            <xsl:with-param name="salutation" select="$salutation"/>
            <xsl:with-param name="val1" select="$val1"/>
            <xsl:with-param name="val2" select="$val2"/>
            <xsl:with-param name="val3" select="$val3"/>
            <xsl:with-param name="val4" select="$val4"/>
        </xsl:call-template>
      <!--/td-->
</xsl:template>


<xsl:template name="salutation-init">
   <xsl:param name="salutation"/>
     <xsl:call-template name="table-open-full"/>
     <xsl:call-template name="table-start-row"/><td>Dear Sir/Madam,</td><xsl:call-template name="table-end-row"/>
        <xsl:call-template name="generic-line">
            <xsl:with-param name="line" select="$salutation"/>
        </xsl:call-template>
</xsl:template>



<xsl:template name="salutation-end">
    <xsl:call-template name="table-close"/>
     <!--/TABLE-->
    
</xsl:template>


<xsl:template name="salutation-vars">
   <xsl:param name="salutation"/>
   <xsl:param name="val1"/>
   <xsl:param name="val2"/>
   <xsl:param name="val3"/>
   <xsl:param name="val4"/>
   <xsl:variable name="s1" select="substring-before($salutation,'$$$$')"/>
   <xsl:variable name="s1_rest" select="substring-after($salutation,'$$$$')"/>
   <xsl:variable name="s2" select="substring-before($s1_rest,'$$$$')"/>
   <xsl:variable name="s2_rest" select="substring-after($s1_rest,'$$$$')"/>
   <xsl:variable name="s3" select="substring-before($s2_rest,'$$$$')"/>
   <xsl:variable name="s3_rest" select="substring-after($s2_rest,'$$$$')"/>
   <xsl:variable name="s4" select="substring-before($s3_rest,'$$$$')"/>
   <xsl:variable name="s4_rest" select="substring-after($s3_rest,'$$$$')"/>
   <xsl:call-template name="table-start-row"/><td>
   <xsl:choose>
      <xsl:when test="$val1 = ''">
           <xsl:value-of select="$salutation"/>
      </xsl:when>
      <xsl:when test="$val1!='' and $val2=''">
           <xsl:value-of select="$s1"/>
           <xsl:value-of select="$val1"/>
           <xsl:value-of select="$s1_rest"/>
      </xsl:when>
      <xsl:when test="$val2 != '' and $val3=''">
           <xsl:value-of select="$s1"/>
           <xsl:value-of select="$val1"/>
           <xsl:value-of select="$s2"/>
           <xsl:value-of select="$val2"/>
           <xsl:value-of select="$s2_rest"/>
      </xsl:when>
      <xsl:when test="$val3!='' and $val4=''">
           <xsl:value-of select="$s1"/>
           <xsl:value-of select="$val1"/>
           <xsl:value-of select="$s2"/>
           <xsl:value-of select="$val2"/>
           <xsl:value-of select="$s3"/>
           <xsl:value-of select="$val3"/>
           <xsl:value-of select="$s3_rest"/>
      </xsl:when>
      <xsl:when test="$val4 != ''">
           <xsl:value-of select="$s1"/>
           <xsl:value-of select="$val1"/>
           <xsl:value-of select="$s2"/>
           <xsl:value-of select="$val2"/>
           <xsl:value-of select="$s3"/>
           <xsl:value-of select="$val3"/>
           <xsl:value-of select="$s4"/>
           <xsl:value-of select="$val4"/>
           <xsl:value-of select="$s4_rest"/>
      </xsl:when>
   </xsl:choose>
   </td><xsl:call-template name="table-end-row"/>
</xsl:template>

<xsl:template name="signature-gen">
     <xsl:param name="signature"/>
       <TABLE WIDTH="100%" style="font-family=arial; font-size=9pt">
     <xsl:call-template name="signature-lines">
        <xsl:with-param name="line" select="$signature"/>
    </xsl:call-template>
   </TABLE>
</xsl:template>

<xsl:template name="signature-lines">
   <xsl:param name="line"/>
   <xsl:variable name="first" select="substring-before($line,'##')"/>
   <xsl:variable name="rest" select="substring-after($line,'##')"/>
   <xsl:call-template name="table-start-row"/><td>
    <xsl:if test="$first = '' and $rest = '' ">
          
      </xsl:if>
   <xsl:if test="$first != ''">
       <xsl:value-of select="$first"/>
   </xsl:if>
   <xsl:if test="$rest != ''">
        <xsl:call-template name="signature-lines">
            <xsl:with-param name="line" select="$rest"/>
         </xsl:call-template>
   </xsl:if>
   <xsl:if test="$rest = '' and $line != ''">
      <xsl:value-of select="$line"/>
   </xsl:if>
   </td><xsl:call-template name="table-end-row"/>

</xsl:template>

</xsl:stylesheet>


