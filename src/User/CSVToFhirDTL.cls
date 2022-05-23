Class User.CSVToFhirDTL Extends Ens.DataTransformDTL [ DependsOn = (User.csvfhirmapper.Record, User.FhirRequest) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='User.csvfhirmapper.Record' targetClass='User.FhirRequest' create='new' language='objectscript' >
<assign value='source.npi' property='target.id' action='set' />
<assign value='source.provider' property='target.name' action='set' />
</transform>
}

}
