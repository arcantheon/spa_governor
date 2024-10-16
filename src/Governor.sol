// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import { GovernorVotes } from "lib/openzeppelin-contracts/contracts/governance/extensions/GovernorVotes.sol";
import { GovernorCountingSimple } from "lib/openzeppelin-contracts/contracts/governance/extensions/GovernorCountingSimple.sol";
import { Governor } from "lib/openzeppelin-contracts/contracts/governance/Governor.sol";
import { IVotes } from "lib/openzeppelin-contracts/contracts/governance/utils/IVotes.sol";

contract SperaxGovernor is GovernorVotes, GovernorCountingSimple {
    uint256 public constant ONE_HOUR = 1 hours;
    uint256 public constant QUORUM_VOTES = 100_000;

    constructor(IVotes token) GovernorVotes(token) Governor("Sperax Governor") {}

    function votingPeriod() public pure override returns (uint256) {
        return ONE_HOUR;
    }
    
    function votingDelay() public pure override returns (uint256) {
        return 0;
    }

    function quorum(uint256 /*timepoint*/) public pure override returns (uint256) {
        return QUORUM_VOTES;
    }
}
