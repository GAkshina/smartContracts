pragma solidity >=0.4.22 <0.6.0;
pragma experimental ABIEncoderV2;


contract voting {
    address public owner;
    uint noofproposal;
    string[] CandidateID;
    struct Candidate {
        string name;
        string aadharNumber;
        string partyName;
        uint noofvotes;
    }
    
    struct Voter {
        string name;
        string aadharNumber;
        bool voted;
        bool rightToVote;
    }
    mapping(string => Candidate) public Candidates ;
    mapping(string => Voter) public Voters ;
    event addingVoter(string name,string aadharNumber);
    event addingCandidate(string name,string aadharNumber,string partyName);
   
    
    
    constructor() public {
        owner = msg.sender;
    }
    
    function addVoter(string memory name,string memory aadharNumber) public {
        if(msg.sender != owner || Voters[aadharNumber].voted) {
            revert();
        } 
        Voter memory v = Voters[aadharNumber];
        v.name=name;
        v.aadharNumber=aadharNumber;
        v.voted=false;
        v.rightToVote=true;
        emit addingVoter(name,aadharNumber);
    }
    
     function addCandidate(string memory name,string memory aadharNumber,string memory partyName) public {
        if(msg.sender != owner) {
            revert();
        } 
         Candidate memory c = Candidates[aadharNumber];
         CandidateID.push(aadharNumber);
         c.aadharNumber=aadharNumber;
         c.name=name;
         c.partyName=partyName;
         c.noofvotes=0;
         emit addingCandidate(name,aadharNumber,partyName);
    }
   
   function vote(string memory candidateId,string memory voterId) public {
     if(Voters[voterId].voted) {
            revert();
     }
     
     Candidates[candidateId].noofvotes += 1;
        
        
   }
   
   function declarewinningCandidate() public view returns (uint finalvoteCount, string memory candidateName){
       uint voteCount=0;
       
       for(uint c =0 ;c<CandidateID.length;c++) {
           if(Candidates[CandidateID[c]].noofvotes>voteCount) {
              voteCount =Candidates[CandidateID[c]].noofvotes;
              candidateName=Candidates[CandidateID[c]].name;
           }
          
           finalvoteCount=voteCount;
       }
       
   }
}