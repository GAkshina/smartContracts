# voting


## addVoter - read
|name |type |description
|-----|-----|-----------
|name|string|
|aadharNumber|string|
This method is used to add/register voters

## Voters - view
|name |type |description
|-----|-----|-----------
||string|
This method is used to get the voter details

## declarewinningCandidate - view
_No parameters_
This method is used to declare the winning candidate.

## owner - view
_No parameters_
This variable holds the address of contract owner

## addCandidate - read
|name |type |description
|-----|-----|-----------
|name|string|
|aadharNumber|string|
|partyName|string|
This method is used to add candidate details

## Candidates - view
|name |type |description
|-----|-----|-----------
||string|
This method is used to get the candidate details

## vote - read
|name |type |description
|-----|-----|-----------
|candidateId|string|
|voterId|string|
This method is used by voter to vote against their interested candidates.

## constructor - read
_No parameters_
function Object() { [native code] }

## addingVoter - read
|name |type |description
|-----|-----|-----------
|name|string|
|aadharNumber|string|
Event for registering the voter.

## addingCandidate - read
|name |type |description
|-----|-----|-----------
|name|string|
|aadharNumber|string|
|partyName|string|
Event for registering the candidates.