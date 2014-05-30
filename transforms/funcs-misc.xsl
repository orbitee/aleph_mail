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

<xsl:template name="display-grid-currency">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <xsl:param name="type"/>
    <xsl:param name="display"/>
    <xsl:param name="header"/>

    <!-- Header -->
    <xsl:if test="$header !='' ">
    <xsl:if test="$display !='' ">
      <xsl:call-template name="grid-hdr">
          <xsl:with-param name="value" select="$label"/>
       </xsl:call-template>
       </xsl:if>
     </xsl:if>

    <xsl:if test="$header ='' ">

    <!-- Regular -->

    <xsl:if test="$label !='' ">
     <xsl:if test="$type ='right' ">
      <xsl:call-template name="grid-data-right">
          <xsl:with-param name="value" select="$value"/>
       </xsl:call-template>
     </xsl:if>
     <xsl:if test="$type ='' ">
      <xsl:call-template name="grid-data">
          <xsl:with-param name="value" select="$value"/>
       </xsl:call-template>
     </xsl:if>
    </xsl:if>
     </xsl:if>

</xsl:template>






<xsl:template name="generic-line">
   <xsl:param name="line"/>
   <xsl:param name="style"/>
   <xsl:param name="no-first-time"/>
   <xsl:param name="grid"/>
   <xsl:param name="width"/>
   <xsl:variable name="first" select="substring-before($line,'##')"/>
   <xsl:variable name="rest" select="substring-after($line,'##')"/>
   <xsl:if test="$no-first-time='' and $grid='' ">
      <xsl:call-template name="table-close"/>
	<xsl:if test="$width=''">
	     <xsl:call-template name="table-open-full"/>
	</xsl:if>
	<xsl:if test="$width!=''">
	     <xsl:call-template name="table-open">
		<xsl:with-param name="width" select="$width"/>
		<xsl:with-param name="align" select="'left'"/>
	     </xsl:call-template>
	</xsl:if>
   </xsl:if>
   <xsl:if test="$grid='' ">
       <xsl:call-template name="open-row"/>
   </xsl:if>

      <xsl:call-template name="build-style-start">
          <xsl:with-param name="style" select="$style"/>
      </xsl:call-template>

       <xsl:choose>
             <xsl:when test="$grid='' and $line='salutation_string' or $first='salutation_string'">
                <br/><br/>Dear Sir/Ms,<br/><br/>
                <xsl:call-template name="close-row"/>
                <xsl:call-template name="generic-line">
                   <xsl:with-param name="line" select="$rest"/>
                   <xsl:with-param name="style" select="$style"/>
                   <xsl:with-param name="grid" select="$grid"/>
                   <xsl:with-param name="no-first-time" select="'y'"/>
                </xsl:call-template>
             </xsl:when>
             <xsl:when test="$grid='' and contains($line,'salutation_string')">
                <br/><br/>Dear Sir/Ms,<br/><br/>
                <xsl:call-template name="close-row"/>
                 <xsl:variable name="rest_salut" select="substring-after($line,'salutation_string')"/>
                <xsl:call-template name="generic-line">
                   <xsl:with-param name="line" select="$rest_salut"/>
                   <xsl:with-param name="style" select="$style"/>
                   <xsl:with-param name="grid" select="$grid"/>
                   <xsl:with-param name="no-first-time" select="'y'"/>
                </xsl:call-template>
             </xsl:when>
             <xsl:when test="$line='' or $line='##'">
                <br/>
             </xsl:when>
             <xsl:when test="not(contains($line, '##'))">
                <xsl:value-of select="$line"/><br/>
             </xsl:when>
             <xsl:when test="$first='' and $rest!=''">
                <xsl:if test="$grid='' ">
                  <br/>
                   <xsl:call-template name="close-row"/>
                </xsl:if>
                <xsl:call-template name="generic-line">
                   <xsl:with-param name="line" select="$rest"/>
                   <xsl:with-param name="style" select="$style"/>
                   <xsl:with-param name="grid" select="$grid"/>
                   <xsl:with-param name="no-first-time" select="'y'"/>
                </xsl:call-template>
             </xsl:when>
             <xsl:when test="$first!='' and $rest=''">
                <xsl:value-of select="$first"/>
                <xsl:if test="$grid='' ">
                   <br/><br/>
                </xsl:if>
             </xsl:when>
             <xsl:when test="$first!='' and $rest!=''">
                <xsl:value-of select="$first"/><br/>
                <xsl:if test="$grid='' ">
                   <xsl:call-template name="close-row"/>
                </xsl:if>
                <xsl:call-template name="generic-line">
                   <xsl:with-param name="line" select="$rest"/>
                   <xsl:with-param name="style" select="$style"/>
                   <xsl:with-param name="grid" select="$grid"/>
                   <xsl:with-param name="no-first-time" select="'y'"/>
                </xsl:call-template>
             </xsl:when>
       </xsl:choose>
      <xsl:call-template name="build-style-end">
          <xsl:with-param name="style" select="$style"/>
      </xsl:call-template>
   <xsl:if test="$grid='' ">
      <xsl:call-template name="open-row"/>
   </xsl:if>
</xsl:template>

<xsl:template name="process-urls">
    <xsl:param name="line"/>
    <xsl:variable name="first" select="substring-before($line,'http://')"/>
    <xsl:variable name="tmpurl"  select="substring-after($line,'http://')"/>
    <xsl:variable name="myurl" select="substring-before($tmpurl,' ')"/>
    <xsl:variable name="rest" select="substring-after($tmpurl,' ')"/>
    <xsl:value-of select="$first"/>
    <xsl:if test="contains($tmpurl,' ')">
       <xsl:variable name="url" select="concat('http://',$myurl)"/>
       <a href="{$url}"><xsl:value-of select="$url"/></a>
    </xsl:if>
    <xsl:if test="not(contains($tmpurl,' '))">
       <xsl:if test="'.' = substring($tmpurl,string-length($tmpurl))">
          <xsl:variable name="mylen" select="number(string-length($tmpurl)) - 1"/>
          <xsl:variable name="url" select="concat('http://',substring($tmpurl,1,$mylen))"/>
          <a href="{$url}"><xsl:value-of select="$url"/></a>.
       </xsl:if>
       <xsl:if test="not('.' = substring($tmpurl,string-length($tmpurl)))">
           <xsl:variable name="url" select="concat('http://',$tmpurl)"/>
           <a href="{$url}"><xsl:value-of select="$url"/></a>
       </xsl:if>
    </xsl:if>
    <xsl:if test="contains($rest, 'http://')">
             <xsl:call-template name="process-urls">
                   <xsl:with-param name="line" select="$rest"/>
             </xsl:call-template>
    </xsl:if>
    <xsl:if test="not(contains($rest, 'http://'))">
             <xsl:value-of select="$rest"/>
    </xsl:if>
</xsl:template>

<xsl:template name="generic-line-mit">
   <xsl:param name="line"/>
   <xsl:param name="style"/>
   <xsl:param name="no-first-time"/>
   <xsl:param name="grid"/>
   <xsl:param name="width"/>
<!--   <xsl:variable name="first" select="substring-before($line,'##')"/>
   <xsl:variable name="rest" select="substring-after($line,'##')"/>
   <xsl:if test="$no-first-time='' and $grid='' ">
      <xsl:call-template name="table-close"/>

	<xsl:if test="$width=''">
	     <xsl:call-template name="table-open-full"/>

	</xsl:if>
	<xsl:if test="$width!=''">
	     <xsl:call-template name="table-open">
		<xsl:with-param name="width" select="$width"/>
		<xsl:with-param name="align" select="'left'"/>
	     </xsl:call-template>

	</xsl:if>
   </xsl:if>
   <xsl:if test="$grid='' ">
       <xsl:call-template name="open-row"/>

   </xsl:if>-->
      <p style="font-family: arial; font-size: 9pt">
      <xsl:call-template name="build-style-start">
          <xsl:with-param name="style" select="$style"/>
      </xsl:call-template>
      <xsl:if test="contains($line, 'http://')">
             <xsl:call-template name="process-urls">
                   <xsl:with-param name="line" select="$line"/>
             </xsl:call-template>
      </xsl:if>
      <xsl:if test="not(contains($line, 'http://'))">
             <xsl:value-of select="$line"/>
      </xsl:if>
<!--       <xsl:choose>
             <xsl:when test="$line='' or $line='##'">
                <br/>
             </xsl:when>
             <xsl:when test="not(contains($line, '##'))">
                <xsl:value-of select="$line"/><br/>
             </xsl:when>
             <xsl:when test="$first='' and $rest!=''">
                <xsl:if test="$grid='' ">
                  <br/>
                   <xsl:call-template name="close-row"/>

                </xsl:if>
                <xsl:call-template name="generic-line">
                   <xsl:with-param name="line" select="$rest"/>
                   <xsl:with-param name="style" select="$style"/>
                   <xsl:with-param name="grid" select="$grid"/>
                   <xsl:with-param name="no-first-time" select="'y'"/>
                </xsl:call-template>
             </xsl:when>
             <xsl:when test="$first!='' and $rest=''">
                <xsl:value-of select="$first"/>
                <xsl:if test="$grid='' ">
                   <br/><br/>
                </xsl:if>
             </xsl:when>
             <xsl:when test="$first!='' and $rest!=''">
                <xsl:value-of select="$first"/><br/>
                <xsl:if test="$grid='' ">
                   <xsl:call-template name="close-row"/>

                </xsl:if>
                <xsl:call-template name="generic-line">
                   <xsl:with-param name="line" select="$rest"/>
                   <xsl:with-param name="style" select="$style"/>
                   <xsl:with-param name="grid" select="$grid"/>
                   <xsl:with-param name="no-first-time" select="'y'"/>
                </xsl:call-template>
             </xsl:when>
       </xsl:choose>-->
      <xsl:call-template name="build-style-end">
          <xsl:with-param name="style" select="$style"/>
      </xsl:call-template>
      </p>
<!--   <xsl:if test="$grid='' ">
      <xsl:call-template name="open-row"/>

   </xsl:if>-->
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
    <br/>
</xsl:template>


<xsl:template name="blank-line">
<br />
<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
<br />
</xsl:template>


<xsl:template name="blank-line-first">
    <xsl:if test="position()='1'">
       <br/>
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

<xsl:template name="requested-by-proxy">
   <xsl:param name="condition-field"/>
    <xsl:if test="$condition-field!=''">
     <xsl:call-template name="free-title">
         <xsl:with-param name="free-title" select="'Requested By:'"/>
     </xsl:call-template>
     <xsl:call-template name="display-gen">
         <xsl:with-param name="label" select="'Requester ID:'"/>
         <xsl:with-param name="value" select="./z37-requester-id"/>
     </xsl:call-template>

    </xsl:if>
</xsl:template>

</xsl:stylesheet>







