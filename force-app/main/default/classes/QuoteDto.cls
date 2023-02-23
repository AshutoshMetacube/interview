public with sharing class QuoteDto extends BaseDto {
    @AuraEnabled
    public Date endDate{get;set;}
    @AuraEnabled
    public Date startDate{get;set;}
    
    @AuraEnabled
    public String name{get;set;}
    
    public QuoteDto() {
    }
    
    public QuoteDto(Quote__c quote) {
        super(quote);
        this.endDate = quote.EndDate__c;
        this.startDate = quote.StartDate__c;
        this.name = quote.Name;
    }
    
    public override SObject refreshSo() {
        return null;
    }
    
}