//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.2;

contract Twitter {
    uint16 public max_char_in_tweet = 100;

    struct Tweet{
        uint256 id;
        address author;
        string content;
        uint timestamp;
        uint likes; 
    }

    mapping (address => Tweet[]) public tweets;
    address public owner; 

    constructor () {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "you are not the owner of the contract!");
        _;
    }

    function changeTweetLength (uint16 newLength) external onlyOwner {
        max_char_in_tweet = newLength;
    }

    function createTweet(string memory _tweet) external {

        require(bytes(_tweet).length <= max_char_in_tweet, "too long!");

        Tweet memory newTweet = Tweet({
            id: tweets[msg.sender].length,
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet); 
    }

    function likeTweet(address author, uint256 id) external {
        require(tweets[author][id].id == id,"tweet doesn't exist");
        tweets[author][id].likes++;
    }

    function dislikeTweet(address author, uint256 id) external {
        require(tweets[author][id].id == id,"tweet doesn't exist");
        tweets[author][id].likes--;
    }

    function getTweet(address _owner, uint _i) external view returns (Tweet memory) {
        return tweets[_owner][_i];
    }

    function getAllTweet(address _owner) external view returns (Tweet[] memory) {
        return tweets[_owner];
    }
}