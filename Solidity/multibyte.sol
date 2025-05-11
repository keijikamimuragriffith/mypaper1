// SPDX-License-Identifier: GPL-3.0
 pragma solidity >=0.8.2 <0.9.0;

contract MultiByteSample {
    // saving Japanese chars
    string public message;

    // handling Japanese
    event MessageChanged(string oldMessage, string newMessage);

    // initialisation
    constructor() {
        message = unicode"こんにちは、Solidity！";
    }

    // set msg of Japanese
    function setMessage(string memory newMessage) public {
        string memory old = message;
        message = newMessage;
        emit MessageChanged(old, newMessage);
    }

    // retrieving bytes length (utf8)
    function getMessageBytesLength() public view returns (uint) {
        return bytes(message).length;
    }

    // get first byte of the msg
    function getFirstByte() public view returns (bytes1) {
        return bytes(message)[0];
    }
}

