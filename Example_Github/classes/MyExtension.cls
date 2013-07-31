public with sharing class MyExtension {

	public String name{get;set;}
    public MyExtension() {

    }


   /* 
    public List<Account> acc {get;set;}
       
    public MyExtension(ApexPages.StandardController controller) {
        acc = new List<Account>();
        acc=[SELECT Id,Name FROM Account WHERE Id=: ApexPages.currentPage().getParameters().get('id')]; 
    }
    */
    public PageReference redirect(){
        return new PageReference('/'+name);
    }
}