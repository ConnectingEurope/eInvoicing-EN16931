<?xml version="1.0" encoding="ISO-8859-1"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="EN16931-EDIFACT-Syntax">

	<!-- slightly different apprach for EDIFACT xml -> segment for segment -->
	
	<!-- UNH -->
	<param name="EDIFACT-SR-001" value="not(D_0068)"/>
	<param name="EDIFACT-SR-002" value="not(C_S010)"/>
	
	<!-- BGM -->
	<param name="EDIFACT-SR-003" value="not(C_C002/D_1131)"/>
	<param name="EDIFACT-SR-004" value="not(C_C002/D_3055)"/>
	<param name="EDIFACT-SR-005" value="not(C_C002/D_1000)"/>
	<param name="EDIFACT-SR-006" value="not(C_C106/D_1056)"/>
	<param name="EDIFACT-SR-007" value="not(C_C106/D_1060)"/>
	<param name="EDIFACT-SR-008" value="D_1225='9'"/>
	<param name="EDIFACT-SR-009" value="not(D_4343)"/>
	<param name="EDIFACT-SR-010" value="not(D_1373)"/>
	<param name="EDIFACT-SR-011" value="not(D_3453)"/>
	<!-- DTM -->
	<param name="EDIFACT-SR-012" value="C_C507[D_2005='35' or D_2005='131' or D_2005='137' or D_2005='167' or D_2005='168']"/>
	<param name="EDIFACT-SR-013" value="count(C_C507[D_2005='35']) &lt;=1"/>
	<param name="EDIFACT-SR-014" value="count(C_C507[D_2005='131']) &lt;=1"/>
	<param name="EDIFACT-SR-015" value="count(C_C507[D_2005='137']) =1"/>
	<param name="EDIFACT-SR-016" value="count(C_C507[D_2005='167']) &lt;=1"/>
	<param name="EDIFACT-SR-017" value="count(C_C507[D_2005='168']) &lt;=1"/>

	<!-- Invoice -->
	<param name="EDIFACT-SR-018" value="not(S_PAI)"/>
	<param name="EDIFACT-SR-019" value="not(S_ALI)"/>
	<param name="EDIFACT-SR-020" value="not(S_IMD)"/>
	<param name="EDIFACT-SR-021" value="not(S_LOC)"/>
	<param name="EDIFACT-SR-022" value="not(S_GEI)"/>
	<param name="EDIFACT-SR-023" value="not(S_DGS)"/>
	<param name="EDIFACT-SR-024" value="not(S_GIR)"/>
	<param name="EDIFACT-SR-025" value="not(G_SG6)"/>
	<param name="EDIFACT-SR-026" value="not(G_SG9)"/>
	<param name="EDIFACT-SR-027" value="not(G_SG12)"/>
	<param name="EDIFACT-SR-028" value="not(G_SG13)"/>
	<param name="EDIFACT-SR-029" value="not(G_SG14)"/>
	<param name="EDIFACT-SR-030" value="not(G_SG23)"/>
	<param name="EDIFACT-SR-031" value="not(G_SG24)"/>
	<param name="EDIFACT-SR-032" value="not(G_SG25)"/>
	<param name="EDIFACT-SR-033" value="not(S_CNT)"/>
	<param name="EDIFACT-SR-034" value="not(G_SG55)"/>
	<!-- FTX -->
	<param name="EDIFACT-SR-035" value="current()[D_4451='GEN' or D_4451='AHR' or D_4451='AFP' or D_4451='ADE' or D_4451='AGM' or D_4451='AAB']"/>
	<param name="EDIFACT-SR-036" value="not(C_C107/D_1131)"/>
	<param name="EDIFACT-SR-037" value="not(C_C107/D_3055)"/>
	<param name="EDIFACT-SR-038" value="not(C_C108/D_4440_2 or C_C108/D_4440_3 or C_C108/D_4440_4 or C_C108/D_4440_5)"/>
	<param name="EDIFACT-SR-039" value="not(D_3453)"/>
	<param name="EDIFACT-SR-040" value="not(D_4447)"/>
	
	<!-- SG1 -->
	<param name="EDIFACT-SR-041" value="(S_RFF/C_C506[D_1153='PQ' or D_1153='IV' or D_1153='AOU' or D_1153='ATS' or D_1153='AAK' or D_1153='ALO' or D_1153='VN' or D_1153='ON' or D_1153='CT' or D_1153='AEG' or D_1153='AEF' or D_1153='CR'])"/>
	<param name="EDIFACT-SR-042" value="not(S_RFF/C_C506/D_1156)"/>
	<param name="EDIFACT-SR-043" value="not(S_RFF/C_C506/D_1056)"/>
	<param name="EDIFACT-SR-044" value="not(S_RFF/C_C506/D_1060)"/>
	<param name="EDIFACT-SR-045" value="count(S_RFF/C_C506[D_1153='CR']) &lt;=1"/>
	<param name="EDIFACT-SR-046" value="count(S_RFF/C_C506[D_1153='AEF']) &lt;=1"/>
	<param name="EDIFACT-SR-047" value="count(S_RFF/C_C506[D_1153='AEG']) =1"/>
	<param name="EDIFACT-SR-048" value="count(S_RFF/C_C506[D_1153='CT']) &lt;=1"/>
	<param name="EDIFACT-SR-049" value="count(S_RFF/C_C506[D_1153='ON']) &lt;=1"/>
	<param name="EDIFACT-SR-050" value="count(S_RFF/C_C506[D_1153='VN']) &lt;=1"/>
	<param name="EDIFACT-SR-051" value="count(S_RFF/C_C506[D_1153='ALO']) &lt;=1"/>
	<param name="EDIFACT-SR-052" value="count(S_RFF/C_C506[D_1153='AAK']) &lt;=1"/>
	<param name="EDIFACT-SR-053" value="count(S_RFF/C_C506[D_1153='ATS']) &lt;=1"/>
	<param name="EDIFACT-SR-054" value="count(S_RFF/C_C506[D_1153='AOU']) &lt;=1"/>
	<param name="EDIFACT-SR-055" value="(S_DTM/C_C507[D_2005='3']) or not (S_DTM)"/>
	<param name="EDIFACT-SR-056" value="not(S_DTM/C_C507/D_2379)"/>
	<param name="EDIFACT-SR-057" value="not(S_GIR)"/>
	<param name="EDIFACT-SR-058" value="not(S_LOC)"/>
	<param name="EDIFACT-SR-059" value="not(S_MEA)"/>
	<param name="EDIFACT-SR-060" value="not(S_QTY)"/>
	<param name="EDIFACT-SR-061" value="not(S_FTX)"/>
	<param name="EDIFACT-SR-062" value="not(S_MOA)"/>
	<param name="EDIFACT-SR-063" value="not(S_RTE)"/>
	
	<!-- SG2 -->
	<param name="EDIFACT-SR-064" value="S_NAD[D_3035='SE' or D_3035='BY' or D_3035='PE' or D_3035='AE' or D_3035='DP']"/>
	<param name="EDIFACT-SR-065" value="(S_NAD/C_C082/D_3039 and S_NAD/C_C082/D_3055) or not (S_NAD/C_C082)"/>
	<param name="EDIFACT-SR-066" value="not(S_NAD/C_C082/D_1131)"/>
	<param name="EDIFACT-SR-067" value="not(S_NAD/C_C058)"/>
	<param name="EDIFACT-SR-068" value="not(S_NAD[D_3035='AE']/C_C082)"/>
	<param name="EDIFACT-SR-069" value="not(S_NAD[D_3035!='SE']/C_C080/D_3036_2)"/>
	<param name="EDIFACT-SR-070" value="not(S_NAD/C_C080/D_3036_3 or S_NAD/C_C080/D_3036_4 or S_NAD/C_C080/D_3036_5)"/>
	<param name="EDIFACT-SR-071" value="not(S_NAD/C_C080/D_3045)"/>
	<param name="EDIFACT-SR-072" value="not(S_NAD[D_3035='PE']/C_C059)"/>
	<param name="EDIFACT-SR-073" value="not(S_NAD/C_C059/D_3042_3)"/>
	<param name="EDIFACT-SR-074" value="not(S_NAD/C_C059/D_3042_4)"/>
	<param name="EDIFACT-SR-075" value="not(S_NAD[D_3035='PE']/D_3164)"/>
	<param name="EDIFACT-SR-076" value="not(S_NAD/C_C819/D_3229)"/>
	<param name="EDIFACT-SR-077" value="not(S_NAD/C_C819/D_1131)"/>
	<param name="EDIFACT-SR-078" value="not(S_NAD/C_C819/D_3055)"/>
	<param name="EDIFACT-SR-079" value="not(S_NAD[D_3035='PE']/C_C819/D_3228)"/>
	
	
	<!-- segments, groups and composites -->
    <param name="UNH" value="/M_INVOIC/S_UNH"/>
    <param name="BGM" value="/M_INVOIC/S_BGM"/>
    <param name="DTM" value="/M_INVOIC/S_DTM"/>
    <param name="Invoice" value="/M_INVOIC"/>
    <param name="FTX" value="/M_INVOIC/S_FTX"/>
    <param name="SG1" value="/M_INVOIC/G_SG1"/>
    <param name="SG2" value="/M_INVOIC/G_SG2"/>
    
</pattern>