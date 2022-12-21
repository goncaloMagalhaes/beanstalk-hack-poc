// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IAaveLendingPool {
    function flashLoan(
        address receiverAddress,
        address[] calldata assets,
        uint256[] calldata amounts,
        uint256[] calldata modes,
        address onBehalfOf,
        bytes calldata params,
        uint16 referralCode
    ) external;
}

interface ICurvePool {
    function A() external view returns (uint256 out);

    function add_liquidity(uint256[2] memory amounts, uint256 min_mint_amount) external;

    function add_liquidity(uint256[3] memory amounts, uint256 min_mint_amount) external;

    function add_liquidity(uint256[4] memory amounts, uint256 min_mint_amount) external;

    function admin_fee() external view returns (uint256 out);

    function balances(uint256 arg0) external view returns (uint256 out);

    function calc_token_amount(
        uint256[] memory amounts, 
        bool is_deposit
    ) external view returns (uint256 lp_tokens);

    function coins(int128 arg0) external view returns (address out);
    function coins(uint256 arg0) external view returns (address out);

    function underlying_coins(int128 arg0) external view returns (address out);
    function underlying_coins(uint256 arg0) external view returns (address out);

    function exchange(
        int128 i,
        int128 j,
        uint256 dx,
        uint256 min_dy
    ) external;
    function exchange(
        int128 i,
        int128 j,
        uint256 dx,
        uint256 min_dy,
        address receiver
    ) external returns (uint256);

    function exchange_underlying(
        int128 i,
        int128 j,
        uint256 dx,
        uint256 min_dy
    ) external;
    function exchange_underlying(
        address pool,
        int128 i,
        int128 j,
        uint256 dx,
        uint256 min_dy
    ) external;

    function fee() external view returns (uint256 out);

    function future_A() external view returns (uint256 out);

    function future_fee() external view returns (uint256 out);

    function future_admin_fee() external view returns (uint256 out);

    function get_dy(
        int128 i,
        int128 j,
        uint256 dx
    ) external view returns (uint256);

    function get_dy_underlying(
        int128 i,
        int128 j,
        uint256 dx
    ) external view returns (uint256);

    function get_virtual_price() external view returns (uint256 out);

    function remove_liquidity(
        uint256 token_amount, 
        uint256[3] memory min_amounts
    ) external returns (uint256[3] memory);

    function remove_liquidity_imbalance(
        uint256[3] memory amounts,
        uint256 max_burn_amount
    ) external;

    function remove_liquidity_one_coin(
        uint256 token_amount,
        int128 i,
        uint256 min_amount
    ) external;
}

interface IBeanStalk {
    function depositBeans(uint256) external;

    function emergencyCommit(uint32 bip) external;

    function deposit(address token, uint256 amount) external;

    function vote(uint32 bip) external;

    function bip(uint32 bipId) external view returns (
        address,
        uint32,
        uint32,
        bool,
        int256,
        uint128,
        uint256,
        uint256
    );

    struct FacetCut {
        address facetAddress;
        uint8 action;
        bytes4[] functionSelectors;
    }

    function propose(
        FacetCut[] calldata _diamondCut,
        address _init,
        bytes calldata _calldata,
        uint8 _pauseOrUnpause
    ) external;

    function numberOfBips() external view returns (uint32);
}