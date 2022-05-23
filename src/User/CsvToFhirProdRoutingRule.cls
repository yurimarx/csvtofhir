/// 
Class User.CsvToFhirProdRoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="">
<constraint name="source" value="FileService"></constraint>
<constraint name="msgClass" value="User.csvfhirmapper.Record"></constraint>
<when condition="1">
<send transform="User.CSVToFhirDTL" target="FhirOperation"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
