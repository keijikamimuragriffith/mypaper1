// SPDX-License-Identifier: GPL-3.0
 pragma solidity >=0.8.2 <0.9.0;
 // Example - transfer 800 tokens to another user
 contract SimpleToken {
 	mapping(address => uint256) public balanceOf;

 constructor(address recipient) {
 	balanceOf[msg.sender] = 1000;
 	require(msg.sender != recipient,
 	"Sender and recipient must be different");
 	require(balanceOf[msg.sender] >= 800,
 	"Not enough balance to transfer 800");
 	balanceOf[msg.sender] -= 800;
 	balanceOf[recipient] += 800;
 }

 function transfer(address to, uint256 amount)
 public {
 	require(balanceOf[msg.sender] >= amount,
 	"Not enough balance");
 	balanceOf[msg.sender] -= amount;
 	balanceOf[to] += amount;
 	}
 }