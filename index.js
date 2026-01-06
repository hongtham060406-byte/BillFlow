import { useState } from 'react';
import { ethers } from 'ethers';

export default function Home() {
  const [invoiceAmount, setInvoiceAmount] = useState('');

  // Hàm giả lập Mint Hóa Đơn
  const handleMint = async () => {
    alert("Đang tạo NFT hóa đơn... Vui lòng xác nhận ví!");
    // Logic gọi Smart Contract BillNFT sẽ nằm ở đây
    console.log("Minting invoice worth:", invoiceAmount);
  };

  // Hàm giả lập Vay Tiền
  const handleBorrow = async () => {
    alert("Đang thế chấp NFT để vay tiền...");
    // Logic gọi Smart Contract LendingPool sẽ nằm ở đây
  };

  return (
    <div className="min-h-screen bg-gray-100 p-10">
      <h1 className="text-4xl font-bold text-blue-600 mb-10">💸 BillFlow Finance</h1>
      
      <div className="grid grid-cols-2 gap-10">
        {/* Khung dành cho SME */}
        <div className="bg-white p-6 rounded-lg shadow-lg">
          <h2 className="text-2xl font-bold mb-4">SME Borrowing</h2>
          <input 
            type="number" 
            placeholder="Nhập giá trị hóa đơn (USDT)" 
            className="border p-2 w-full mb-4"
            onChange={(e) => setInvoiceAmount(e.target.value)}
          />
          <button 
            onClick={handleMint}
            className="bg-blue-500 text-white px-4 py-2 rounded mr-2 hover:bg-blue-600">
            1. Tokenize Invoice (NFT)
          </button>
          <button 
            onClick={handleBorrow}
            className="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600">
            2. Get Instant Loan
          </button>
        </div>

        {/* Khung dành cho Investor */}
        <div className="bg-white p-6 rounded-lg shadow-lg">
          <h2 className="text-2xl font-bold mb-4">Investor Pool</h2>
          <p className="mb-4">Total Value Locked (TVL): $50,000</p>
          <button className="bg-purple-500 text-white px-4 py-2 rounded w-full">
            Deposit USDT
          </button>
        </div>
      </div>
    </div>
  );
}