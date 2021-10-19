/// Producción de ejemplo para probar componentes WiFIS utilizando ticket SAML
Class TAULI.Prod.BASE Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="TAULI.Prod.BASE" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Setting Target="Adapter" Name="ShutdownTimeout">5</Setting>
  <Setting Target="Adapter" Name="UpdateTimeout">5</Setting>
  <Item Name="Leer HL7 ER7 Fichero" Category="Salida,WIFIS" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory">WIFIS</Setting>
    <Setting Target="Host" Name="TargetConfigNames">WiFIS_Crear_Msg</Setting>
    <Setting Target="Adapter" Name="FilePath">/interfaces/local/csides/Test/WIFIS/inHL7</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/interfaces/local/csides/Test/WIFIS/arxiuHL7</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Adapter" Name="Charset">UTF-8</Setting>
    <Setting Target="Host" Name="IgnoreInboundAck">0</Setting>
  </Item>
  <Item Name="WiFIS_Crear_Msg" Category="Salida" ClassName="WiFIS.V201.Test.BP.CrearMsg" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="WiFIS_Router_V201" Category="Salida" ClassName="WiFIS.V201.BP.Router" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="TargetConfigName"></Setting>
    <Setting Target="Host" Name="SAMLJava">1</Setting>
  </Item>
  <Item Name="WiFIS_Procesar_Msg" Category="Entrada" ClassName="WiFIS.V201.Test.BP.ProcesarMsg" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="Escribir HL7 XML Fichero" Category="Entrada,WIFIS" ClassName="ITB.HL7.BO.FileXMLOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/interfaces/local/csides/Test/WIFIS/outHL7</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">WIFIS</Setting>
    <Setting Target="Adapter" Name="Charset">UTF-8</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
  </Item>
  <Item Name="Escribir HL7 ER7 Fichero" Category="Entrada,WIFIS" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/interfaces/local/csides/Test/WIFIS/outHL7</Setting>
    <Setting Target="Host" Name="Filename">%f_%Q.hl7</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
  </Item>
  <Item Name="WiFIS.V201.BS.Cites.CitesSoap" Category="Entrada,WIFIS" ClassName="WiFIS.V201.BS.Cites.CitesSoap" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">PTWIFIS_CvtXMLToER7</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="Charset"></Setting>
  </Item>
  <Item Name="WiFIS_Cites_BO_V201" Category="Salida,WIFIS" ClassName="WiFIS.V201.BO.WIFISHL7Port" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="WebServiceClientClass">WiFIS.V201.WSC.Cites.CitesSoap</Setting>
    <Setting Target="Adapter" Name="WebServiceURL">https://preproduccio.mbroker.isisscat.intranet.gencat.cat:59100/WiFISIntegration/services/Cites.asmx</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Adapter" Name="SSLConfig">WIFIS2020</Setting>
  </Item>
  <Item Name="WiFIS.V201.BS.ConsultaDades.ConsultaDadesSoap" Category="Entrada,WIFIS" ClassName="WiFIS.V201.BS.ConsultaDades.ConsultaDadesSoap" PoolSize="0" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">PTWIFIS_Rebutjar_Msg</Setting>
  </Item>
  <Item Name="WiFIS_ConsultaDades_BO_V201" Category="Salida,WIFIS" ClassName="WiFIS.V201.BO.WIFISHL7Port" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="WebServiceURL">https://preproduccio.mbroker.isisscat.intranet.gencat.cat:59100/WiFISIntegration/services/ConsultaDades.asmx</Setting>
    <Setting Target="Adapter" Name="WebServiceClientClass">WiFIS.V201.WSC.ConsultaDades.ConsultaDadesSoap</Setting>
  </Item>
  <Item Name="WiFIS.V201.BS.Derivacions.DerivacionsSoap" Category="Entrada,WIFIS,TELERADIOLOGIA" ClassName="WiFIS.V201.BS.Derivacions.DerivacionsSoap" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">PTWIFIS_CvtXMLToER7</Setting>
    <Setting Target="Host" Name="Charset"></Setting>
  </Item>
  <Item Name="WiFIS_Derivacions_BO_V201" Category="Salida,WIFIS,TELERADIOLOGIA" ClassName="WiFIS.V201.BO.WIFISHL7Port" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="WebServiceClientClass">WiFIS.V201.WSC.Derivacions.DerivacionsSoap</Setting>
    <Setting Target="Adapter" Name="WebServiceURL">https://preproduccio.mbroker.isisscat.intranet.gencat.cat:59100/WiFISIntegration/services/Derivacions.asmx</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="SSLConfig">WIFIS2020</Setting>
  </Item>
  <Item Name="WiFIS.V201.BS.Laboratori.LaboratoriSoap" Category="Entrada,WIFIS" ClassName="WiFIS.V201.BS.Laboratori.LaboratoriSoap" PoolSize="0" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">PTWIFIS_Rebutjar_Msg</Setting>
  </Item>
  <Item Name="WiFIS_Laboratori_BO_V201" Category="Salida,WIFIS" ClassName="WiFIS.V201.BO.WIFISHL7Port" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="WebServiceClientClass">WiFIS.V201.WSC.Laboratori.LaboratoriSoap</Setting>
    <Setting Target="Adapter" Name="WebServiceURL">https://preproduccio.mbroker.isisscat.intranet.gencat.cat:59100/WiFISIntegration/services/Laboratori.asmx</Setting>
  </Item>
  <Item Name="WiFIS.V201.BS.Notificacions.NotificacionsSoap" Category="Entrada,WIFIS" ClassName="WiFIS.V201.BS.Notificacions.NotificacionsSoap" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">PTWIFIS_CvtXMLToER7</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="Charset"></Setting>
  </Item>
  <Item Name="WiFIS_Notificacions_BO_V201" Category="Salida,WIFIS,PreAltes,Notificacio" ClassName="WiFIS.V201.BO.WIFISHL7Port" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="WebServiceClientClass">WiFIS.V201.WSC.Notificacions.NotificacionsSoap</Setting>
    <Setting Target="Adapter" Name="WebServiceURL">https://preproduccio.mbroker.isisscat.intranet.gencat.cat:59100/WiFISIntegration/services/Notificacions.asmx</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Adapter" Name="SSLConfig">WIFIS2020</Setting>
  </Item>
  <Item Name="Ens.Alert" Category="WIFIS,PreAltes,SABI,BetterCare,Notificacio" ClassName="EnsLib.EMail.AlertOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="From">IRIS-BASE-WIFIS@tauli.cat</Setting>
    <Setting Target="Adapter" Name="Recipient">integracioBASE@tauli.cat</Setting>
    <Setting Target="Adapter" Name="SMTPPort">25</Setting>
    <Setting Target="Adapter" Name="SMTPServer">smtp.tauli.cat</Setting>
    <Setting Target="Adapter" Name="Cc">tomas@tauli.cat</Setting>
  </Item>
  <Item Name="SAMLjava" Category="JAVA,WIFIS,PreAltes,HC3ISC,Notificacio" ClassName="HC3.BO.SAMLjava" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="ConfigurationFile">/systemiris/javaapps/HC3SA/config/hccsa.properties</Setting>
    <Setting Target="Host" Name="PropertiesFile">/systemiris/javaapps/HC3SA/config/parameters.properties</Setting>
    <Setting Target="Host" Name="Port">35559</Setting>
  </Item>
  <Item Name="JavaGateway" Category="JAVA,WIFIS,PreAltes,Notificacio,SABI" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ClassPath">/systemiris/javaapps/oracle/11.2/client64/lib/ojdbc6.jar</Setting>
    <Setting Target="Host" Name="JDKVersion">JDK17</Setting>
    <Setting Target="Host" Name="JVMArgs">-XX:-UseCompressedClassPointers -XX:-UseCompressedOops</Setting>
    <Setting Target="Host" Name="JavaHome">/usr/lib/jvm/java-8-openjdk-amd64</Setting>
    <Setting Target="Host" Name="Logfile"></Setting>
    <Setting Target="Host" Name="Address">127.0.0.1</Setting>
    <Setting Target="Host" Name="Port">35557</Setting>
    <Setting Target="Host" Name="JavaDebugPort">8010</Setting>
  </Item>
  <Item Name="Leer HL7 XML Fichero" Category="Salida,WIFIS" ClassName="ITB.HL7.BS.FileXMLService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/interfaces/local/csides/Test/WIFIS/inHL7</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.xml</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/interfaces/local/csides/Test/WIFIS/arxiuHL7</Setting>
    <Setting Target="Host" Name="TargetConfigNames">PTWIFIS_CvtER7ToXML</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">WIFIS</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Adapter" Name="WorkPath"></Setting>
  </Item>
  <Item Name="SAMLcache" Category="Salida,WIFIS" ClassName="PTWIFIS.BO.GeneraTiquetSAML" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="HCISConsultavisitasSQL" Category="Salida,LMS" ClassName="LMS.BO.HCIS.ConsultaVisitasSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="ConnectionAttributes"></Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="ProcesarConsultaVisitas" Category="LMS" ClassName="LMS.BP.ProcesarConsultaVisitas" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="LMS.BS.ConsultarCitasWS" Category="LMS" ClassName="LMS.BS.ConsultarCitasWS" PoolSize="0" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="cercaPacientInHCIS" Category="SQL" ClassName="PTWIFIS.BO.cercaPacient" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
  </Item>
  <Item Name="LMS.BS.VisitesPendents" Category="SQL,LMS" ClassName="LMS.BS.SQLVisitesPendents" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
    <Setting Target="Adapter" Name="Query"><![CDATA[select cc.numerohc pacient, cc.numicu numicu, cc.fecha fecha, cc.horaini hora,
 case when pac.tarjeta is null then doc.valor_doc else pac.tarjeta end cip,
 case when cc.centro = 'UDIAT' then '00913' when cc.centro = 'ALB' then '00741' when cc.centro = 'CSM' then '00741' else '00741' end codi_upo 
 from HCIS.cex_cita cc, HCIS.paciente pac left join HCIS.paciente_docu doc on (pac.codigo = doc.paciente and doc.tipodoc = 'TAS')
where cc.numerohc = pac.codigo
  and cc.codigo in (select codigo from HCIS.cex_cita cc1 where cc1.numerohc = cc.numerohc and to_char(fecha,'YYYYMMDD')||to_char(to_date(horaini,'HH24:MI:SS'),'HH24MISS') in (select max(to_char(cc2.fecha,'YYYYMMDD')||to_char(to_date(cc2.horaini,'HH24:MI:SS'),'HH24MISS')) from HCIS.cex_cita cc2 where cc2.numerohc = cc.numerohc and cc2.estado = 'PRG' and cc.centro = cc2.centro) and rownum=1)
  and cc.grabadia >= to_date(?,'DD/MM/YYYY')
  and (pac.tarjeta is not null or (cc.numerohc = doc.paciente and doc.tipodoc = 'TAS')) and cc.fecha > sysdate
  order by cc.numerohc]]></Setting>
    <Setting Target="Adapter" Name="Parameters">$fechaprg</Setting>
    <Setting Target="Adapter" Name="CallInterval">86000</Setting>
    <Setting Target="Adapter" Name="KeyFieldName"></Setting>
  </Item>
  <Item Name="ProcessLMS" Category="" ClassName="LMS.BP.ProcessLMS" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="creaMissatgeORGO20" Category="Salida,WIFIS,TELERADIOLOGIA" ClassName="PTWIFIS.BO.creaMissatgeORGO20" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="ValidaOMGO19" Category="WIFIS,TELERADIOLOGIA" ClassName="PTWIFIS.BO.ValidaOMGO19" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="ControlMissatgeRebut" Category="WIFIS,PreAltes,TELERADIOLOGIA,Notificacio" ClassName="PTWIFIS.BO.ControlMissatgeRebut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="PTWIFIS_Procesar_Msg" Category="WIFIS,TELERADIOLOGIA" ClassName="PTWIFIS.BP.ProcesarMsg" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="PTWIFIS_RouterRespostaWS" Category="Salida,WIFIS,PreAltes,TELERADIOLOGIA,Notificacio" ClassName="PTWIFIS.BP.WIFISRouterRespostaWS" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="SAMLJava">1</Setting>
  </Item>
  <Item Name="PTWIFIS_Crear_Msg" Category="WIFIS,PreAltes,Notificacio" ClassName="PTWIFIS.BP.CrearMsg" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="obteTiquetSAML" Category="WIFIS,PreAltes,Notificacio" ClassName="PTWIFIS.BP.obteTiquetSAML" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="JavaGatewayDebug" Category="JAVA,WIFIS" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ClassPath">/systemiris/javaapps/HC3SA/lib/Utils.jar:/systemiris/javaapps/HC3SA/lib/jdk1.5/bcprov-jdk15-134.jar:/systemiris/javaapps/HC3SA/lib/jdk1.5/xmlsec-1.3.0.jar:/systemiris/javaapps/HC3SA/lib/jdk1.5/xmlsec-1.3.0-commons-logging.jar:/systemiris/javaapps/HC3SA/lib/jdk1.5/jargs-1.0.jar:/systemiris/javaapps/HC3SA/lib/jdk1.5/log4j-1.2.13.jar:/systemiris/javaapps/HC3SA/lib/jdk1.5/xmltooling-1.0-TP2-jdk-1.5.jar:/systemiris/javaapps/HC3SA/lib/jdk1.5/retroweaver-rt-1.2.4.jar:/systemiris/javaapps/HC3SA/lib/jdk1.5/httpclient-3.0.1.jar:/systemiris/javaapps/HC3SA/lib/jdk1.5/joda-time-1.3.jar:/systemiris/javaapps/HC3SA/lib/jdk1.5/httpclient-3.0.1-commons-codec-1.3.jar:/systemiris/javaapps/HC3SA/lib/jdk1.5/opensaml-2.0-TP2-jdk-1.5.jar:/systemiris/javaapps/HC3SA/lib/jdk1.5/javolution.jar:/systemiris/javaapps/HC3SA/lib/HCCsa.jar:/systemiris/javaapps/HC3SA/hc3saSamlProxy.jar:/systemiris/javaapps/HC3SA/lib/xml/resolver-2.9.1.jar:/systemiris/javaapps/HC3SA/lib/xml/serializer-2.9.1.jar:/systemiris/javaapps/HC3SA/lib/xml/xalan-2.7.1.jar:/systemiris/javaapps/HC3SA/lib/xml/xercesImpl-2.9.1.jar:/systemiris/javaapps/HC3SA/lib/xml/xml-apis-2.9.1.jar</Setting>
    <Setting Target="Host" Name="JDKVersion">JDK17</Setting>
    <Setting Target="Host" Name="JVMArgs">-Dfile.encoding=UTF-8 -Djavax.xml.parsers.DocumentBuilderFactory=org.apache.xerces.jaxp.DocumentBuilderFactoryImpl</Setting>
    <Setting Target="Host" Name="JavaHome">/usr/lib/jvm/java-8-openjdk-amd64</Setting>
    <Setting Target="Host" Name="Logfile"></Setting>
    <Setting Target="Host" Name="Address">127.0.0.1</Setting>
    <Setting Target="Host" Name="Port">35559</Setting>
    <Setting Target="Host" Name="JavaDebugPort">8010</Setting>
  </Item>
  <Item Name="ObtePedidosByEstado" Category="SQL,Entrada,WIFIS" ClassName="PTWIFIS.BS.ObtePedidosByEstado" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials"></Setting>
    <Setting Target="Adapter" Name="DSN">WIFIS</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="Query">select peticio, estado from ptwifis_clases.pedido where estado in ('CAN','CANCEL.LAT','CAD','DEMANAR_CANCELACIO','FIN','FINALITZAT','RES','AMB_RESULTATS','CON','CONFIRMAT','NVI','NO_VISITAT','PRG','PROGRAMAT','MOD','MODIFICAT','ANU','ANULAT') and estadoenvio in ('PRV','PREVI') and unitatreceptora!='SISDI' AND Peticio='IdMsgIntWmb_2021-03-05 18:00:01.858f73'</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
    <Setting Target="Adapter" Name="KeyFieldName">peticio</Setting>
    <Setting Target="Adapter" Name="Parameters"></Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Adapter" Name="CallInterval">30</Setting>
    <Setting Target="Adapter" Name="DeleteQuery"></Setting>
  </Item>
  <Item Name="LMS_PublicaContactes" Category="SOAP,Salida" ClassName="LMS.BO.PortContactes" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="WebServiceClientClass">ContactesAgendaImplService.ContactesAgendaImplPort</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="ProxyHTTPS">1</Setting>
    <Setting Target="Adapter" Name="SSLConfig">WIFIS2020</Setting>
    <Setting Target="Adapter" Name="WebServiceURL">https://pre.bus.salut.gencat.cat/hc3e/ws/public/ContactesAgenda_v02_00</Setting>
  </Item>
  <Item Name="ValidaACK" Category="SQL,Salida,WIFIS" ClassName="PTWIFIS.BO.ValidaACK" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="PTWIFIS_CvtER7ToXML" Category="CONVERSIO,WIFIS" ClassName="PTWIFIS.BP.ConvertirMsgToXML" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="creaMissatgeACK" Category="SQL,Salida,WIFIS" ClassName="PTWIFIS.BO.creaMissatgeACK" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="PTWIFIS_Rebutjar_Msg" Category="WIFIS" ClassName="PTWIFIS.BP.RebutjarMsg" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="ValidaORUR01" Category="Salida,SQL,WIFIS" ClassName="PTWIFIS.BO.ValidaORUR01" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="RespostaMissatgeNoImplementat" Category="Salida,SQL,WIFIS" ClassName="PTWIFIS.BO.RespostaMissatgeNoImplementat" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="gravacioPeticio" Category="SQL,Salida,WIFIS,PreAltes,TELERADIOLOGIA,Notificacio" ClassName="PTWIFIS.BO.gravacioPeticio" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="PTWIFIS_CvtXMLToER7" Category="CONVERSIO,WIFIS,TELERADIOLOGIA" ClassName="PTWIFIS.BP.ConvertirXMLToMsg" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="LMS_ContactesEnviats" Category="Salida,SQL" ClassName="LMS.BO.GrabarContactosEnviats" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="ConsultaAgendaImplService.ConsultaAgendaImplService" Category="Entrada,SOAP,LMS" ClassName="ConsultaAgendaImplService.ConsultaAgendaImplService" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="ProcesarConsultaVisitas_LMS" Category="LMS" ClassName="ConsultaAgendaImplService.BP.ProcesarConsultaVisitas" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="TemporitzadorWiFIS" Category="WIFIS" ClassName="PTWIFIS.BS.ScheduleService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">30</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="connectSQLToHCIS" Category="WIFIS,ICS,Laboratori,Videoconferencia" ClassName="PTWIFIS.BO.connectSQLToHCIS" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="RetryInterval">2</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="FailureTimeout">4</Setting>
  </Item>
  <Item Name="ControlMissatgeEnviat" Category="WIFIS,PreAltes,TELERADIOLOGIA,Notificacio" ClassName="PTWIFIS.BO.ControlMissatgeEnviat" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="creaMissatgeResposta" Category="WIFIS" ClassName="PTWIFIS.BO.creaMissatgeResposta" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="Ens.ProductionMonitorService" Category="" ClassName="Ens.ProductionMonitorService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">10</Setting>
  </Item>
  <Item Name="General.Utils.BS.ConsultarPacients" Category="SOAP" ClassName="General.Utils.BS.ConsultarPacients" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="General.Utils.BS.consultaSQL" Category="SOAP" ClassName="General.Utils.BS.consultaSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="HPDBIIN HCIS Ordinari" Category="WIFIS,Laboratori,ICS,SABI,BetterCare" ClassName="General.Utils.BS.HL7PendienteHCIS" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="Query">select codigo, tipo, evento, fecha, hora, origen, destino, site 
from hl7_pendiente 
where estado in 
('PENDIENTE') 
and destino in ('wifis','labext','radext','iris') 
order by codigo asc</Setting>
    <Setting Target="Adapter" Name="KeyFieldName"></Setting>
  </Item>
  <Item Name="HPDBIN HCIS Urgent" Category="WIFIS,Laboratori,ICS" ClassName="General.Utils.BS.HL7PendienteHCIS" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="Query">select codigo, tipo, evento, fecha, hora, origen, destino, site 
from hl7_pendiente 
where estado = 'URGENTE'
and destino in ('wifis','labext','radext')  
order by codigo asc</Setting>
  </Item>
  <Item Name="HEADERVALIDATOR" Category="WIFIS,TELERADIOLOGIA" ClassName="General.Utils.Router.HeaderValidatorRouter" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="INPUTSTARTER" Category="WIFIS,TELERADIOLOGIA" ClassName="General.Utils.Router.InputStarter" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="OUTPUTSTARTER" Category="WIFIS,Laboratori,ICS,SABI,BetterCare" ClassName="General.Utils.Router.OutputStarter" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="MantenerHL7Pendiente">1</Setting>
  </Item>
  <Item Name="REPOSITORYVALIDATOR" Category="WIFIS,TELERADIOLOGIA" ClassName="General.Utils.Router.RepositoryValidatorRouter" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="TRANSFORMERtoHCIS" Category="WIFIS" ClassName="General.Utils.BP.TransformerToHCIS" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="FailureTimeout">20</Setting>
    <Setting Target="Host" Name="HL7ServiceURL">http://hcis03-pre.cspt.es:8080/hphis/ws/HL7Service.jws</Setting>
    <Setting Target="Host" Name="ConvInDSN">OENSTEL1</Setting>
  </Item>
  <Item Name="TransformerToInputMessage" Category="WIFIS" ClassName="General.Utils.BP.TransformerToInputMessage" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="actualitzaHL7" Category="WIFIS,Laboratori,ICS,SABI,BetterCare" ClassName="General.Utils.BO.actualitzaHL7" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="carregaMissatge" Category="WIFIS,HCIS,ICS,SQL,Laboratori,SABI,BetterCare" ClassName="General.Utils.BO.carregaMissatge" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Host" Name="HL7FillerURL">http://hcis03-pre.cspt.es:8080/hphis/ws/HL7Filler.jws</Setting>
  </Item>
  <Item Name="PTWIFIS.BS.ConsultarCitesWS" Category="SOAP,WIFIS" ClassName="PTWIFIS.BS.ConsultarCitesWS" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="RAIM.BS.ControlMissatges" Category="RAIM,SOAP" ClassName="RAIM.BS.ControlMissatges" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="RAIM.carregaHL7" Category="RAIM" ClassName="RAIM.BS.carregaHL7" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/interfaces/local/Raim/out</Setting>
    <Setting Target="Adapter" Name="FilePath">/interfaces/local/Raim/in</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.hl7</Setting>
  </Item>
  <Item Name="TCPin" Category="Breezesuite,TELERADIOLOGIA" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory"></Setting>
    <Setting Target="Host" Name="TargetConfigNames">TCPConversor</Setting>
    <Setting Target="Adapter" Name="Port">30100</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Host" Name="IgnoreInboundAck">0</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">1</Setting>
    <Setting Target="Adapter" Name="QSize">100</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">0</Setting>
  </Item>
  <Item Name="lecturaSFTP" Category="ICS,Laboratori,Salida,WIFIS" ClassName="LAB.BS.lecturaSFTP" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="ConnectTimeout">15</Setting>
    <Setting Target="Adapter" Name="FilePath">/reslabics</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.*</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
    <Setting Target="Adapter" Name="Credentials">SFTP_LAB_ICS</Setting>
    <Setting Target="Adapter" Name="FTPServer">hcc.tauli.cat</Setting>
    <Setting Target="Adapter" Name="Protocol">SFTP</Setting>
  </Item>
  <Item Name="BUILDER HPT" Category="HCIS,Laboratori,ICS,Salida,SABI,BetterCare" ClassName="HCIS.BP.Custom.HPT.Builder" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">60</Setting>
    <Setting Target="Host" Name="FailureTimeout">30</Setting>
    <Setting Target="Host" Name="RetryInterval">15</Setting>
    <Setting Target="Host" Name="Sincrono">0</Setting>
  </Item>
  <Item Name="ProcesarMsg_LAB" Category="ICS,Laboratori,WIFIS" ClassName="LAB.BP.ProcesarMsg" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="DirDuplicat">/interfaces/local/Lab ICS/PDF/duplicat/</Setting>
    <Setting Target="Host" Name="DirError">/interfaces/local/Lab ICS/PDF/error/</Setting>
    <Setting Target="Host" Name="DirMissatges">/interfaces/local/Lab ICS/Missatges/</Setting>
  </Item>
  <Item Name="ProcessarMsg_RAIM" Category="RAIM" ClassName="RAIM.BP.ProcesarMsg" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="DirCopia">/interfaces/local/Raim/missatges/</Setting>
  </Item>
  <Item Name="ConvIO HCIS" Category="HCIS,Laboratori,Salida,ICS" ClassName="HCIS.BO.HCIS.ConvIO" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="RetryInterval">10</Setting>
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN"><![CDATA[==> Se configura en el TRANSFORMERtoHCIS o mediante asignacion en un custom. Para envio se coge del HPDBIN]]></Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">60</Setting>
  </Item>
  <Item Name="creaMissatgeConsulta" Category="ICS,SQL,Salida,WIFIS" ClassName="PTWIFIS.BO.creaMissatgeConsulta" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="creaMissatgeLaboratoriICS" Category="" ClassName="LAB.BO.creaMissatgeLaboratoriICS" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="creaMissatgeVisita" Category="ICS,Salida,WIFIS" ClassName="PTWIFIS.BO.creaMissatgeVisita" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="creaMissatgePeticio" Category="WIFIS" ClassName="PTWIFIS.BO.creaMissatgePeticio" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="GeneralToHIS" Category="WIFIS" ClassName="General.Utils.BO.BOGeneralToHIS" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="FailureTimeout">4</Setting>
    <Setting Target="Host" Name="RetryInterval">2</Setting>
  </Item>
  <Item Name="gravacioPedido" Category="PreAltes,WIFIS,Notificacio" ClassName="PTWIFIS.BO.gravacioPedido" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="HIStoHL7" Category="HCIS,Laboratori,WIFIS,Salida,ICS" ClassName="General.Utils.BO.BOHIStoHL7" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="HL7 Filler HCIS" Category="ICS,JAVA,Laboratori,HCIS,SOAP,SABI,BetterCare" ClassName="HCIS.BO.HCIS.HL7Filler.HL7Filler" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="FailureTimeout">5</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">E=R,X=R</Setting>
    <Setting Target="Adapter" Name="ProxyPort"></Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">5</Setting>
    <Setting Target="Adapter" Name="WebServiceURL"><![CDATA[==> Se configura en el carregaMissatge]]></Setting>
  </Item>
  <Item Name="SELECTOR" Category="HCIS,ICS,Salida,Laboratori" ClassName="HCIS.BP.MsgRouter.SelectorEstado" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation"></Setting>
    <Setting Target="Host" Name="BusinessRuleName">HCIS.Rules.Selector</Setting>
  </Item>
  <Item Name="cercaPacient" Category="HCIS,SQL,WIFIS,HC3,PreAltes,TELERADIOLOGIA,Notificacio,DW,LMS" ClassName="General.Utils.BO.cercaPacient" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="ValidaSIU" Category="ICS,SQL,Salida,WIFIS" ClassName="PTWIFIS.BO.ValidaSIU" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
  </Item>
  <Item Name="ValidaSRRS01" Category="ICS,SQL,Salida,WIFIS" ClassName="PTWIFIS.BO.ValidaSRRS01" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="WS_Laboratori" Category="Laboratori,ICS,SOAP,Salida" ClassName="LAB.BO.PortWS" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Adapter" Name="WebServiceClientClass">LAB.WSICS.WSPeticioLabSoap</Setting>
  </Item>
  <Item Name="DISTRIBUTOR" Category="WIFIS,Laboratori,ICS,SABI,Videoconferencia,TELERADIOLOGIA,BetterCare" ClassName="General.Utils.BP.MsgRouter.Distributor" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="Validation"></Setting>
    <Setting Target="Host" Name="BusinessRuleName"></Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">30</Setting>
    <Setting Target="Host" Name="RetryInterval">0</Setting>
  </Item>
  <Item Name="ValidaORGO20" Category="ICS,SQL,Salida,WIFIS" ClassName="PTWIFIS.BO.ValidaORGO20" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="creaHL7Resultats" Category="" ClassName="General.Utils.BO.creaMissatgeResultats" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="CercaVisita" Category="Breezesuite,Laboratori" ClassName="General.Utils.BO.HCIS.CercaVisitaSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="ProcesarMsg" Category="Breezesuite" ClassName="General.Utils.BP.ProcesarMsg" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="DirDuplicat">/interfaces/local/@origen/PDF/duplicat/</Setting>
    <Setting Target="Host" Name="DirError">/interfaces/local/@origen/PDF/error/</Setting>
    <Setting Target="Host" Name="DirMissatges">/interfaces/local/@origen/PDF/Missatges/</Setting>
  </Item>
  <Item Name="HL7Service HCIS" Category="WIFIS,ICS,Laboratori,SABI" ClassName="HCIS.BO.HCIS.HL7Service.HL7Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="FailureTimeout">25</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">E=R,X=R</Setting>
    <Setting Target="Host" Name="RetryInterval">3</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">15</Setting>
    <Setting Target="Adapter" Name="WebServiceURL"><![CDATA[==> Se configura en el TRANSFORMERtoHCIS o mediante asignacion en un custom. Para envio se coge del HPDBIN]]></Setting>
  </Item>
  <Item Name="carregaPDF" Category="" ClassName="PTSQL.BS.carregaPDF" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/interfaces/local/Breezesuite/PDF/out</Setting>
    <Setting Target="Adapter" Name="FilePath">/interfaces/remote//breezesuite/Ensemble</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.pdf;*.PDF</Setting>
  </Item>
  <Item Name="carregaSon" Category="" ClassName="PTSQL.BS.carregaHL7Son" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/interfaces/remote/EstudiSon/EstudisG3/test</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.pdf</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/interfaces/local/LabSon/Fin</Setting>
    <Setting Target="Adapter" Name="FTPPort">22</Setting>
    <Setting Target="Adapter" Name="FTPServer">nas01.cspt.es</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Adapter" Name="UseFileStream">1</Setting>
    <Setting Target="Adapter" Name="Credentials">c_estudiSon</Setting>
    <Setting Target="Host" Name="DirError">/interfaces/local/LabSon/PDF/error</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
    <Setting Target="Adapter" Name="Protocol">SFTP</Setting>
  </Item>
  <Item Name="PTWIFIS.BS.ActualizarEstadoPedido" Category="" ClassName="PTWIFIS.BS.ActualizarEstadoPedido" PoolSize="0" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="General.Utils.BS.ActualizarEstadoPedido" Category="WIFIS" ClassName="General.Utils.BS.ActualizarEstadoPedido" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="controlErrors" Category="" ClassName="General.Utils.BP.ControlErrors" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="Notify" Category="" ClassName="General.Utils.BO.LOG.enviamentCorreo" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Adapter" Name="From">IRIS-BASE-WIFIS@tauli.cat</Setting>
    <Setting Target="Adapter" Name="Recipient">integracioBASE@tauli.cat</Setting>
    <Setting Target="Adapter" Name="SMTPPort">25</Setting>
    <Setting Target="Adapter" Name="SMTPServer">smtp.tauli.cat</Setting>
    <Setting Target="Adapter" Name="Cc">tomas@tauli.cat</Setting>
  </Item>
  <Item Name="connectSQLToHCISGEN" Category="HC3ISC,HC3,PreAltes,WIFIS,BetterCare,Notificacio,DW,LMS" ClassName="General.Utils.BO.connectSQLToHCIS" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="FailureTimeout">4</Setting>
    <Setting Target="Host" Name="RetryInterval">2</Setting>
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="ConsultaHC3" Category="HC3" ClassName="HC3.Port" PoolSize="3" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="SSLConfig">SSL</Setting>
    <Setting Target="Adapter" Name="WebServiceClientClass">HC3.consultes.EtcCerquesImplPort</Setting>
    <Setting Target="Host" Name="FailureTimeout">60</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">15</Setting>
    <Setting Target="Host" Name="RetryInterval">20</Setting>
  </Item>
  <Item Name="XMLHC3ToGeneral" Category="HC3" ClassName="HC3.BO.XMLHC3ToGeneral" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="Curs Clinic HC3" Category="REST,HC3" ClassName="HC3.BS.ConsultesHC3" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
  </Item>
  <Item Name="General.Utils.BS.ControlMissatges" Category="" ClassName="General.Utils.BS.ControlMissatges" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="HC3.BS.Consultas" Category="HC3" ClassName="HC3.BS.Consultas" PoolSize="0" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="TCPConversor" Category="TELERADIOLOGIA" ClassName="General.Utils.Router.TCPconversor" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="outSISDPort" Category="SISD,TELERADIOLOGIA,WIFIS" ClassName="General.Utils.BO.PortTCP" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="FailureTimeout">5</Setting>
    <Setting Target="Adapter" Name="IPAddress">cimd-pre01.rs2004.ct</Setting>
    <Setting Target="Adapter" Name="Port">5200</Setting>
    <Setting Target="Adapter" Name="ReadTimeout">5</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">30</Setting>
    <Setting Target="Adapter" Name="StayConnected">10</Setting>
  </Item>
  <Item Name="MessageConvert" Category="" ClassName="General.Utils.BO.MessageConvert" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="ECOCARDIO.BS.GetForm" Category="ECOCARDIO" ClassName="ECOCARDIO.BS.GetForm" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Port"></Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="ECOCARDIO_GetFormRedirect" Category="ECOCARDIO" ClassName="ECOCARDIO.BO.GetFormRedirect" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="FormURL">https://gformularis.isisscat.intranet.gencat.cat:8443/serveiformularis-dynamic/form.html</Setting>
    <Setting Target="Host" Name="FormTemplateFile">/interfaces/local/csides/Test/IS3Formularis/template-redirect.wc</Setting>
  </Item>
  <Item Name="Tesis.BS.MHDAREST" Category="Tesis" ClassName="Tesis.BS.MHDAREST" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Tesis.BO.MHDA" Category="Tesis" ClassName="Tesis.BO.MHDA" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="URLConsulta">http://tesispre:12346/SISinf/Tesis/MHDA/GestioCasos/EscriptoriTreball.aspx?Tiquet=</Setting>
    <Setting Target="Host" Name="URLGestor">http://tesispre:12346/SISinf/Tesis/MHDA/GestioCasos/GestorCas.aspx?Tiquet=</Setting>
  </Item>
  <Item Name="Tesis.BO.MHDAService" Category="Tesis" ClassName="Tesis.BO.MHDAService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="WebServiceURL">http://tesispre.cspt.es:12346/SISinf/Tesis/MHDA/GestioCasos/GestorCasos.svc</Setting>
  </Item>
  <Item Name="GetInformes" Category="" ClassName="General.Externs.BS.REST.GetInforme" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="NotificationProcessor" Category="Notificacio,PreAltes,WIFIS" ClassName="CSPT.BP.Processor" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="NotificacioEsdeveniment" Category="" ClassName="CSPT.NotificacioEsdeveniment.BP.ProcesarMsg" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="InformeService" Category="HC3ISC,DW,PreAltes,Notificacio" ClassName="General.Externs.WS.Port" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="WebServiceClientClass">General.Externs.WS.InformeService</Setting>
    <Setting Target="Adapter" Name="WebServiceURL">http://hcis-pre.cspt.es/hphis/ws/InformeService.jws</Setting>
    <Setting Target="Adapter" Name="ProxyPort">8080</Setting>
    <Setting Target="Adapter" Name="ProxyServer">hcis03-pre.cspt.es</Setting>
  </Item>
  <Item Name="WSInformationService" Category="" ClassName="General.Externs.WS.Operation.InformeService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="WebServiceClientClass">General.Externs.WS.InformeService</Setting>
    <Setting Target="Adapter" Name="WebServiceURL">http://hcis-pre.cspt.es/hphis/ws/InformeService.jws</Setting>
  </Item>
  <Item Name="connectorDW" Category="DW,PreAltes,SABI,WIFIS,Notificacio" ClassName="DW.BO.connectSQLToHCISforDW" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="CSPT.BS.ReadInbox" Category="PreAltes,WIFIS,Notificacio" ClassName="CSPT.BS.ReadInbox" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">15</Setting>
  </Item>
  <Item Name="creaMissatgeNotificacio" Category="WIFIS,PreAltes,Notificacio" ClassName="PTWIFIS.BO.creaMissatgeNotificacio" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="HC3ISC.BS.ReadInbox" Category="HC3ISC" ClassName="HC3ISC.BS.ReadInbox" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HC3ISC.BP.InboxConsumer" Category="HC3ISC" ClassName="HC3ISC.BP.InboxConsumer" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HC3ISC.BP.SendingConsumer" Category="HC3ISC" ClassName="HC3ISC.BP.SendingConsumer" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="HC3ISC.BP.NormalizationConsumer" Category="HC3ISC" ClassName="HC3ISC.BP.NormalizationConsumer" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="HC3ISC.BS.ReadPacGesSQL" Category="HC3ISC" ClassName="HC3ISC.BS.ReadPacGesSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="DeleteQuery">update pac_ges set valor='Leido' where codigo||ges_tipo||cod_element=? and upper(valor) = 'PENDIENTE'</Setting>
    <Setting Target="Adapter" Name="Query">select codigo||ges_tipo||cod_element ID, codigo, ges_tipo, cod_element from pac_ges where ges_tipo in (select codi from HCIS.PAC_GES_TIPO_IRIS where actiu = 'Y') and upper(valor) = 'PENDIENTE'</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="CallInterval">60</Setting>
    <Setting Target="Adapter" Name="StayConnected">35</Setting>
  </Item>
  <Item Name="TestPacGES_CPR" Category="HC3ISC" ClassName="HC3ISC.BS.ReadPacGesSQL" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="DeleteQuery"></Setting>
    <Setting Target="Adapter" Name="Query">select codigo||ges_tipo||cod_element ID, codigo, ges_tipo, cod_element,valor_ext, FECHA_ULT_MOD, valores_modificados  from pac_ges where codigo=625476 and cod_element = 55222661 and ges_tipo = 'NuevoVAC'</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="CallInterval">3600</Setting>
    <Setting Target="Adapter" Name="StayConnected">35</Setting>
    <Setting Target="Adapter" Name="KeyFieldName"></Setting>
  </Item>
  <Item Name="HC3ISC.BO.UpdatePacGesSQL" Category="HC3ISC" ClassName="HC3ISC.BO.UpdatePacGesSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="StayConnected">10</Setting>
  </Item>
  <Item Name="connectSQLToHCISforHC3" Category="HC3ISC,DW,SABI" ClassName="General.Utils.BO.connectSQLToHCISforHC3" PoolSize="5" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Host" Name="FailureTimeout">4</Setting>
    <Setting Target="Host" Name="RetryInterval">2</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="HC3ISC.WSC.Laboratori201" Category="HC3ISC" ClassName="HC3ISC.WSC.Laboratori201.BO.LaboratoriImplPort" PoolSize="1" Enabled="false" Foreground="false" Comment="WebService v02_01" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLConfig">SSL</Setting>
    <Setting Target="Adapter" Name="WebServiceURL">https://pre.bus.salut.gencat.cat/hc3e/ws/public/Laboratori_v02_01</Setting>
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">1</Setting>
  </Item>
  <Item Name="UenCOVIDftp" Category="COVID" ClassName="COVID.UEN.BO.UenCOVIDftp" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">POTOSI_FTP</Setting>
    <Setting Target="Adapter" Name="FTPPort"></Setting>
    <Setting Target="Adapter" Name="FTPServer">potosides.cspt.es</Setting>
    <Setting Target="Adapter" Name="FilePath">/test/</Setting>
    <Setting Target="Host" Name="FailureTimeout">30</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
    <Setting Target="Adapter" Name="Protocol">SFTP</Setting>
  </Item>
  <Item Name="UenCOVIDsql" Category="COVID" ClassName="COVID.UEN.BO.UenCOVIDsql" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="UenCOVIDProcess" Category="COVID" ClassName="COVID.UEN.BP.UenCOVIDProcess" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="UenCOVIDMonitor" Category="COVID" ClassName="COVID.UEN.BS.UenCOVIDMonitor" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">300</Setting>
  </Item>
  <Item Name="PcrCOVIDftp" Category="COVID" ClassName="COVID.PCR.BO.PcrCOVIDftp" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">POTOSIDES_FTP</Setting>
    <Setting Target="Adapter" Name="FTPPort"></Setting>
    <Setting Target="Adapter" Name="FTPServer">potosides.cspt.es</Setting>
    <Setting Target="Adapter" Name="FilePath">/test/</Setting>
    <Setting Target="Host" Name="FailureTimeout">30</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
    <Setting Target="Adapter" Name="Protocol">SFTP</Setting>
  </Item>
  <Item Name="PcrCOVIDsql" Category="COVID" ClassName="COVID.PCR.BO.PcrCOVIDsql" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="PcrCOVIDProcess" Category="COVID" ClassName="COVID.PCR.BP.PcrCOVIDProcess" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="PcrCOVIDMonitor" Category="COVID" ClassName="COVID.PCR.BS.PcrCOVIDMonitor" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">99999</Setting>
    <Setting Target="Host" Name="UEN">1</Setting>
    <Setting Target="Host" Name="PCR">1</Setting>
  </Item>
  <Item Name="carregaSonFile" Category="" ClassName="PTSQL.BS.carregaHL7SonFie" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="ArchivePath">/interfaces/local/LabSon/Fin</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.pdf</Setting>
    <Setting Target="Adapter" Name="FilePath">/interfaces/remote/LabSon/IntegracionG3</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="SMSToFTP" Category="SMS" ClassName="SMS.Alhora.BO.SMSToFTP" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FTPPort"></Setting>
    <Setting Target="Adapter" Name="FTPServer">138.201.62.185</Setting>
    <Setting Target="Adapter" Name="Credentials">SMS_ALHORA</Setting>
    <Setting Target="Adapter" Name="FilePath">/sftp_101/test/</Setting>
    <Setting Target="Adapter" Name="SFTPAppendMode">Client</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
    <Setting Target="Adapter" Name="Protocol">SFTP</Setting>
  </Item>
  <Item Name="VisitasPacientesToSMS" Category="SMS" ClassName="SMS.Alhora.BO.VisitasPacientesToSMS" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="ProcessSMS" Category="SMS" ClassName="SMS.Alhora.BP.ProcessSMS" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="MonitorToSMS" Category="SMS" ClassName="SMS.Alhora.BS.MonitorToSMS" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">999999</Setting>
  </Item>
  <Item Name="AreesUrgCOVIDftp" Category="COVID" ClassName="COVID.AREESURG.BO.AreesUrgCOVIDftp" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">POTOSIDES_FTP</Setting>
    <Setting Target="Adapter" Name="FTPServer">potosides.cspt.es</Setting>
    <Setting Target="Adapter" Name="FilePath">/test/</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
    <Setting Target="Adapter" Name="Protocol">SFTP</Setting>
  </Item>
  <Item Name="AreesUrgCOVIDsql" Category="COVID" ClassName="COVID.AREESURG.BO.AreesUrgCOVIDsql" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="AreesUrgCOVIDProcess" Category="COVID" ClassName="COVID.AREESURG.BP.AreesUrgCOVIDProcess" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="AreesUrgCOVIDMonitor" Category="COVID" ClassName="COVID.AREESURG.BS.AreesUrgCOVIDMonitor" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">99999</Setting>
  </Item>
  <Item Name="OcupacioCOVIDftp" Category="COVID" ClassName="COVID.OCUPACIO.BO.OcupacioCOVIDftp" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">POTOSI_FTP</Setting>
    <Setting Target="Adapter" Name="FTPServer">potosides.cspt.es</Setting>
    <Setting Target="Adapter" Name="FilePath">/test/</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
    <Setting Target="Adapter" Name="Protocol">SFTP</Setting>
  </Item>
  <Item Name="OcupacioCOVIDsql" Category="COVID" ClassName="COVID.OCUPACIO.BO.OcupacioCOVIDsql" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="OcupacioCOVIDProcess" Category="COVID" ClassName="COVID.OCUPACIO.BP.OcupacioCOVIDProcess" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="OcupacioCOVIDMonitor" Category="COVID" ClassName="COVID.OCUPACIO.BS.OcupacioCOVIDMonitor" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">300</Setting>
  </Item>
  <Item Name="EpisodisCOVIDftp" Category="COVID" ClassName="COVID.EPISODIS.BO.EpisodisCOVIDftp" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">POTOSI_FTP</Setting>
    <Setting Target="Adapter" Name="FTPServer">potosides.cspt.es</Setting>
    <Setting Target="Adapter" Name="FilePath">/test/</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
    <Setting Target="Adapter" Name="Protocol">SFTP</Setting>
  </Item>
  <Item Name="EpisodisCOVIDsql" Category="COVID" ClassName="COVID.EPISODIS.BO.EpisodisCOVIDsql" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="EpisodisCOVIDProcess" Category="COVID" ClassName="COVID.EPISODIS.BP.EpisodisCOVIDProcess" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="EpisodisCOVIDMonitor" Category="COVID" ClassName="COVID.EPISODIS.BS.EpisodisCOVIDMonitor" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">9999</Setting>
  </Item>
  <Item Name="MovimentsCOVIDftp" Category="COVID" ClassName="COVID.MOVIMENTS.BO.MovimentsCOVIDftp" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">POTOSIDES_FTP</Setting>
    <Setting Target="Adapter" Name="FTPServer">potosides.cspt.es</Setting>
    <Setting Target="Adapter" Name="FilePath">/test/</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
    <Setting Target="Adapter" Name="Protocol">SFTP</Setting>
  </Item>
  <Item Name="MovimentsCOVIDsql" Category="COVID" ClassName="COVID.MOVIMENTS.BO.MovimentsCOVIDsql" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="MovimentsCOVIDMonitor" Category="COVID" ClassName="COVID.MOVIMENTS.BS.MovimentsCOVIDMonitor" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">99999</Setting>
  </Item>
  <Item Name="CensHospCOVIDftp" Category="COVID" ClassName="COVID.CENSHOSP.BO.CensHospCOVIDftp" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FTPServer">10.52.4.103</Setting>
    <Setting Target="Adapter" Name="Credentials">CATSALUT_CENS_HOSP</Setting>
    <Setting Target="Adapter" Name="FilePath">/up00741/test/</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
    <Setting Target="Adapter" Name="StayConnected">10</Setting>
    <Setting Target="Adapter" Name="SFTPFileAccessMode">0660</Setting>
    <Setting Target="Adapter" Name="Protocol">SFTP</Setting>
  </Item>
  <Item Name="CensHospCOVIDsql" Category="COVID" ClassName="COVID.CENSHOSP.BO.CensHospCOVIDsql" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="CensHospCOVIDProcess" Category="COVID" ClassName="COVID.CENSHOSP.BP.CensHospCOVIDProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="CensHospCOVIDMonitor" Category="COVID" ClassName="COVID.CENSHOSP.BS.CensHospCOVIDMonitor" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="START:*-*-*T22:00:00,STOP:*-*-*T21:00:00">
    <Setting Target="Adapter" Name="CallInterval">99999</Setting>
  </Item>
  <Item Name="IngTotalCOVIDftp" Category="COVID" ClassName="COVID.INGTOTAL.BO.IngTotalCOVIDftp" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">POTOSIDES_FTP</Setting>
    <Setting Target="Adapter" Name="FTPServer">potosides.cspt.es</Setting>
    <Setting Target="Adapter" Name="FilePath">/test/</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
    <Setting Target="Adapter" Name="Protocol">SFTP</Setting>
  </Item>
  <Item Name="IngTotalCOVIDsql" Category="COVID" ClassName="COVID.INGTOTAL.BO.IngTotalCOVIDsql" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="IngTotalCOVIDProcess" Category="COVID" ClassName="COVID.INGTOTAL.BP.IngTotalCOVIDProcess" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="IngTotalCOVIDMonitor" Category="COVID" ClassName="COVID.INGTOTAL.BS.IngTotalCOVIDMonitor" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">99999</Setting>
  </Item>
  <Item Name="CentresOrigenCOVIDftp" Category="COVID" ClassName="COVID.CENTRESORIGEN.BO.CentresOrigenCOVIDftp" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">POTOSIDES_FTP</Setting>
    <Setting Target="Adapter" Name="FTPServer">potosides.cspt.es</Setting>
    <Setting Target="Adapter" Name="FilePath">/test/</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
    <Setting Target="Adapter" Name="Protocol">SFTP</Setting>
  </Item>
  <Item Name="CentresOrigenCOVIDsql" Category="COVID" ClassName="COVID.CENTRESORIGEN.BO.CentresOrigenCOVIDsql" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="CentresOrigenCOVIDProcess" Category="COVID" ClassName="COVID.CENTRESORIGEN.BP.CentresOrigenCOVIDProcess" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="CentresOrigenCOVIDMonitor" Category="COVID" ClassName="COVID.CENTRESORIGEN.BS.CentresOrigenCOVIDMonitor" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">99999</Setting>
  </Item>
  <Item Name="ConsultaHC3v21" Category="HC3,COVID" ClassName="HC3.PortV21" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="FailureTimeout">60</Setting>
    <Setting Target="Host" Name="RetryInterval">30</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">15</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SSL</Setting>
    <Setting Target="Adapter" Name="WebServiceClientClass">HC3.consultesV21.EtcCerquesImplPort</Setting>
    <Setting Target="Adapter" Name="WebServiceURL">https://pre.bus.salut.gencat.cat/hc3e/ws/public/EtcCerques_v02_01</Setting>
    <Setting Target="Host" Name="SAMLIssuer">ParcTauli</Setting>
    <Setting Target="Host" Name="X509CertAlias">CDA2021</Setting>
    <Setting Target="Host" Name="SAMLAttributes">{
"ResponsibleUser":"HCC0128WS",
"Profile":"MD",
"ProviderOrganization":"H08002103",
"Entity":"0128",
"CodeUp":"00741",
"GivenName":"SOPORTE",
"FirstFamilyName":"SOPORTE",
"DocumentType":"01",
"DocumentNumber":"44982091W",
"Code":"108323233"
}</Setting>
  </Item>
  <Item Name="HC3ISC.WSC.Apat" Category="HC3ISC" ClassName="HC3ISC.WSC.Apat.BO.ApatImplPort" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ReplyCodeActions">https://pre.bus.salut.gencat.cat:443/hc3e/ws/public/Apat_v02_00</Setting>
    <Setting Target="Adapter" Name="WebServiceURL">https://pre.bus.salut.gencat.cat:443/hc3e/ws/public/Apat_v02_00</Setting>
  </Item>
  <Item Name="HC3ISC.WSC.CursClinic" Category="HC3ISC" ClassName="HC3ISC.WSC.CursClinic.BO.DocumentCCCentralitzatImplPort" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="WebServiceURL">https://pre.bus.salut.gencat.cat/hc3e/ws/public/Curs-Clinic-Centralitzat-v02_00</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SSL</Setting>
  </Item>
  <Item Name="HC3ISC.WSC.Documents" Category="HC3ISC" ClassName="HC3ISC.WSC.Documents.BO.DocumentsImplPort" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="WebServiceURL">https://pre.bus.salut.gencat.cat:443/hc3e/ws/public/Documents_v02_00</Setting>
  </Item>
  <Item Name="HC3ISC.WSC.Imatge" Category="HC3ISC" ClassName="HC3ISC.WSC.Imatge.BO.ImatgeImplPort" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="WebServiceURL">https://pre.bus.salut.gencat.cat:443/hc3e/ws/public/Imatge_v02_00</Setting>
  </Item>
  <Item Name="EnviaMailDuplicats" Category="SMS" ClassName="SMS.Alhora.BO.EnviaMailDuplicats" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SMTPServer">smtp.tauli.cat</Setting>
    <Setting Target="Adapter" Name="From">mguerrero@tauli.cat</Setting>
    <Setting Target="Adapter" Name="Recipient">mguerrero@tauli.cat</Setting>
  </Item>
  <Item Name="controlVisitesVideoconferencia" Category="Videoconferencia" ClassName="General.Circuits.Videoconferencia.BO.controlVisites" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="outIRIS" Category="SABI" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="FailureTimeout">5</Setting>
    <Setting Target="Adapter" Name="IPAddress">preproduccio.integracio.salut.tauli.cat</Setting>
    <Setting Target="Adapter" Name="Port">30050</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">2</Setting>
    <Setting Target="Adapter" Name="StayConnected">30</Setting>
  </Item>
  <Item Name="controlVisites" Category="Videoconferencia" ClassName="General.Circuits.Videoconferencia.BS.controlVisites" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">3000</Setting>
  </Item>
  <Item Name="RESTSender" Category="Videoconferencia" ClassName="General.Circuits.Videoconferencia.BO.RESTSender" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="HTTPPort">3443</Setting>
    <Setting Target="Adapter" Name="HTTPServer">preproduccio.integracio.salut.tauli.cat</Setting>
    <Setting Target="Adapter" Name="URL">/ssc/teleconsulta/meetings</Setting>
    <Setting Target="Host" Name="FailureTimeout">20</Setting>
    <Setting Target="Host" Name="RetryInterval">0</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">20</Setting>
    <Setting Target="Host" Name="URL">/ssc/teleconsulta/meetings/</Setting>
    <Setting Target="Adapter" Name="Credentials">API_videoapi</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SSL</Setting>
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Host" Name="Auth"></Setting>
    <Setting Target="Host" Name="HostHeader">preproduccio.videoapi.intranet.catsalut.cat:443</Setting>
    <Setting Target="Adapter" Name="HostHeader">videoapi.intranet.catsalut.cat</Setting>
    <Setting Target="Adapter" Name="ProxyHTTPS">0</Setting>
    <Setting Target="Adapter" Name="ProxyPort"></Setting>
    <Setting Target="Adapter" Name="ProxyServer"></Setting>
  </Item>
  <Item Name="DirectRESTSender" Category="Videoconferencia" ClassName="General.Circuits.Videoconferencia.BO.RESTSender" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="HTTPPort"></Setting>
    <Setting Target="Adapter" Name="HTTPServer">preproduccio.videoapi.intranet.catsalut.cat</Setting>
    <Setting Target="Adapter" Name="URL">/video/api/meetings/</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SSL</Setting>
    <Setting Target="Host" Name="FailureTimeout">60</Setting>
    <Setting Target="Host" Name="RetryInterval">0</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">60</Setting>
    <Setting Target="Host" Name="HostHeader">preproduccio.videoapi.intranet.catsalut.cat:443</Setting>
  </Item>
  <Item Name="Test.BO.RESTSender" Category="Videoconferencia" ClassName="Test.BO.RESTSender" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="HTTPPort">5000</Setting>
    <Setting Target="Adapter" Name="HTTPServer">produccio.integracio.salut.tauli.cat</Setting>
    <Setting Target="Adapter" Name="URL">/hcis/paciente/</Setting>
    <Setting Target="Host" Name="FailureTimeout">20</Setting>
    <Setting Target="Host" Name="RetryInterval">0</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">20</Setting>
    <Setting Target="Adapter" Name="Credentials">SABI</Setting>
  </Item>
  <Item Name="SABI_GeneralRepositoryconnector" Category="SABI,HC3ISC,DW" ClassName="SABI.BO.PortWS" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="WebServiceClientClass">SABI.WSC.WSGeneralRepositorySoap</Setting>
    <Setting Target="Adapter" Name="WebServiceURL">http://preproduccio.integracio.salut.tauli.cat:32773/csp/sabi/ING.WSC.GRRouter.cls</Setting>
    <Setting Target="Adapter" Name="Credentials">SABI</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
  </Item>
  <Item Name="DWconsultor" Category="DW,SABI" ClassName="DW.BS.Consultes" PoolSize="0" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="DW.BS.consulta" Category="DW,SABI" ClassName="DW.BS.consulta" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="DW_WorkTableProcess" Category="DW,SABI" ClassName="DW.BS.WorkTableProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Query">select * from DW_Class.WorkTable where estat = 'PENDING' and desti='sabi'</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
    <Setting Target="Adapter" Name="DSN">WIFIS</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
    <Setting Target="Adapter" Name="KeyFieldName">ID1</Setting>
  </Item>
  <Item Name="DW_GeneralToRepository" Category="DW,SABI" ClassName="DW.BO.GeneralToRepository" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="connectSQLByClass" Category="DW,SABI" ClassName="DW.BO.connectSQLByClass" PoolSize="5" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="WorkTableRouter" Category="DW,SABI" ClassName="DW.BP.WorkTableRouter" PoolSize="20" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="outFilePowerBI" Category="DW" ClassName="DW.BO.outFilePowerBI" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/backup/powerbi</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
  </Item>
  <Item Name="FTPtoInsite" Category="DW" ClassName="DW.BO.FTPtoINSITE" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">INSITE</Setting>
    <Setting Target="Adapter" Name="FTPPort">22</Setting>
    <Setting Target="Adapter" Name="FTPServer">insite01.cspt.es</Setting>
    <Setting Target="Adapter" Name="FilePath">/import</Setting>
    <Setting Target="Adapter" Name="Protocol">SFTP</Setting>
  </Item>
  <Item Name="PAOS.BO.ObtenirURL" Category="PAOS" ClassName="PAOS.BO.ObtenirURL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="URLPAO">http://a200.ecap.intranet.gencat.cat/prescripcionsPAOS/forms/DefaultAmbToquen.aspx?identificador=</Setting>
  </Item>
  <Item Name="PAOS.WSC.BO.icshccSoap" Category="PAOS" ClassName="PAOS.WSC.BO.icshccSoap" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="videoConsultaREST" Category="HCIS,REST,Videoconferencia" ClassName="General.Circuits.Videoconferencia.BS.Videoconsulta" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="SenderElement">RESTSender</Setting>
  </Item>
  <Item Name="eConsultes.BS.ReadInbox" Category="WIFIS,eConsultes,Notificacio" ClassName="eConsultes.BS.ReadInbox" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">500000</Setting>
  </Item>
  <Item Name="outBetterCare" Category="BetterCare" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">cowlitz1.cspt.es</Setting>
    <Setting Target="Adapter" Name="Port">8001</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">30</Setting>
    <Setting Target="Host" Name="FailureTimeout">5</Setting>
    <Setting Target="Adapter" Name="StayConnected">10</Setting>
  </Item>
  <Item Name="EpidemCOVIDftp" Category="COVID" ClassName="COVID.EPIDEM.BO.EpidemCOVIDftp" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">POTOSI_FTP</Setting>
    <Setting Target="Adapter" Name="FTPServer">potosides.cspt.es</Setting>
    <Setting Target="Adapter" Name="FilePath">/test/</Setting>
    <Setting Target="Adapter" Name="Protocol">SFTP</Setting>
  </Item>
  <Item Name="EpidemCOVIDsql" Category="COVID" ClassName="COVID.EPIDEM.BO.EpidemCOVIDsql" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="EpidemCOVIDProcess" Category="COVID" ClassName="COVID.EPIDEM.BP.EpidemCOVIDProcess" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="EpidemCOVIDMonitor" Category="COVID" ClassName="COVID.EPIDEM.BS.EpidemCOVIDMonitor" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">99999</Setting>
  </Item>
  <Item Name="recuperacioEcocardiogrames" Category="WIFIS" ClassName="PTWIFIS.BS.recuperacioEcocardiogrames" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="Nivell3UrgDetCOVIDftp" Category="COVID" ClassName="COVID.NIVELL3URGDET.BO.Nivell3UrgDetCOVIDftp" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">POTOSI_FTP</Setting>
    <Setting Target="Adapter" Name="FTPServer">potosides.cspt.es</Setting>
    <Setting Target="Adapter" Name="FilePath">/test/</Setting>
    <Setting Target="Adapter" Name="Protocol">SFTP</Setting>
  </Item>
  <Item Name="Nivell3UrgDetCOVIDsql" Category="COVID" ClassName="COVID.NIVELL3URGDET.BO.Nivell3UrgDetCOVIDsql" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="Nivell3UrgDetCOVIDProcess" Category="COVID" ClassName="COVID.NIVELL3URGDET.BP.Nivell3UrgDetCOVIDProcess" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Nivell3UrgDetCOVIDMonitor" Category="COVID" ClassName="COVID.NIVELL3URGDET.BS.Nivell3UrgDetCOVIDMonitor" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">999999</Setting>
  </Item>
  <Item Name="eConsultes.BO.MovimentsEConsultes" Category="eConsultes" ClassName="eConsultes.BO.MovimentsEConsultes" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="General.Utils.BS.ConsultarProfessionals" Category="SOAP" ClassName="General.Utils.BS.ConsultarProfessionals" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="cercaProfessional" Category="HCIS,SQL" ClassName="General.Utils.BO.cercaProfessional" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="obtePrealtes" Category="WIFIS,PreAltes,Notificacio" ClassName="CSPT.BS.obtePreAltes" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">30</Setting>
  </Item>
  <Item Name="SMSAlertSQL" Category="SMS" ClassName="SMS.Alhora.BO.SMSAlertSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="SMSAlertService" Category="SMS" ClassName="SMS.Alhora.BS.SMSAlertService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="START:*-*-*T10:00:00,STOP:*-*-*T20:00:00">
    <Setting Target="Adapter" Name="CallInterval">3600</Setting>
  </Item>
  <Item Name="MovimentsCOVIDProcess" Category="COVID" ClassName="COVID.MOVIMENTS.BP.MovimentsCOVIDProcess" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="COVIDftp" Category="COVID,BI" ClassName="COVID.BO.COVIDftp" PoolSize="10" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="filePCR">pcr</Setting>
    <Setting Target="Host" Name="fileUEN">unitat_enfermeria</Setting>
    <Setting Target="Adapter" Name="Credentials">POTOSIDES_FTP</Setting>
    <Setting Target="Adapter" Name="FTPServer">potosides.cspt.es</Setting>
    <Setting Target="Adapter" Name="FilePath">/test/</Setting>
    <Setting Target="Adapter" Name="Protocol">SFTP</Setting>
    <Setting Target="Adapter" Name="StayConnected">3</Setting>
    <Setting Target="Host" Name="fileAreesUrg">arees_urgencies</Setting>
    <Setting Target="Host" Name="fileCentresOrigen">centresorigen</Setting>
    <Setting Target="Host" Name="fileEpidem">covid_epi</Setting>
    <Setting Target="Host" Name="fileEpisodis">episodis_covid</Setting>
    <Setting Target="Host" Name="fileIngTotal">ingtotal</Setting>
    <Setting Target="Host" Name="fileMoviments">moviments_covid</Setting>
    <Setting Target="Host" Name="fileNivell3UrgDet">urgniv3det</Setting>
    <Setting Target="Host" Name="fileOcupacio">ocupacio</Setting>
  </Item>
  <Item Name="COVIDsql" Category="COVID,BI" ClassName="COVID.BO.COVIDsql" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">3</Setting>
  </Item>
  <Item Name="COVIDService" Category="COVID,BI" ClassName="COVID.BS.COVIDService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="PCR">0</Setting>
    <Setting Target="Host" Name="UEN">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">9999</Setting>
    <Setting Target="Host" Name="AreesUrg">0</Setting>
    <Setting Target="Host" Name="CentresOrigen">0</Setting>
    <Setting Target="Host" Name="Epidem">0</Setting>
    <Setting Target="Host" Name="Episodis">0</Setting>
    <Setting Target="Host" Name="IngTotal">0</Setting>
    <Setting Target="Host" Name="Moviments">0</Setting>
    <Setting Target="Host" Name="Nivell3UrgDet">0</Setting>
    <Setting Target="Host" Name="Ocupacio">1</Setting>
  </Item>
  <Item Name="BIftp" Category="BI" ClassName="BI.BO.BIftp" PoolSize="5" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="fileActAmbulatoria">/Fact/Activitat/actambulatoria</Setting>
    <Setting Target="Host" Name="fileAltes">/Fact/Altas/Actual/altes</Setting>
    <Setting Target="Host" Name="fileLlieQuir">/Fact/Llista Espera/Actual/llespera_qui</Setting>
    <Setting Target="Host" Name="fileLlieVisites">/Fact/Llista Espera/Actual/llesperavisp</Setting>
    <Setting Target="Host" Name="fileMovAdm">/Fact/Altas/Actual/movadm</Setting>
    <Setting Target="Adapter" Name="Credentials">POTOSIDES_FTP</Setting>
    <Setting Target="Adapter" Name="FTPServer">potosides.cspt.es</Setting>
    <Setting Target="Adapter" Name="FilePath">/test/</Setting>
    <Setting Target="Adapter" Name="Protocol">SFTP</Setting>
    <Setting Target="Adapter" Name="StayConnected">3</Setting>
    <Setting Target="Host" Name="fileLlieQuirBT">/Fact/Llista Espera/Actual/llespera_qui_bt</Setting>
  </Item>
  <Item Name="BIsql" Category="BI" ClassName="BI.BO.BIsql" PoolSize="5" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">3</Setting>
  </Item>
  <Item Name="BIService" Category="BI" ClassName="BI.BS.BIService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ActAmbulatoria">0</Setting>
    <Setting Target="Host" Name="Altes">0</Setting>
    <Setting Target="Host" Name="LlieVisites">1</Setting>
    <Setting Target="Host" Name="MovAdm">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">99999</Setting>
    <Setting Target="Host" Name="LlieQuir">0</Setting>
    <Setting Target="Host" Name="LlieQuirBT">0</Setting>
  </Item>
  <Item Name="JavaGateway2019" Category="JAVA" ClassName="ISC.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="Java gateway2019" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="ClassPath">/systemiris/javaapps/jgw2020.4/intersystems-gateway-3.2.0.jar:/systemiris/javaapps/jgw2020.4/intersystems-jdbc-3.2.0.jar:/systemiris/javaapps/jgw2020.4/intersystems-utils-3.2.0.jar</Setting>
    <Setting Target="Host" Name="JVMArgs">-XX:-UseCompressedClassPointers -XX:-UseCompressedOops</Setting>
    <Setting Target="Host" Name="JavaHome">/usr/lib/jvm/java-8-openjdk-amd64</Setting>
    <Setting Target="Host" Name="Port">35561</Setting>
  </Item>
  <Item Name="ISC.Test.BOSQL" Category="Testing" ClassName="ISC.Test.BOSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="Pruebas de Intersystems (JCR/PYD) para investigación errores ORA-01000: maximum open cursors exceeded" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="HC3ISC.WSC.Immunitzacions" Category="HC3ISC" ClassName="HC3ISC.WSC.Immunitzacions.BO.ImmunitzacionsImplPort" PoolSize="1" Enabled="true" Foreground="false" Comment="Alta, baja, mod de vacunaciones" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLConfig">SSL</Setting>
    <Setting Target="Adapter" Name="WebServiceURL">https://pre.bus.salut.gencat.cat/hc3e/ws/public/Immunitzacions_v02_01?wsdl</Setting>
  </Item>
  <Item Name="INT289.Operation" Category="" ClassName="INT289.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="HistoriaInici">939673</Setting>
    <Setting Target="Host" Name="Enviar">10</Setting>
    <Setting Target="Host" Name="HistoriaFi">939673</Setting>
    <Setting Target="Host" Name="SQL"></Setting>
    <Setting Target="Host" Name="Episodi">54352133</Setting>
    <Setting Target="Host" Name="EnviarEpisodis">1</Setting>
    <Setting Target="Host" Name="DiaInici">2021-10-03</Setting>
    <Setting Target="Host" Name="Tipus">'URG'</Setting>
    <Setting Target="Host" Name="DiaFi"></Setting>
  </Item>
  <Item Name="API.IS3.eCONSULTES.BS" Category="" ClassName="API.IS3.eCONSULTES.BS" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Citas REST" Category="LMS" ClassName="General.Utils.BS.CitasREST" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
  </Item>
  <Item Name="consultaVisitesSQLtoHCIS" Category="LMS" ClassName="General.Utils.BO.HCIS.ConsultaVisitasSQL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="DW_Trinetx" Category="DW" ClassName="DW.BS.WorkTableProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="DSN">WIFIS</Setting>
    <Setting Target="Adapter" Name="KeyFieldName">ID1</Setting>
    <Setting Target="Adapter" Name="Query">select * from DW_Class.WorkTable where estat = 'PENDING' and desti='trinetx'</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
  </Item>
  <Item Name="API.TESIS.MHDA.BS" Category="Tesis" ClassName="API.TESIS.MHDA.BS" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="API.CatSalut.PAO.BS" Category="PAOS" ClassName="API.CatSalut.PAO.BS" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="API.Circuits.Videoconferencia.BS" Category="Videoconferencia" ClassName="API.Circuits.Videoconferencia.BS" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="ExportPharmacyToUCI" Category="" ClassName="user.ExportPharmacyToUCI" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">C_ODBPRE.TELEGONO</Setting>
    <Setting Target="Adapter" Name="DSN">OENSTEL1</Setting>
    <Setting Target="Adapter" Name="JGService">JavaGateway</Setting>
    <Setting Target="Adapter" Name="StayConnected">5</Setting>
  </Item>
  <Item Name="IBSP.CXN.SAML20.BO.SAMLSigner" Category="IBSP" ClassName="IBSP.CXN.SAML20.BO.SAMLSigner" PoolSize="1" Enabled="true" Foreground="false" Comment="SAML IRIS Nativo" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="X509CertAlias">CDA2021</Setting>
  </Item>
  <Item Name="TransformerToHCISMDMT02" Category="WIFIS" ClassName="General.Utils.BP.TransformerToHCISMDMT02" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="ConvInDSN">OENSTEL1</Setting>
    <Setting Target="Host" Name="HL7ServiceURL">http://hcis03-pre.cspt.es:8080/hphis/ws/HL7Service.jws</Setting>
  </Item>
</Production>
}

}
