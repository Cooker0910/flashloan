// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../interfaces/IFlashloan.sol";

abstract contract FlashloanValidation {
    modifier checkTotalRoutePart(IFlashloan.Route[] memory routes) {
        uint16 totalPart = 0;
        for (uint256 i = 0; i < uint256(routes.length); i++) {
            totalPart += routes[i].part;
        }
        require(totalPart == 10000, "Route part error");
        _;
    }

    modifier checkTotalSwapPart(IFlashloan.Swap[] memory swaps) {
        uint16 totalPart = 0;
        for (uint256 i = 0; i < uint256(swaps.length); i++) {
            totalPart += swaps[i].part;
        }
        require(totalPart == 10000, "Swap part error");
        _;
    }
}
