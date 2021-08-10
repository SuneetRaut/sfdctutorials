public class AnimalLocator {

    public static String getAnimalNameById(Integer anInteger){
        Http http = new Http();
        String retVal = null;
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+anInteger);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<string,object> mapOfAnimals = (map<string,object>) results.get('animal');

            retVal = string.valueof(mapOfAnimals.get('name'));
        }
        return retVal;
    }
}