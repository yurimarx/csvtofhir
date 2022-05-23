Class User.FhirRequest Extends Ens.Request
{

Property id As %String;

Property name As %String;

Storage Default
{
<Data name="FhirRequestDefaultData">
<Subscript>"FhirRequest"</Subscript>
<Value name="1">
<Value>id</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
</Data>
<DefaultData>FhirRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
