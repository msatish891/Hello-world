public with sharing class SearchLead_Controller {
	public Lead lead;
	public List<lead> leadList{get;set;} 
	public String firstName{get; set;}
	public String lastName{get;set;}
	public String phone{get;set;}
	public String email{get;set;}
	public Integer zipcode{get;set;}
	public String company{get;set;}
	public String selectedLeadId{get;set;}
	public Boolean showCreateLead{get;set;}
	public Boolean showSearchLead{get;set;}
	public Boolean showResults{get;set;}	
	
	public SearchLead_Controller(ApexPages.StandardController controller) {
        leadList= new List<lead>();        
        lead = (Lead) controller.getRecord(); //Getting record from VF page
        showCreateLead=false;
        showSearchLead=false;
        showResults=false;
    }
    
    public Boolean getShowResults(){
    	return showResults;
    }
    
    public void searchLead(){
    	leadList=[SELECT Id,FirstName,LastName,Company,Zipcode__c FROM Lead WHERE FirstName LIKE: '%'+firstName+'%' AND LastName LIKE: '%'+lastName+'%'];
    	if(leadList.size()>0){
    		showCreateLead=false;
    		showResults=true;
    	}
    	else{
    		showCreateLead=true;
    		showResults=false;
    	}
    }
           
    public void createLead(){
   		lead=new Lead();
   		lead.FirstName=firstName;
   		lead.LastName=lastName;
   		lead.Phone=phone;
   		lead.Email=email;
   		lead.Company=firstName+lastName;
   		lead.Zipcode__c=zipcode;
   		insert lead;
   		showSearchLead=true;
   		showCreateLead=false;
    }
    
    public PageReference leadDetailPage(){
    	PageReference detail = new PageReference('/'+selectedLeadId);
    	detail.setRedirect(true);
    	return detail;
    }
    
    public PageReference reset(){
    	PageReference reDirect = new PageReference(System.currentPageReference().getURL());
    	reDirect.getParameters().clear();
    	reDirect.setRedirect(true);
    	return reDirect;
    }
}