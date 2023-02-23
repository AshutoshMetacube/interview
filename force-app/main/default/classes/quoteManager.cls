public class quoteManager {
    
    @AuraEnabled(cacheable=true)
    public static QuoteDto getData(string recordId)
    {
        
        List<Quote__c> quotes = [select id, name, StartDate__c, endDate__C from Quote__c where id = :recordId];
        if(quotes.isEmpty() == false)
        {
            QuoteDto objQuoteDTO = new QuoteDto(quotes[0]); 
            return objQuoteDTO;
        }
        return null;
    }
    
    
    @AuraEnabled
    public static void saveData(QuoteDto dtoObjct){
        try {
            Quote__c quote = new Quote__c();
            quote.id = dtoObjct.id;
            quote.startdate__c = dtoObjct.startDate;
            quote.endDate__C = dtoObjct.endDate;
            update quote;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}