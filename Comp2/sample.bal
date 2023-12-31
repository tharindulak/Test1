import ballerina/graphql;

# A service representing a network-accessible GraphQL API
@display {
	label: "Comp2",
	id: "Comp2-bd7b3361-31ae-4af4-8665-46bfbe0e3154"
}
service / on new graphql:Listener(8090) {

    # A resource for generating greetings
    # Example query:
    #   query GreetWorld{ 
    #     greeting(name: "World") 
    #   }
    # Curl command: 
    #   curl -X POST -H "Content-Type: application/json" -d '{"query": "query GreetWorld{ greeting(name:\"World\") }"}' http://localhost:8090
    # 
    # + name - the input string name
    # + return - string name with greeting message or error
    resource function get greeting(string name) returns string|error {
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
