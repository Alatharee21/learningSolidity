// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract VotingProposals{

    enum Opinion{
        NoVote,
        Abstain,
        For,
        Against
    }

    string public proposal;
    address[] public voters;
    mapping(address => Opinion) public opinions;
    uint256 public voteCount;

    function Propose(string memory _proposal) public payable{
        require(msg.value > 1, "Can't propose for free");

        proposal = _proposal;
    }

    function vote(Opinion _opinion) public payable {
        require(opinions[msg.sender] == Opinion.NoVote, "Dude already voted");

        if(msg.value < 3){
            revert("You must have up to 3 to vote");
        }

        voters.push(msg.sender);
        opinions[msg.sender] = _opinion;
        voteCount++;
    }

    function tallyVotes() public view returns (uint256 forVotes, uint256 againstVotes, uint256 abstainVotes) {
        for (uint256 i = 0; i < voters.length; i++) {
            if (opinions[voters[i]] == Opinion.For) {
                forVotes++;
            } else if (opinions[voters[i]] == Opinion.Against) {
                againstVotes++;
            } else if(opinions[voters[i]] == Opinion.Abstain){
                abstainVotes++;
            }
        }
    }

    function getResult() public view returns(uint256){
        return voteCount;
    }// This function does same thing as "uint256 public voteCount;" declared above and may be omitted
}