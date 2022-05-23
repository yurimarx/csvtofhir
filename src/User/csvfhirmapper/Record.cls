/// RECORDMAP: Generated from RecordMap 'User.csvfhirmapper'
/// on 2022-05-22 at 13:46:03.547 [2022-05-22 13:46:03.547 UTC]
/// by user _SYSTEM
Class User.csvfhirmapper.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property provider As %String(MAXLEN = 300);

Property healthsystemname As %String(MAXLEN = 300);

Property hospitalownership As %String(MAXLEN = 300);

Property code As %String(MAXLEN = 300);

Property codetype As %String(MAXLEN = 300);

Property chargedescription As %String(MAXLEN = 300);

Property codeclass As %String(MAXLEN = 300);

Property planraw As %String(MAXLEN = 300);

Property mappedpayer As %String(MAXLEN = 300);

Property mappedpayerclass As %String(MAXLEN = 300);

Property rate As %String(MAXLEN = 300);

Property medicareproviderid As %String(MAXLEN = 300);

Property npi As %String(MAXLEN = 300);

Property long As %String;

Property lat As %String;

Property streetaddress As %String(MAXLEN = 300);

Property city As %String(MAXLEN = 300);

Property state As %String;

Property zipcode As %String;

Property county As %String(MAXLEN = 300);

Property medicarecbsa As %String(MAXLEN = 300);

Property acutecarefacility As %String(MAXLEN = 300);

Property hospitaloverallrating As %String(MAXLEN = 300);

Property hospitaltype As %String;

Property totalbeds As %String;

Property location As %String(MAXLEN = 300);

Property tqcompliancescore As %String(MAXLEN = 300);

Property cmsqualityrating As %String(MAXLEN = 300);

Property effectivenessofcarenationalcomparison As %String(MAXLEN = 300);

Property efficientuseofmedicalimagingnationalcomparison As %String(MAXLEN = 300);

Property mortalitynationalcomparison As %String(MAXLEN = 300);

Property patientexperiencenationalcomparison As %String(MAXLEN = 300);

Property readmissionnationalcomparison As %String(MAXLEN = 300);

Property safetyofcarenationalcomparison As %String(MAXLEN = 300);

Property timelinessofcarenationalcomparison As %String(MAXLEN = 300);

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>provider</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>hospitalownership</Value>
</Value>
<Value name="5">
<Value>code</Value>
</Value>
<Value name="6">
<Value>codetype</Value>
</Value>
<Value name="7">
<Value>chargedescription</Value>
</Value>
<Value name="8">
<Value>codeclass</Value>
</Value>
<Value name="9">
<Value>planraw</Value>
</Value>
<Value name="10">
<Value>mappedpayer</Value>
</Value>
<Value name="11">
<Value>mappedpayerclass</Value>
</Value>
<Value name="12">
<Value>rate</Value>
</Value>
<Value name="13">
<Value>medicareproviderid</Value>
</Value>
<Value name="14">
<Value>npi</Value>
</Value>
<Value name="15">
<Value>long</Value>
</Value>
<Value name="16">
<Value>lat</Value>
</Value>
<Value name="17">
<Value>streetaddress</Value>
</Value>
<Value name="18">
<Value>city</Value>
</Value>
<Value name="19">
<Value>state</Value>
</Value>
<Value name="20">
<Value>zipcode</Value>
</Value>
<Value name="21">
<Value>county</Value>
</Value>
<Value name="22">
<Value>medicarecbsa</Value>
</Value>
<Value name="23">
<Value>acutecarefacility</Value>
</Value>
<Value name="24">
<Value>hospitaloverallrating</Value>
</Value>
<Value name="25">
<Value>hospitaltype</Value>
</Value>
<Value name="26">
<Value>totalbeds</Value>
</Value>
<Value name="27">
<Value>location</Value>
</Value>
<Value name="28">
<Value>tqcompliancescore</Value>
</Value>
<Value name="29">
<Value>cmsqualityrating</Value>
</Value>
<Value name="30">
<Value>effectivenessofcarenationalcomparison</Value>
</Value>
<Value name="31">
<Value>efficientuseofmedicalimagingnationalcomparison</Value>
</Value>
<Value name="32">
<Value>mortalitynationalcomparison</Value>
</Value>
<Value name="33">
<Value>patientexperiencenationalcomparison</Value>
</Value>
<Value name="34">
<Value>readmissionnationalcomparison</Value>
</Value>
<Value name="35">
<Value>safetyofcarenationalcomparison</Value>
</Value>
<Value name="36">
<Value>timelinessofcarenationalcomparison</Value>
</Value>
<Value name="37">
<Value>healthsystemname</Value>
</Value>
</Data>
<DataLocation>^User.csvfhirmapper.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^User.csvfhirmapper.RecordD</IdLocation>
<IndexLocation>^User.csvfhirmapper.RecordI</IndexLocation>
<StreamLocation>^User.csvfhirmapper.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
