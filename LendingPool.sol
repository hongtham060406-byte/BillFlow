// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract BillFlowLendingPool is ReentrancyGuard {
    
    // Khai báo các biến State
    IERC20 public usdtToken;
    IERC721 public billNFT;
    address public owner;

    // Struct lưu thông tin khoản vay
    struct Loan {
        uint256 loanId;
        address borrower;
        uint256 amount;      // Số tiền vay
        uint256 interestRate; // Lãi suất (1%, 2%, 3%)
        uint256 startTime;
        bool isRepaid;
    }

    // Mapping từ NFT ID -> Thông tin khoản vay
    mapping(uint256 => Loan) public loans;

    // Sự kiện để Frontend bắt (Log)
    event LoanDisbursed(uint256 indexed nftId, address borrower, uint256 amount, uint256 tier);

    constructor(address _token, address _nft) {
        usdtToken = IERC20(_token);
        billNFT = IERC721(_nft);
        owner = msg.sender;
    }

    // --- HÀM CHÍNH: VAY TIỀN (Có phân loại Rủi Ro A/B/C) ---
    // _riskTier: 1 = Hạng A, 2 = Hạng B, 3 = Hạng C
    function borrow(uint256 _nftId, uint256 _invoiceValue, uint8 _riskTier) external nonReentrant {
        
        // 1. Chuyển NFT thế chấp vào Contract
        billNFT.transferFrom(msg.sender, address(this), _nftId);

        // 2. Tính toán LTV và Lãi suất dựa trên Hạng (Risk Tier)
        uint256 loanAmount;
        uint256 rate;

        if (_riskTier == 1) { 
            // Hạng A: Vay 90%, Phí 1%
            loanAmount = (_invoiceValue * 90) / 100;
            rate = 1;
        } else if (_riskTier == 2) { 
            // Hạng B: Vay 70%, Phí 2%
            loanAmount = (_invoiceValue * 70) / 100;
            rate = 2;
        } else { 
            // Hạng C: Vay 50%, Phí 3%
            loanAmount = (_invoiceValue * 50) / 100;
            rate = 3;
        }

        // 3. Lưu thông tin khoản vay
        loans[_nftId] = Loan(_nftId, msg.sender, loanAmount, rate, block.timestamp, false);

        // 4. Giải ngân USDT cho người vay (Mock Transfer)
        // Trong thực tế sẽ cần require(usdtToken.balanceOf(address(this)) >= loanAmount);
        usdtToken.transfer(msg.sender, loanAmount);

        // 5. Bắn Event ra Blockchain
        emit LoanDisbursed(_nftId, msg.sender, loanAmount, _riskTier);
    }

    // Hàm cho Nhà đầu tư nạp tiền vào Pool
    function deposit(uint256 _amount) external {
        usdtToken.transferFrom(msg.sender, address(this), _amount);
    }
}
