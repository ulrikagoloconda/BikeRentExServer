<?xml Version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	Version="1.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Statfilen</title>
				
                <style>
				tr:nth-child(even) {
					background-color: #d3d3d3;
				}
				</style>

			</head>
			<body>
				<table class="MsoNormalTable" border="0" cellpadding="0"
					width="100%"
					style='width:100.0%;mso-cellspacing:1.5pt;background:#FF0B0A;mso-yfti-tbllook:
 1184;mso-padding-alt:0cm 5.4pt 0cm 5.4pt'>


					<th>
					    <img src="../bilder/loggo.png"> </img>  						
							<br>
								<small>
									<small>Serviceanm&auml;lan:
										070-321321
									</small>
								</small>
							</br>
						
					</th>
					<th>

						<big>
							<big>
								<big><big>
									- Statfil &nbsp; <xsl:value-of select="response/datetime" /> &nbsp; -
								</big></big>
							</big>
						</big>
						<br>
							<small>
								<small>Statfilgenererad:
								</small>
							</small>
							<xsl:if test="response/status &gt; 0">
								<img src="../bilder/theokpic.png" style="width:15px;height:15px;" />
							</xsl:if>
							<xsl:if test="response/status = 0">
								<img src="../bilder/theerrorpic.png" style="width:25px;height:25px;" />
							</xsl:if>

						</br>
					</th>
					<th>
						<tr />
					</th>
				</table>
				<br />


<table class="MsoNormalTable1" border="0" cellpadding="0"
					>
					<td>
					
				<xsl:choose>
					<xsl:when
						test="
   				response/bikescondition/total > 10 
   				and response/bikescondition/avalible > 50 
   				and response/bikescondition/usable > 70
   				and response/bikescondition/maintenance < 10">

						<img src="../bilder/thetrafficgreen.png" />
						<!-- do something -->
					</xsl:when>
					<xsl:when
						test="
   				response/bikescondition/total > 0 
   				and response/bikescondition/avalible > 30 
   				and response/bikescondition/usable > 40
   				and response/bikescondition/maintenance < 20">

						<img src="../bilder/thetrafficyellow.png" />
						<!-- do something -->
					</xsl:when>
					<xsl:when
						test="
   				response/systemstatus/activeloans = 0 
   				and response/bikescondition/avalible > 20 
   				and response/bikescondition/usable > 40
   				and response/bikescondition/maintenance < 12">

						<img src="../bilder/thetrafficyellow.png" />
						<!-- do something -->
					</xsl:when>
					
					<xsl:otherwise>
						
						<!-- do something else -->
						<img src="../bilder/thetrafficred.png" />

					</xsl:otherwise>
				</xsl:choose>
				
</td>
					<td>
						<xsl:choose>
					<xsl:when
						test="response/generatedby">
						<!-- do something -->
						<br />
						
							<em><small>
									<small style="background:#bfff00;"><b>Generarat av</b></small>
									</small></em>
						<br />
							<em><small>
									<small style="background:#bfff00;"> <b>Användarnamn: </b><xsl:value-of select="response/generatedby" /></small>
									</small></em>
									
						</xsl:when>
				<xsl:otherwise>
						
						<!-- do something else -->
						
									

					</xsl:otherwise>
				</xsl:choose>		
					</td>
					
				</table>

				<br />
				
	<em> &nbsp;  &nbsp;   Antalet cyklar: <xsl:value-of select="response/bikescondition/total" /> st</em>


				<table border="1">
					<tr style="background:#FF0B0A;">
						<th>  &nbsp;  Översikt &nbsp;    &nbsp;  </th>
						<th> &nbsp;  Antal  &nbsp; </th>
						<th> &nbsp; fig.</th>
					</tr>

					<tr>
						<td> &nbsp; Tillgängliga</td>
						<td>
							<center>
								<xsl:value-of select="response/bikescondition/avalible" />
							</center>
						</td>
						<td>
							<xsl:choose>
								<xsl:when test="response/bikescondition/avalible > 50">
									<img src="../bilder/theokpic.png" style="width:35px;height:35px;" />
								</xsl:when>
								<xsl:otherwise>
									<img src="../bilder/theerrorpic.png" style="width:35px;height:35px;" />
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>

					<tr>
						<td> &nbsp; Användbara</td>
						<td>
							<center>
								<xsl:value-of select="response/bikescondition/usable" />
							</center>
						</td>
						<td>
							<xsl:choose>
								<xsl:when test="response/bikescondition/usable > 70">
									<img src="../bilder/theokpic.png" style="width:35px;height:35px;" />
								</xsl:when>
								<xsl:otherwise>
									<img src="../bilder/theerrorpic.png" style="width:35px;height:35px;" />
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>

					<tr>
						<td> &nbsp; På Service</td>
						<td>
							<center>
								<xsl:value-of select="response/bikescondition/maintenance" />
							</center>
						</td>
						<td>


							<xsl:choose>
								<xsl:when test="response/bikescondition/maintenance < 10">
									<img src="../bilder/theokpic.png" style="width:35px;height:35px;" />
								</xsl:when>
								<xsl:otherwise>
									<img src="../bilder/thewarningpic.png" style="width:35px;height:35px;" />
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>

					<tr>
						<td> &nbsp; Avvecklade cyklar</td>
						<td>
							<center>
								<xsl:value-of select="response/bikescondition/disabled" />
							</center>
						</td>
						<td>
							<xsl:choose>
								<xsl:when test="response/bikescondition/disabled < 10">
									<img src="../bilder/theokpic.png" style="width:35px;height:35px;" />
								</xsl:when>
								<xsl:when test="response/bikescondition/disabledl > 90">
									<img src="../bilder/theerrorpic.png" style="width:35px;height:35px;" />
								</xsl:when>

								<xsl:otherwise>
									<img src="../bilder/thewarningpic.png" style="width:35px;height:35px;" />
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>

					<tr>
						<td> &nbsp; Antal lån 
							  de senast 30 dagarna &nbsp; </td>
						<td>
							<center>
								<xsl:value-of select="response/userstatus/totalloans30day" />
							</center>
						</td>
						<td>
							<xsl:choose>
								<xsl:when test="response/userstatus/totalloans30day > 10">
									<img src="../bilder/theokpic.png" style="width:35px;height:35px;" />
								</xsl:when>
								<xsl:when test="response/userstatus/totalloans30day < 4">
									<img src="../bilder/theerrorpic.png" style="width:35px;height:35px;" />
								</xsl:when>

								<xsl:otherwise>
									<img src="../bilder/thewarningpic.png" style="width:35px;height:35px;" />
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>

				</table>
				<br />
				<!-- LINJE -->
				<hr />
				<!-- LINJE slut -->

				
								

<!-- sidbrytning start-->
<center>vv se nästa sida</center><br />
 &nbsp; 
<div style="page-break-after: always"><span style="display: none;"> &nbsp; </span></div>
<!-- sidbrytning slut -->


				<table class="MsoNormalTable" border="0" cellpadding="0"
					width="100%"
					style='width:100.0%;mso-cellspacing:1.5pt;background:#FF0B0A;mso-yfti-tbllook:
 1184;mso-padding-alt:0cm 5.4pt 0cm 5.4pt'>


					<th>
						<img src="../bilder/loggo.png">
							<br>
								<small>
									<small>Serviceanm&auml;lan:
										070-321321
									</small>
								</small>
							</br>
						</img>
					</th>
					<th>

						<big>
							<big>
								<big><big>
									- Statfil &nbsp; <xsl:value-of select="response/datetime" /> &nbsp; -
								</big></big>
							</big>
						</big>
					</th>
					<th>
						<tr />
					</th>
				</table>
				<br />
<!-- sidbrytning end -->



<!-- 
<br/>
Totalt antal lån:  &nbsp; <xsl:value-of select="response/userstatus/totalloans30day" /> &nbsp;
      
    <table class="MsoNormalTable" border="1" cellpadding="1" cellspacing="1">
		<tr>
			<td style="background-color:#FFD701;"><strong>100</strong></td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/maleloans30day &gt; 95">
			<img src="../bilder/male.gif"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/femaleloans30day &gt; 95">
			<img src="../bilder/other.gif"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/otherloans30day &gt; 95">
			<img src="../bilder/other.gif"/>
			</xsl:if>
			</td>
		</tr>
		<tr>
			<td style="background-color:#FFD700;"><strong>&nbsp; 90</strong></td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/maleloans30day &gt; 85">
			<img src="../bilder/male.gif"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/femaleloans30day &gt; 85">
			<img src="../bilder/other.gif"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/otherloans30day &gt; 85">
			<img src="../bilder/other.gif"/>
			</xsl:if>
			</td>
		</tr>
		<tr>
			<td style="background-color:#FFD700;"><strong>&nbsp; 80</strong></td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/maleloans30day &gt; 75">
			<img src="../bilder/male.gif"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/femaleloans30day &gt; 75">
			<img src="../bilder/other.gif"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/otherloans30day &gt; 75">
			<img src="../bilder/other.gif"/>
			</xsl:if>
			</td>
		</tr>
		<tr>
			<td style="background-color:#FFD700;"><strong>&nbsp; 70</strong></td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/maleloans30day &gt; 65">
			<img src="../bilder/male.gif"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/femaleloans30day &gt; 65">
			<img src="../bilder/other.gif"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/otherloans30day &gt; 65">
			<img src="../bilder/other.gif"/>
			</xsl:if>
			</td>
		</tr>
		<tr>
			<td style="background-color:#FFD700;"><strong>&nbsp; 60</strong></td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/maleloans30day &gt; 55">
			<img src="../bilder/male.gif"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/femaleloans30day &gt; 55">
			<img src="../bilder/other.gif"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/otherloans30day &gt; 55">
			<img src="../bilder/other.gif"/>
			</xsl:if>
			</td>
		</tr>
		<tr>
			<td style="background-color:#FFD700;"><strong>&nbsp; 50</strong></td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/maleloans30day &gt; 45">
			<img src="../bilder/male.gif"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/femaleloans30day &gt; 45">
			<img src="../bilder/other.gif"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/otherloans30day &gt; 45">
			<img src="../bilder/other.gif"/>
			</xsl:if>
			</td>
		</tr>
		<tr>
			<td style="background-color:#FFD700;"><strong>&nbsp; 40</strong></td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/maleloans30day &gt; 35">
			<img src="../bilder/male.gif"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/femaleloans30day &gt; 35">
			<img src="../bilder/other.gif"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/otherloans30day &gt; 35">
			<img src="../bilder/other.gif"/>
			</xsl:if>
			</td>
		</tr>
		<tr>
			<td style="background-color:#FFD700;"><strong>&nbsp; 30</strong></td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/maleloans30day &gt; 25">
			<img src="../bilder/male.gif"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/femaleloans30day &gt; 25">
			<img src="../bilder/other.gif"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/otherloans30day &gt; 25">
			<img src="../bilder/other.gif"/>
			</xsl:if>
			</td>
		</tr>
		<tr>
			<td style="background-color:#FFD700;"><strong>&nbsp; 20</strong></td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/maleloans30day &gt; 15">
			<img src="../bilder/male.gif"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/femaleloans30day &gt; 15">
			<img src="../bilder/other.gif"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/otherloans30day &gt; 15">
			<img src="../bilder/other.gif"/>
			</xsl:if>
			</td>
		</tr>
		<tr>
			<td style="background-color:#FFD700;"><strong>&nbsp; 10</strong></td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/maleloans30day &gt; 5">
			<img src="../bilder/male.gif"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/femaleloans30day &gt; 5">
			<img src="../bilder/other.gif"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/otherloans30day &gt; 5">
			<img src="../bilder/other.gif"/>
			</xsl:if>
			</td>
		</tr>
		<tr>
			<td style="background-color:#000;">&nbsp;</td>
			<td style="background-color:#F0F8FF;">&nbsp;<strong> K&nbsp;</strong></td>
			<td style="background-color:#F0F8FF;"><strong>&nbsp;W&nbsp;</strong></td>
			<td style="background-color:#F0F8FF;"><strong>&nbsp;O&nbsp;</strong></td>
		</tr>
</table>
-->
<!-- tabell för total medlems fördelning : start -->

<br/>
Totalt antal medlemmar:  &nbsp; <xsl:value-of select="response/userstatus/totalusers" /> &nbsp;
      
    <table class="MsoNormalTable" border="1" cellpadding="1" cellspacing="1">
    <!-- tabell id 10 - 100 -->
		<tr>
			<td style="background-color:#FFf;text-align: center;""><strong>&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
			<td style="background-color:#FFD700;"><strong>&nbsp; 10</strong></td>			
			<td style="background-color:#FFD700;"><strong>&nbsp; 20</strong></td>
			<td style="background-color:#FFD700;"><strong>&nbsp; 30</strong></td>
			<td style="background-color:#FFD700;"><strong>&nbsp; 40</strong></td>
			<td style="background-color:#FFD700;"><strong>&nbsp; 50</strong></td>
			<td style="background-color:#FFD700;"><strong>&nbsp; 60</strong></td>
			<td style="background-color:#FFD700;"><strong>&nbsp; 70</strong></td>
			<td style="background-color:#FFD700;"><strong>&nbsp; 80</strong></td>
			<td style="background-color:#FFD700;"><strong>&nbsp; 90</strong></td>
			<td style="background-color:#FFD701;"><strong>100</strong></td>
		</tr>
		
		<tr>	
			<td style="background-color:#F0F8FF;">&nbsp;<strong> Män&nbsp;</strong></td>			
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/male/maletotal &gt; 5">
			<img src="../bilder/male.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/male/maletotal &gt; 15">
			<img src="../bilder/male.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/male/maletotal &gt; 25">
			<img src="../bilder/male.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/male/maletotal &gt; 35">
			<img src="../bilder/male.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/male/maletotal &gt; 45">
			<img src="../bilder/male.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/male/maletotal &gt; 55">
			<img src="../bilder/male.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/male/maletotal &gt; 65">
			<img src="../bilder/male.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/male/maletotal &gt; 75">
			<img src="../bilder/male.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/male/maletotal &gt; 85">
			<img src="../bilder/male.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/male/maletotal &gt; 95">
			<img src="../bilder/male.gif"/>
			</xsl:if>			
			</td>			
		</tr>
		
		<tr>	
			<td style="background-color:#F0F8FF;">&nbsp;<strong> Kvinnor&nbsp;</strong></td>		
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/female/femaletotal &gt; 5">
			<img src="../bilder/female.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/female/femaletotal &gt; 15">
			<img src="../bilder/female.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/female/femaletotal &gt; 25">
			<img src="../bilder/female.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/female/femaletotal &gt; 35">
			<img src="../bilder/female.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/female/femaletotal &gt; 45">
			<img src="../bilder/female.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/female/femaletotal &gt; 55">
			<img src="../bilder/female.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/female/femaletotal &gt; 65">
			<img src="../bilder/female.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/female/femaletotal &gt; 75">
			<img src="../bilder/female.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/female/femaletotal &gt; 85">
			<img src="../bilder/female.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/female/femaletotal &gt; 95">
			<img src="../bilder/female.gif"/>
			</xsl:if>			
			</td>			
		</tr>
		
		<tr>	
			<td style="background-color:#F0F8FF;">&nbsp;<strong> Annan&nbsp;</strong></td>		
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/other/othertotal &gt; 5">
			<img src="../bilder/other.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/other/othertotal &gt; 15">
			<img src="../bilder/other.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/other/othertotal &gt; 25">
			<img src="../bilder/other.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/other/othertotal &gt; 35">
			<img src="../bilder/other.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/other/othertotal &gt; 45">
			<img src="../bilder/other.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/other/othertotal &gt; 55">
			<img src="../bilder/other.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/other/othertotal &gt; 65">
			<img src="../bilder/other.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/other/othertotal &gt; 75">
			<img src="../bilder/other.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/other/othertotal &gt; 85">
			<img src="../bilder/other.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/other/othertotal &gt; 95">
			<img src="../bilder/other.gif"/>
			</xsl:if>			
			</td>			
		</tr>
</table>
<!-- tabell för medlems fördelning : END -->

<!-- tabell för total lån fördelning : start -->


<strong><center>Senaste 30 dagars inkomna händelserna:&nbsp;</center></strong>

 
Totalt antal som lånat under senaste 30 dagar:  &nbsp; <xsl:value-of select="response/userstatus/totalloans30day" /> &nbsp;
      
    <table class="MsoNormalTable" border="1" cellpadding="1" cellspacing="1">
    <!-- tabell id 10 - 100 -->
		<tr>
			<td style="background-color:#FFf;text-align: center;""><strong>&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
			<td style="background-color:#FFD700;"><strong>&nbsp; 10</strong></td>			
			<td style="background-color:#FFD700;"><strong>&nbsp; 20</strong></td>
			<td style="background-color:#FFD700;"><strong>&nbsp; 30</strong></td>
			<td style="background-color:#FFD700;"><strong>&nbsp; 40</strong></td>
			<td style="background-color:#FFD700;"><strong>&nbsp; 50</strong></td>
			<td style="background-color:#FFD700;"><strong>&nbsp; 60</strong></td>
			<td style="background-color:#FFD700;"><strong>&nbsp; 70</strong></td>
			<td style="background-color:#FFD700;"><strong>&nbsp; 80</strong></td>
			<td style="background-color:#FFD700;"><strong>&nbsp; 90</strong></td>
			<td style="background-color:#FFD701;"><strong>100</strong></td>
		</tr>
		
		<tr>	
			<td style="background-color:#F0F8FF;">&nbsp;<strong> Män&nbsp;</strong></td>			
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/male/maleloans30day &gt; 5">
			<img src="../bilder/male.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/male/maleloans30day &gt; 15">
			<img src="../bilder/male.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/male/maleloans30day &gt; 25">
			<img src="../bilder/male.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/male/maleloans30day &gt; 35">
			<img src="../bilder/male.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/male/maleloans30day &gt; 45">
			<img src="../bilder/male.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/male/maleloans30day &gt; 55">
			<img src="../bilder/male.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/male/maleloans30day &gt; 65">
			<img src="../bilder/male.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/male/maleloans30day &gt; 75">
			<img src="../bilder/male.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/male/maleloans30day &gt; 85">
			<img src="../bilder/male.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/male/maleloans30day &gt; 95">
			<img src="../bilder/male.gif"/>
			</xsl:if>			
			</td>			
		</tr>
		
		<tr>	
			<td style="background-color:#F0F8FF;">&nbsp;<strong> Kvinnor&nbsp;</strong></td>		
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/female/femaleloans30day &gt; 5">
			<img src="../bilder/female.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/female/femaleloans30day &gt; 15">
			<img src="../bilder/female.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/female/femaleloans30day &gt; 25">
			<img src="../bilder/female.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/female/femaleloans30day &gt; 35">
			<img src="../bilder/female.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/female/femaleloans30day &gt; 45">
			<img src="../bilder/female.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/female/femaleloans30day &gt; 55">
			<img src="../bilder/female.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/female/femaleloans30day &gt; 65">
			<img src="../bilder/female.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/female/femaleloans30day &gt; 75">
			<img src="../bilder/female.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/female/femaleloans30day &gt; 85">
			<img src="../bilder/female.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/female/femaleloans30day &gt; 95">
			<img src="../bilder/female.gif"/>
			</xsl:if>			
			</td>			
		</tr>
		
		<tr>	
			<td style="background-color:#F0F8FF;">&nbsp;<strong> Annan&nbsp;</strong></td>		
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/other/otherloans30day &gt; 5">
			<img src="../bilder/other.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/other/otherloans30day &gt; 15">
			<img src="../bilder/other.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/other/otherloans30day &gt; 25">
			<img src="../bilder/other.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/other/otherloans30day &gt; 35">
			<img src="../bilder/other.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/other/otherloans30day &gt; 45">
			<img src="../bilder/other.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/other/otherloans30day &gt; 55">
			<img src="../bilder/other.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/other/otherloans30day &gt; 65">
			<img src="../bilder/other.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/other/otherloans30day &gt; 75">
			<img src="../bilder/other.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/other/otherloans30day &gt; 85">
			<img src="../bilder/other.gif"/>
			</xsl:if>			
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">			
			<xsl:if test="response/userstatus/other/otherloans30day &gt; 95">
			<img src="../bilder/other.gif"/>
			</xsl:if>			
			</td>			
		</tr>
</table>
<!-- tabell för total lån fördelning : END -->

<!--
Ovanstående är antalet lån fördelat per könsidentitet:
<table border="1">
	<tr >
        <th> &nbsp; Könsidentitet &nbsp; </th>        
        <th> &nbsp; Färg &nbsp; </th>
      </tr>
      <tr>
        <td>Man</td>
        <td><img src="../bilder/male.gif"/></td>
      </tr>
      <tr>
        <td>Kvinna</td>
        <td><img src="../bilder/other.gif"/></td>
      </tr>
      <tr>
        <td>Annan</td>
        <td><img src="../bilder/other.gif"/></td>
      </tr>
</table>
-->  

<br/>
<!-- åldersfördelning av lån: start  -->

<strong>Åldersfördelning</strong>
<table class="MsoNormalTable" border="1" cellpadding="1" cellspacing="1">
		<tr>
			<td style="background-color:#FFD701;"><strong>100</strong></td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male2030 &gt; 95">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male3040 &gt; 95">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male4050 &gt; 95">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male50more &gt; 95">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">&nbsp; &nbsp; </td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female2030 &gt; 95">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female3040 &gt; 95">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female4050 &gt; 95">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female50more &gt; 95">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">&nbsp; &nbsp; </td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other2030 &gt; 95">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other3040 &gt; 95">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other4050 &gt; 95">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other50more &gt; 95">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>			
					
		</tr>
		<tr>
			<td style="background-color:#FFD701;"><strong>&nbsp;90&nbsp;</strong></td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male2030 &gt; 85">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male3040 &gt; 85">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male4050 &gt; 85">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male50more &gt; 85">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">&nbsp; &nbsp; </td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female2030 &gt; 85">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female3040 &gt; 85">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female4050 &gt; 85">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female50more &gt; 85">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>	
						
			<td style="background-color:#FFf;text-align: center;"">&nbsp; &nbsp; </td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other2030 &gt; 85">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other3040 &gt; 85">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other4050 &gt; 85">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other50more &gt; 85">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>			
		</tr>
		<tr>
			<td style="background-color:#FFD701;"><strong>&nbsp;80&nbsp;</strong></td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male2030 &gt; 75">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male3040 &gt; 75">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male4050 &gt; 75">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male50more &gt; 75">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">&nbsp; &nbsp; </td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female2030 &gt; 75">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female3040 &gt; 75">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female4050 &gt; 75">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female50more &gt; 75">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
						
			<td style="background-color:#FFf;text-align: center;"">&nbsp; &nbsp; </td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other2030 &gt; 75">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other3040 &gt; 75">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other4050 &gt; 75">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other50more &gt; 75">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>				
		</tr>
		<tr>
			<td style="background-color:#FFD701;"><strong>&nbsp;70&nbsp;</strong></td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male2030 &gt; 65">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male3040 &gt; 65">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male4050 &gt; 65">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male50more &gt; 65">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">&nbsp; &nbsp; </td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female2030 &gt; 65">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female3040 &gt; 65">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female4050 &gt; 65">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female50more &gt; 65">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
						
			<td style="background-color:#FFf;text-align: center;"">&nbsp; &nbsp; </td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other2030 &gt; 65">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other3040 &gt; 65">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other4050 &gt; 65">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other50more &gt; 65">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>				
		</tr>
		<tr>
			<td style="background-color:#FFD701;"><strong>&nbsp;60&nbsp;</strong></td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male2030 &gt; 55">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male3040 &gt; 55">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male4050 &gt; 55">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male50more &gt; 55">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">&nbsp; &nbsp; </td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female2030 &gt; 55">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female3040 &gt; 55">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female4050 &gt; 55">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female50more &gt; 55">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			
						
			<td style="background-color:#FFf;text-align: center;"">&nbsp; &nbsp; </td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other2030 &gt; 55">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other3040 &gt; 55">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other4050 &gt; 55">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other50more &gt; 55">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>				
		</tr>
		<tr>
			<td style="background-color:#FFD701;"><strong>&nbsp;50&nbsp;</strong></td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male2030 &gt; 45">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male3040 &gt; 45">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male4050 &gt; 45">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male50more &gt; 45">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">&nbsp; &nbsp; </td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female2030 &gt; 45">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female3040 &gt; 45">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female4050 &gt; 45">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female50more &gt; 45">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			
						
			<td style="background-color:#FFf;text-align: center;"">&nbsp; &nbsp; </td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other2030 &gt; 45">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other3040 &gt; 45">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other4050 &gt; 45">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other50more &gt; 45">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>				
		</tr>
		<tr>
			<td style="background-color:#FFD701;"><strong>&nbsp;40&nbsp;</strong></td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male2030 &gt; 35">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male3040 &gt; 35">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male4050 &gt; 35">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male50more &gt; 35">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">&nbsp; &nbsp; </td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female2030 &gt; 35">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female3040 &gt; 35">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female4050 &gt; 35">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female50more &gt; 35">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>	
			
						
			<td style="background-color:#FFf;text-align: center;"">&nbsp; &nbsp; </td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other2030 &gt; 35">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other3040 &gt; 35">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other4050 &gt; 35">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other50more &gt; 35">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>			
		</tr>
		<tr>
			<td style="background-color:#FFD701;"><strong>&nbsp;30&nbsp;</strong></td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male2030 &gt; 25">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male3040 &gt; 25">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male4050 &gt; 25">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male50more &gt; 25">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">&nbsp; &nbsp; </td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female2030 &gt; 25">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female3040 &gt; 25">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female4050 &gt; 25">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female50more &gt; 25">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>		
			
						
			<td style="background-color:#FFf;text-align: center;"">&nbsp; &nbsp; </td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other2030 &gt; 25">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other3040 &gt; 25">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other4050 &gt; 25">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other50more &gt; 25">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>		
		</tr>
		<tr>
			<td style="background-color:#FFD701;"><strong>&nbsp;20&nbsp;</strong></td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male2030 &gt; 15">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male3040 &gt; 15">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male4050 &gt; 15">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male50more &gt; 15">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">&nbsp; &nbsp; </td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female2030 &gt; 15">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female3040 &gt; 15">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female4050 &gt; 15">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female50more &gt; 15">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			
						
			<td style="background-color:#FFf;text-align: center;"">&nbsp; &nbsp; </td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other2030 &gt; 15">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other3040 &gt; 15">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other4050 &gt; 15">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other50more &gt; 15">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>				
		</tr>
		<tr>
			<td style="background-color:#FFD701;"><strong>&nbsp;10&nbsp;</strong></td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male2030 &gt; 5">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male3040 &gt; 5">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male4050 &gt; 5">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/male/male50more &gt; 5">
			<img src="../bilder/male.gif" align="center"/>
			</xsl:if>
			</td>
			
			<td style="background-color:#FFf;text-align: center;"">&nbsp; &nbsp; </td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female2030 &gt; 5">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female3040 &gt; 5">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female4050 &gt; 5">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/female/female50more &gt; 5">
			<img src="../bilder/female.gif" align="center"/>
			</xsl:if>
			</td>
			
						
			<td style="background-color:#FFf;text-align: center;"">&nbsp; &nbsp; </td>
			
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other2030 &gt; 5">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other3040 &gt; 5">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other4050 &gt; 5">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>
			<td style="background-color:#FFf;text-align: center;"">
			<xsl:if test="response/userstatus/other/other50more &gt; 5">
			<img src="../bilder/other.gif" align="center"/>
			</xsl:if>
			</td>				
		</tr>
		<tr>
			<td style="background-color:#000;">&nbsp;</td>
			<td style="background-color:#F0F8FF;">&nbsp;<strong> 20-30</strong></td>
			<td style="background-color:#F0F8FF;"><strong>30-40</strong></td>
			<td style="background-color:#F0F8FF;"><strong>40-50</strong></td>			
			<td style="background-color:#F0F8FF;"><strong>50-...</strong></td>
			<td style="background-color:#F0F8FF;"><strong>&nbsp;&nbsp;&nbsp;</strong></td>
			<td style="background-color:#F0F8FF;">&nbsp;<strong> 20-30</strong></td>
			<td style="background-color:#F0F8FF;"><strong>30-40</strong></td>
			<td style="background-color:#F0F8FF;"><strong>40-50</strong></td>			
			<td style="background-color:#F0F8FF;"><strong>50-...</strong></td>
			<td style="background-color:#F0F8FF;"><strong>&nbsp;&nbsp;&nbsp;</strong></td>
			<td style="background-color:#F0F8FF;">&nbsp;<strong> 20-30</strong></td>
			<td style="background-color:#F0F8FF;"><strong>30-40</strong></td>
			<td style="background-color:#F0F8FF;"><strong>40-50</strong></td>			
			<td style="background-color:#F0F8FF;"><strong>50-...</strong></td>
		</tr>
</table>
Ovanstående är antalet lån fördelat per könsidentitet:
<!-- åldersfördelning av lån: end  -->

<!-- förklaring: start  -->
<table border="1">
	<tr >
        <th style="text-align: center;"> &nbsp; Könsidentitet &nbsp; </th>        
        <th style="text-align: center;"> &nbsp; id &nbsp; </th>
      </tr>
      <tr>
        <td>Man</td>
        <td><img src="../bilder/male.gif"/></td>
      </tr>
      <tr>
        <td>Kvinna</td>
        <td><img src="../bilder/female.gif"/></td>
      </tr>
      <tr>
        <td>Annan</td>
        <td><img src="../bilder/other.gif"/></td>
      </tr>
</table>
<!-- förklaring: end  -->

<!-- activity: start  -->
 Användaraktivitetstabell:<br/>
<table border="2">
      <tr style="background:#ff0180;">
        <th style="background:#f00180;"> &nbsp; Aktivitet &nbsp; </th>
        <th> &nbsp; Genus &nbsp; </th>
        <th> &nbsp; Åldersspan &nbsp; </th>
        <th> &nbsp; Antal lån &nbsp; </th>      
      </tr>
      <xsl:for-each select="response/loaninfo/activity/most/mosttotal">
      <tr>
      	<td><b>Mest total</b></td>
        <td><xsl:value-of select="gender"/></td>
        <td><xsl:value-of select="agespan"/></td>
        <td><xsl:value-of select="loans"/></td>
      </tr>
      </xsl:for-each>
      
      <xsl:for-each select="response/loaninfo/activity/least/leasttotal">
      <tr>
      	<td><b>Mest, under 30 dagar</b></td>
        <td><xsl:value-of select="gender"/></td>
        <td><xsl:value-of select="agespan"/></td>
        <td><xsl:value-of select="loans"/></td>
      </tr>
      </xsl:for-each>
      
      <xsl:for-each select="response/loaninfo/activity/most/most30day">
      <tr>
      	<td><b>Minst total</b></td>
        <td><xsl:value-of select="gender"/></td>
        <td><xsl:value-of select="agespan"/></td>
        <td><xsl:value-of select="loans"/></td>
      </tr>
      </xsl:for-each>
      
      <xsl:for-each select="response/loaninfo/activity/least/least30day">
      <tr>
      	<td><b>Minst, under 30 dagar</b></td>
        <td><xsl:value-of select="gender"/></td>
        <td><xsl:value-of select="agespan"/></td>
        <td><xsl:value-of select="loans"/></td>
      </tr>
      </xsl:for-each>
      
    </table>
<!-- activity: end  -->



<!-- sidbrytning start-->

<br/>
<center>vv se nästa sida</center><br />
<!--  &nbsp; 
<div style="page-break-after: always"><span style="display: none;"> &nbsp; </span></div> -->
<!-- sidbrytning slut -->


				<table class="MsoNormalTable" border="0" cellpadding="0"
					width="100%"
					style='width:100.0%;mso-cellspacing:1.5pt;background:#FF0B0A;mso-yfti-tbllook:
 1184;mso-padding-alt:0cm 5.4pt 0cm 5.4pt'>


					<th>
						<img src="../bilder/loggo.png">
							<br>
								<small>
									<small>Serviceanm&auml;lan:
										070-321321
									</small>
								</small>
							</br>
						</img>
					</th>
					<th>

						<big>
							<big>
								<big><big>
									- Statfil &nbsp; <xsl:value-of select="response/datetime" /> &nbsp; -
								</big></big>
							</big>
						</big>
					</th>
					<th>
						<tr />
					</th>
				</table>
				<br />
<!-- sidbrytning end -->






Populära cyklar:
<table border="2">
      <tr style="background:#00ff40;">
        <th> &nbsp; Typ &nbsp; </th>
        <th> &nbsp; Märke &nbsp; </th>
        <th> &nbsp; Årsmodell &nbsp; </th>
        <th> &nbsp; Antal lån &nbsp; </th>      
      </tr>
      <xsl:for-each select="response/bikes/popularbikes/bike">
      <tr>
        <td><xsl:value-of select="type"/></td>
        <td><xsl:value-of select="brand"/></td>
        <td><xsl:value-of select="model_year"/></td>
        <td><xsl:value-of select="number_of_loans"/></td>
      </tr>
      </xsl:for-each>
    </table>
    
 Minst populär cykel:
<table border="2">
      <tr style="background:#ff0080;">
        <th> &nbsp; Typ &nbsp; </th>
        <th> &nbsp; Märke &nbsp; </th>
        <th> &nbsp; Årsmodell &nbsp; </th>
        <th> &nbsp; Antal lån &nbsp; </th>      
      </tr>
      <xsl:for-each select="response/bike/leastpopularbikes/bike">
      <tr>
        <td><xsl:value-of select="type"/></td>
        <td><xsl:value-of select="brand"/></td>
        <td><xsl:value-of select="model_year"/></td>
        <td><xsl:value-of select="number_of_loans"/></td>
      </tr>
      </xsl:for-each>
    </table>

 <br/>
<center>Statfilens slut</center><br />

			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
