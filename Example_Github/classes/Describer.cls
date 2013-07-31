public class Describer {
	public list<SelectOption> selectedobject { get; set; }
   	public String objectName { get; set; }    
    public set<string> flds{get;set;}

	Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();

    public Describer(){
	    selectedobject = new list<SelectOption>();  
        selectedobject.add(new selectoption('','-None-'));
        
        list<schema.SobjectType> lst = schemaMap.values();
        for(schema.SobjectType ss:lst){
    	    selectedobject.add(new selectoption(ss.getDescribe().getLocalName(),ss.getDescribe().getLabel()));
            selectedobject.sort();
        }
        flds = new set<string>();
        lsps = new list<SelectOption>();
    }
 
    public String fields { get; set; }
    public list<SelectOption> lsps{get;set;}
      
    public void function() {
	    if(objectName!=null || objectName!='' || objectName !='-None'){
	        lsps.clear();
            Map<string,Schema.SObjectField> mpConField=schemaMap.get(objectName).getDescribe().fields.getMap();
   			
            flds=mpConField.keySet(); 
            System.debug('flds=mpConField.keySet();=======>'+flds);
            for(string name:flds){
	            Schema.DescribeFieldResult fldResult=mpConField.get(name).getDescribe();
                System.debug('Schema.DescribeFieldResult fldResult=mpConField.get(name).getDescribe();=====>'+fldResult);
                if((fldResult.getName()).contains('__c'))
    	            lsps.add(new SelectOption(fldResult.getLabel(),fldResult.getLabel()));
                lsps.sort();       
            } 
     	}        
    }
}


/*public with sharing class Describer{
	public Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
	public List<Pair> lstfieldname{get;set;}
	public List<Pair> fields {get{return lstfieldname;} set{lstfieldname =value;}}
	public List<SelectOption> objectNames{public get; private set;}
	public String selectedObject {get; set;}

// Intialize objectNames and fields

	public Describer() {
		objectNames = initObjNames();
		fields = new List<Pair>();
	}
// Populate SelectOption list -

// find all sObjects available in the organization

	private List<SelectOption> initObjNames() {
		List<SelectOption> objNames = new List<SelectOption>();
		List<String> entities = new List<String>(schemaMap.keySet());
		entities.sort();
		for(String name : entities)
		objNames.add(new SelectOption(name,name));
		return objNames;
	}

// Find the fields for the selected object

	public void showFields() {
		//fields.clear();
		system.debug('$$$$$' + selectedObject);
		Map <String, Schema.SObjectField> fieldMap = schemaMap.get(selectedObject).getDescribe().fields.getMap();
		for(Schema.SObjectField sfield : fieldMap.Values())
		{
			schema.describefieldresult dfield = sfield.getDescribe();
			system.debug('#######' + dfield );
			Pair field = new Pair();
			field.key = dfield.getname();
			system.debug('#######4444' + field.key);
			field.val = dfield.getType () + ' : ' + dfield.getLabel ();
			lstfieldname.add(field);
		}
	}

	public class Pair {
		public String key {get; set;}
		public String val {get; set;}
	}
}
*/