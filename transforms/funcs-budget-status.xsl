<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>


<xsl:template name="budget-paid-unpaid-hdr">
<xsl:call-template name="table-start-row"/>
    <xsl:call-template name="display-grid-gen">
       <xsl:with-param name="label" select="'Type'"/>
       <xsl:with-param name="header" select="'header'"/>
    </xsl:call-template>
    <xsl:call-template name="display-grid-gen">
       <xsl:with-param name="label" select="'Paid'"/>
       <xsl:with-param name="header" select="'header'"/>
    </xsl:call-template>
    <xsl:call-template name="display-grid-gen">
       <xsl:with-param name="label" select="'Unpaid'"/>
       <xsl:with-param name="header" select="'header'"/>
    </xsl:call-template>
<xsl:call-template name="table-end-row"/>
</xsl:template>
    <!--SECTION-02  (GRID - DATA)-->

<xsl:template name="budget-paid-unpaid-data">
    <xsl:param name="type"/>
    <xsl:param name="paid"/>
    <xsl:param name="not-paid"/>
   <xsl:call-template name="open-row-cond">
        <xsl:with-param name="display" select="$type"/>
    </xsl:call-template>
    <xsl:if test="$type!=''">
    <xsl:call-template name="display-grid-gen">
       <xsl:with-param name="value" select="$type"/>
    </xsl:call-template>
    <xsl:call-template name="display-grid-gen">
       <xsl:with-param name="value" select="$paid"/>
       <xsl:with-param name="type" select="'right'"/>
    </xsl:call-template>
    <xsl:call-template name="display-grid-gen">
       <xsl:with-param name="value" select="$not-paid"/>
       <xsl:with-param name="type" select="'right'"/>
    </xsl:call-template>
    </xsl:if>
   <xsl:call-template name="close-row-cond">
        <xsl:with-param name="display" select="$type"/>
    </xsl:call-template>
</xsl:template>

<xsl:template name="budget-paid-unpaid">
  <xsl:if test="concat(./type-1, ./paid-1, ./not-paid-1) != ''">
       <xsl:call-template name="grid-title">
           <xsl:with-param name="grid-title" select="'Object Codes'"/>
       </xsl:call-template>
    <xsl:call-template name="grid-open"/>
    <xsl:call-template name="budget-paid-unpaid-hdr"/>
    <xsl:call-template name="budget-paid-unpaid-data">
       <xsl:with-param name="type" select="./type-1"/>
       <xsl:with-param name="paid" select="./paid-1"/>
       <xsl:with-param name="not-paid" select="./not-paid-1"/>
    </xsl:call-template>
    <xsl:call-template name="budget-paid-unpaid-data">
       <xsl:with-param name="type" select="./type-2"/>
       <xsl:with-param name="paid" select="./paid-2"/>
       <xsl:with-param name="not-paid" select="./not-paid-2"/>
    </xsl:call-template>
    <xsl:call-template name="budget-paid-unpaid-data">
       <xsl:with-param name="type" select="./type-3"/>
       <xsl:with-param name="paid" select="./paid-3"/>
       <xsl:with-param name="not-paid" select="./not-paid-3"/>
    </xsl:call-template>
    <xsl:call-template name="budget-paid-unpaid-data">
       <xsl:with-param name="type" select="./type-4"/>
       <xsl:with-param name="paid" select="./paid-4"/>
       <xsl:with-param name="not-paid" select="./not-paid-4"/>
    </xsl:call-template>
    <xsl:call-template name="budget-paid-unpaid-data">
       <xsl:with-param name="type" select="./type-5"/>
       <xsl:with-param name="paid" select="./paid-5"/>
       <xsl:with-param name="not-paid" select="./not-paid-5"/>
    </xsl:call-template>
    <xsl:call-template name="budget-paid-unpaid-data">
       <xsl:with-param name="type" select="./type-6"/>
       <xsl:with-param name="paid" select="./paid-6"/>
       <xsl:with-param name="not-paid" select="./not-paid-6"/>
    </xsl:call-template>
    <xsl:call-template name="budget-paid-unpaid-data">
       <xsl:with-param name="type" select="./type-7"/>
       <xsl:with-param name="paid" select="./paid-7"/>
       <xsl:with-param name="not-paid" select="./not-paid-7"/>
    </xsl:call-template>
    <xsl:call-template name="budget-paid-unpaid-data">
       <xsl:with-param name="type" select="./type-8"/>
       <xsl:with-param name="paid" select="./paid-8"/>
       <xsl:with-param name="not-paid" select="./not-paid-8"/>
    </xsl:call-template>
    <xsl:call-template name="budget-paid-unpaid-data">
       <xsl:with-param name="type" select="./type-9"/>
       <xsl:with-param name="paid" select="./paid-9"/>
       <xsl:with-param name="not-paid" select="./not-paid-9"/>
    </xsl:call-template>
    <xsl:call-template name="budget-paid-unpaid-data">
       <xsl:with-param name="type" select="./type-10"/>
       <xsl:with-param name="paid" select="./paid-10"/>
       <xsl:with-param name="not-paid" select="./not-paid-10"/>
    </xsl:call-template>
    <xsl:call-template name="budget-paid-unpaid-data">
       <xsl:with-param name="type" select="./type-11"/>
       <xsl:with-param name="paid" select="./paid-11"/>
       <xsl:with-param name="not-paid" select="./not-paid-11"/>
    </xsl:call-template>
    <xsl:call-template name="budget-paid-unpaid-data">
       <xsl:with-param name="type" select="./type-12"/>
       <xsl:with-param name="paid" select="./paid-12"/>
       <xsl:with-param name="not-paid" select="./not-paid-12"/>
    </xsl:call-template>
    <xsl:call-template name="budget-paid-unpaid-data">
       <xsl:with-param name="type" select="./type-13"/>
       <xsl:with-param name="paid" select="./paid-13"/>
       <xsl:with-param name="not-paid" select="./not-paid-13"/>
    </xsl:call-template>
    <xsl:call-template name="budget-paid-unpaid-data">
       <xsl:with-param name="type" select="./type-14"/>
       <xsl:with-param name="paid" select="./paid-14"/>
       <xsl:with-param name="not-paid" select="./not-paid-14"/>
    </xsl:call-template>
    <xsl:call-template name="budget-paid-unpaid-data">
       <xsl:with-param name="type" select="./type-15"/>
       <xsl:with-param name="paid" select="./paid-15"/>
       <xsl:with-param name="not-paid" select="./not-paid-15"/>
    </xsl:call-template>
    <xsl:call-template name="budget-paid-unpaid-data">
       <xsl:with-param name="type" select="./type-16"/>
       <xsl:with-param name="paid" select="./paid-16"/>
       <xsl:with-param name="not-paid" select="./not-paid-16"/>
    </xsl:call-template>
    <xsl:call-template name="budget-paid-unpaid-data">
       <xsl:with-param name="type" select="./type-17"/>
       <xsl:with-param name="paid" select="./paid-17"/>
       <xsl:with-param name="not-paid" select="./not-paid-17"/>
    </xsl:call-template>
    <xsl:call-template name="budget-paid-unpaid-data">
       <xsl:with-param name="type" select="./type-18"/>
       <xsl:with-param name="paid" select="./paid-18"/>
       <xsl:with-param name="not-paid" select="./not-paid-18"/>
    </xsl:call-template>
    <xsl:call-template name="budget-paid-unpaid-data">
       <xsl:with-param name="type" select="./type-19"/>
       <xsl:with-param name="paid" select="./paid-19"/>
       <xsl:with-param name="not-paid" select="./not-paid-19"/>
    </xsl:call-template>
    <xsl:call-template name="budget-paid-unpaid-data">
       <xsl:with-param name="type" select="./type-20"/>
       <xsl:with-param name="paid" select="./paid-20"/>
       <xsl:with-param name="not-paid" select="./not-paid-20"/>
    </xsl:call-template>
    <xsl:call-template name="table-close"/>
  </xsl:if>
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

</xsl:stylesheet>



