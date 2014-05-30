<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>

   <!--xmlns:saxon="http://icl.com/saxon"-->
<xsl:output method="xml" indent="yes"/>

   <!--xmlns:date="http://exslt.org/dates-and-times"-->
<xsl:output method="xml" indent="yes"/>

   <!--xsl:version="1.0"-->



<xsl:template name="open-row-cond">
    <xsl:param name="display"/>
    <xsl:if test="$display !='' ">
      <xsl:text disable-output-escaping="yes">&lt;tr&gt;</xsl:text>
    </xsl:if>
</xsl:template>

<xsl:template name="close-row-cond">
    <xsl:param name="display"/>
    <xsl:if test="$display !='' ">
      <xsl:text disable-output-escaping="yes">&lt;/tr&gt;</xsl:text>
    </xsl:if>
</xsl:template>


<xsl:template name="tst-loop-main">
          <xsl:param name="max"/>
          <xsl:param name="cur"/>
          <xsl:variable name="start" select="1"/>
              <xsl:call-template name="tst-loop">
                 <xsl:with-param name="max" select="$max"/>
                 <xsl:with-param name="cur" select="'1'"/>
              </xsl:call-template>

</xsl:template>
<xsl:template name="tst-loop">
          <xsl:param name="max"/>
          <xsl:param name="cur"/>
          <xsl:param name="pref"/>
          <xsl:param name="type"/>
           <xsl:if test="$type='header'">
               <xsl:text disable-output-escaping="yes">&lt;th&gt;</xsl:text>
           </xsl:if>
           <xsl:if test="$type=''">
               <xsl:text disable-output-escaping="yes">&lt;td align="right"&gt;</xsl:text>
           </xsl:if>


               <!--th--><!--xsl:value-of select="date:date()"/--><!--xsl:value-of select="saxon:eval(saxon:expression(concat('./', $pref, $cur)))"/--><!--/th-->
           <xsl:if test="$type=''">
               <xsl:text disable-output-escaping="yes">&lt;/td&gt;</xsl:text>
           </xsl:if>
           <xsl:if test="$type='header'">
               <xsl:text disable-output-escaping="yes">&lt;/th&gt;</xsl:text>
           </xsl:if>
           <xsl:if test="$cur &lt; $max">
              <xsl:call-template name="tst-loop">
                 <xsl:with-param name="max" select="$max"/>
                 <xsl:with-param name="cur" select="number($cur + 1)"/>
                 <xsl:with-param name="pref" select="$pref"/>
                 <xsl:with-param name="type" select="$type"/>
              </xsl:call-template>
          </xsl:if>
</xsl:template>
<xsl:template name="tst-loop-data">
          <xsl:param name="max"/>
          <xsl:param name="cur"/>
          <xsl:param name="pref"/>
           <xsl:variable name="val" select="concat('//currency-', $cur)"/>
           <xsl:variable name="start" select="'/'"/>
             <!--xsl:value-of select="$cur"/-->
               <td align="right"><!--xsl:value-of select="saxon:eval(saxon:expression(concat('./', $pref, $cur)))"/--></td>
             <!--saxon:evaluate($val)/-->
           <xsl:if test="$cur &lt; $max">
              <xsl:call-template name="tst-loop-data">
                 <xsl:with-param name="max" select="$max"/>
                 <xsl:with-param name="cur" select="number($cur + 1)"/>
                 <xsl:with-param name="pref" select="$pref"/>
              </xsl:call-template>
          </xsl:if>
</xsl:template>

<xsl:template name="budget-nums-hdr">
<xsl:call-template name="table-start-row"/>
    <xsl:call-template name="display-grid-gen">
       <xsl:with-param name="value" select="'Budgets'"/>
       <xsl:with-param name="type" select="'header'"/>
    </xsl:call-template>
<xsl:call-template name="table-end-row"/>
</xsl:template>
<xsl:template name="budget-nums-data">
    <xsl:param name="budget-num"/>
<xsl:call-template name="table-start-row"/>
    <xsl:if test="$budget-num!=''">
    <xsl:call-template name="display-grid-gen">
       <xsl:with-param name="value" select="$budget-num"/>
    </xsl:call-template>
    </xsl:if>
<xsl:call-template name="table-end-row"/>
</xsl:template>
<xsl:template name="budget-num">
    <xsl:call-template name="budget-nums-hdr"/>
    <xsl:call-template name="budget-nums-data">
       <xsl:with-param name="type" select="./budget-number-1"/>
    </xsl:call-template>
    <xsl:call-template name="budget-nums-data">
       <xsl:with-param name="type" select="./budget-number-2"/>
    </xsl:call-template>
    <xsl:call-template name="budget-nums-data">
       <xsl:with-param name="type" select="./budget-number-3"/>
    </xsl:call-template>
    <xsl:call-template name="budget-nums-data">
       <xsl:with-param name="type" select="./budget-number-4"/>
    </xsl:call-template>
    <xsl:call-template name="budget-nums-data">
       <xsl:with-param name="type" select="./budget-number-5"/>
    </xsl:call-template>
</xsl:template>





<xsl:template name="generic-line">
   <xsl:param name="line"/>
   <xsl:param name="style"/>
   <xsl:param name="no-first-time"/>
   <xsl:param name="grid"/>
	<xsl:if test="$line = 'salutation_string'">
	<xsl:call-template name="new-line"/>
	<xsl:text>Dear Sir/Ms,</xsl:text>
	</xsl:if>
	<xsl:if test="$line != 'salutation_string'">
            <xsl:value-of select="$line"/>
	</xsl:if>
	<xsl:call-template name="new-line"/>
</xsl:template>

<xsl:template name="generic-line-mit">
   <xsl:param name="line"/>
   <xsl:param name="style"/>
   <xsl:param name="no-first-time"/>
   <xsl:param name="grid"/>
	<xsl:if test="$line = 'salutation_string'">
	<xsl:call-template name="new-line"/>
	<xsl:text>Dear Sir/Ms,</xsl:text>
	</xsl:if>
	<xsl:if test="$line != 'salutation_string'">
            <xsl:value-of select="$line"/>
	</xsl:if>
	<xsl:call-template name="new-line"/>
        <xsl:call-template name="blank-line"/>
</xsl:template>

<xsl:template name="close-row">
    <xsl:param name="display"/>
    <xsl:if test="$display !='' ">
      <xsl:text disable-output-escaping="yes">&lt;/td&gt;&lt;/tr&gt;</xsl:text>
    </xsl:if>
</xsl:template>

<xsl:template name="open-row">
      <xsl:text disable-output-escaping="yes">&lt;tr&gt;&lt;td&gt;</xsl:text>
</xsl:template>


<xsl:template name="build-style-start">
   <xsl:param name="style"/>
      <xsl:if test="contains($style, 'bold')"><xsl:text disable-output-escaping="yes">&lt;b&gt;</xsl:text></xsl:if>
      <xsl:if test="contains($style, 'italic')"><xsl:text disable-output-escaping="yes">&lt;i&gt;</xsl:text></xsl:if>
      <xsl:if test="contains($style, 'underline')"><xsl:text disable-output-escaping="yes">&lt;u&gt;</xsl:text></xsl:if>
</xsl:template>

<xsl:template name="build-style-end">
   <xsl:param name="style"/>
      <xsl:if test="contains($style, 'bold')"><xsl:text disable-output-escaping="yes">&lt;b/&gt;</xsl:text></xsl:if>
      <xsl:if test="contains($style, 'italic')"><xsl:text disable-output-escaping="yes">&lt;i/&gt;</xsl:text></xsl:if>
      <xsl:if test="contains($style, 'underline')"><xsl:text disable-output-escaping="yes">&lt;u/&gt;</xsl:text></xsl:if>
</xsl:template>

<xsl:template name="salutation-end">
    <xsl:call-template name="table-close"/>
     <!--/TABLE-->
    
</xsl:template>


<xsl:template name="blank-line">
    <xsl:call-template name="new-line"/>
</xsl:template>

<xsl:template name="blank-line-first">
    <xsl:if test="position()='1'">
       
    </xsl:if>
</xsl:template>

<xsl:template name="blank-line-in-free">
    <xsl:param name="lines"/>
    <xsl:param name="first-time"/>
    <xsl:if test="$first-time = ''">
        <xsl:call-template name="table-close"/>
    </xsl:if>
    <xsl:if test="$lines = '' or $lines = '1'">
           <xsl:call-template name="blank-line"/>
           <xsl:call-template name="table-open"/>
    </xsl:if>
    <xsl:if test="$lines != '' and $lines != '1'">
           <xsl:call-template name="blank-line"/>
            <xsl:call-template name="blank-line-in-free">
                <xsl:with-param name="lines" select="number($lines - 1)"/>
                <xsl:with-param name="first-time" select="no"/>
            </xsl:call-template>
    </xsl:if>
</xsl:template>


<xsl:template name="checkbox">
    <xsl:param name="text"/>
         <form>
    <xsl:call-template name="table-open"/>
    <xsl:call-template name="table-start-row"/>
        <td width = "20%">
        <b><xsl:value-of select="$text"/></b></td>
        <td>
            <input type="checkbox"/>
        </td>
    <xsl:call-template name="table-end-row"/>
    <xsl:call-template name="table-close"/>
    </form>
</xsl:template>


<xsl:template name="directly-to-patron">
    <xsl:if test="./z302-address-1 != ''">
     <xsl:call-template name="table-open"/>
     <xsl:call-template name="display-gen">
       <xsl:with-param name="label" select="'Send Directly to:'"/>
       <xsl:with-param name="value" select="''"/>
       <xsl:with-param name="display" select="'always'"/>
     </xsl:call-template>
     <xsl:call-template name="patron-address"/>
     <xsl:call-template name="table-close"/>
    </xsl:if>
</xsl:template>

</xsl:stylesheet>





